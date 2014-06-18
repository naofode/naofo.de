<?php
if (filter_var($_GET['url'], FILTER_VALIDATE_URL))
	echo file_get_contents($_GET['url']);
else die("invalid request");
