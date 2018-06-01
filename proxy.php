<?php

require "vendor/autoload.php";
$dotenv = new Dotenv\Dotenv(__DIR__);
$dotenv->load();

require("lib/Thrash.class.php");

if (filter_var($_GET['url'], FILTER_VALIDATE_URL)) {
	if (preg_match(Thrash::$blocked_domains_regex, $_GET['url'])) die("blocked domain");
	else echo file_get_contents($_GET['url']);
}
else die("invalid request");
