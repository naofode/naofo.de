<?php
$dsn = getenv('naofode_dsn');
$dbuser = getenv('naofode_dbuser');
$dbpass = getenv('naofode_dbpass');
$db = new PDO($dsn, $dbuser, $dbpass);
?>
