<?php
$db = new PDO(getenv('naofode_dsn'), getenv('naofode_dbuser'), getenv('naofode_dbpass'));
date_default_timezone_set('UTC');

class Thrash {

	static $image_storage_base = "prints/";

	public $id;
	public $title;
	public $original_url;
	public $creator_host;
	public $date_created;
	public $image_owner_id;
	private $image_path;

        public function __construct($title = null, $original_url = null) {
                if ($title) $this->title = $title;
                if ($original_url) $this->original_url = $original_url;
        }

	public function get_image_path() {
		if ($this->image_owner_id) {
			$owner = Thrash::get($this->image_owner_id);
			return "{$owner->image_storage_base}{$owner->code}.png";
		} else {
			return "{$this->image_storage_base}{$this->code}.png";
		}
	}

	public function save() {
		global $db;
		$query = $db->prepare("insert into thrash (date_created, title, original_url, image_storage_base, creator_host) values (now(),:title,:url,:image_storage_base,:creator_host)");
		$query->bindParam(':title', $this->title, PDO::PARAM_STR);
		$query->bindParam(':url', $this->original_url, PDO::PARAM_STR);
		$query->bindParam(':image_storage_base', Thrash::$image_storage_base, PDO::PARAM_STR);
		$query->bindParam(':creator_host', $_SERVER['REMOTE_ADDR'], PDO::PARAM_STR);
		$query->execute();
		$this->id = $db->lastInsertId();
		$this->code = base_convert($this->id, 10, 32);
		$db->prepare("update thrash set code='{$this->code}' where id={$this->id}")->execute();
	}

	static function get($id) {
		global $db;
		$query = $db->prepare("select * from thrash where id=? limit 1");
		$query->execute(array($id));
		return array_shift($query->fetchAll(PDO::FETCH_CLASS, "Thrash"));
	}

	static function get_by_code($code) {
		global $db;
		$query = $db->prepare("select * from thrash where code=? limit 1");
		$query->execute(array($code));
		return array_shift($query->fetchAll(PDO::FETCH_CLASS, "Thrash"));
	}

	static function get_by_url($url) {
		global $db;
		$query = $db->prepare("select * from thrash where original_url=? and image_owner_id is null order by date_created desc limit 1");
		$query->execute(array($url));
		return array_shift($query->fetchAll(PDO::FETCH_CLASS, "Thrash"));
	}

	static function create($url, $title) {
		global $db;
		$db->beginTransaction();
		$old = Thrash::get_by_url($url);

		$new = new Thrash($title, $url);
	    	try { 
			$new->save();
		} catch(PDOExecption $e) { 
			print "Error!: " . $e->getMessage() . "</br>"; 
		}

		if ($old) {
			$date = DateTime::createFromFormat('Y-m-d H:i:s', $old->date_created);
			$today = new DateTime;
		}
		if ($old && $today->diff($date)->days <= 1) {
			$db->prepare("update thrash set image_owner_id={$old->id} where id={$new->id}")->execute();
		} else {
			$path = dirname(__FILE__).'/'.Thrash::$image_storage_base;
			$return = shell_exec("./capture.sh \"$url\" $path{$new->code}.png");
			if (trim($return) == "error") {
				$db->rollBack();
				header("Location: ./?error=load&url=$url");
				die();
			}
		}
		$db->commit();
		return $new;
	}

}
