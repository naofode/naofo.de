<?php
$db = new PDO(getenv('naofode_dsn'), getenv('naofode_dbuser'), getenv('naofode_dbpass'));
date_default_timezone_set('UTC');

class Thrash {

	static $url = "http://naofo.de/";
	static $image_storage_base = "prints/";
	static $blocked_domains_regex = '/(uol.)|(folha.)/';

	public $id;
	public $code;
	public $title;
	public $original_url;
	public $creator_host;
	public $date_created;
	public $image_owner_id;
	public $blocked_domain;
	public $slices;
	private $image_path;

	public function __construct($title = null, $original_url = null) {
	        if ($title) $this->title = $title;
	        if ($original_url) $this->original_url = $original_url;
	}

	public function get_url() {
		return Thrash::$url . $this->code;
	}

	public function get_image_path() {
		if ($this->image_owner_id) {
			$owner = Thrash::get($this->image_owner_id);
			if ($owner->slices > 0) {
				$res = array();
				for ($i = 0; $i < $owner->slices; $i ++) {
					array_push($res, "{$owner->image_storage_base}{$owner->code}_$i.png");
				}
				return $res;
			} else return array("{$owner->image_storage_base}{$owner->code}.png");
		} else {
			if ($this->slices > 0) {
				$res = array();
				for ($i = 0; $i < $this->slices; $i ++) {
					array_push($res, "{$this->image_storage_base}{$this->code}_$i.png");
				}
				return $res;
			} else return array("{$this->image_storage_base}{$this->code}.png");
		}
	}

	public function save() {
		global $db;
		$query = $db->prepare("insert into thrash (date_created, title, original_url, image_storage_base, creator_host, blocked_domain) values (now(),:title,:url,:image_storage_base,:creator_host,:blocked_domain)");
		$query->bindParam(':title', $this->title, PDO::PARAM_STR);
		$query->bindParam(':url', $this->original_url, PDO::PARAM_STR);
		$query->bindParam(':image_storage_base', Thrash::$image_storage_base, PDO::PARAM_STR);
		$query->bindParam(':creator_host', $_SERVER['REMOTE_ADDR'], PDO::PARAM_STR);
		$query->bindParam(':blocked_domain', $this->blocked_domain, PDO::PARAM_BOOL);
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

		$new = new Thrash($title, $url);
		$new->blocked_domain = false; //Temporariamente desabilitado pois voltaram a funcionar os dominios - preg_match(Thrash::$blocked_domains_regex, $url) ? 1 : 0;

		$old = $new->blocked_domain ? null : Thrash::get_by_url($url);

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
		} else if (!$new->blocked_domain) {
			$basePath = $_SERVER['DOCUMENT_ROOT'].dirname($_SERVER['PHP_SELF']).'/';
			$path = $basePath.Thrash::$image_storage_base;
			$return = shell_exec($basePath."capture.sh \"$url\" $path{$new->code}.png");
			$sliceHeight = 768;
			$info = getimagesize("$path{$new->code}.png");
			if (!$info) {
				$db->rollBack();
				die("rm $path{$new->code}.png");
				header("Location: ./?error=load&url=$url");
				die();
			} else if ($info[1] > $sliceHeight) {
				$slices = ceil($info[1]/$sliceHeight);
				shell_exec($basePath."slice.sh $path{$new->code} $slices");
				$db->prepare("update thrash set slices=$slices where id={$new->id}")->execute();
			}
			shell_exec($basePath."optimize.sh $path{$new->code}.png");
		}
		$db->commit();
		return $new;
	}

}
