<?php
	function getDBO($database)
	{
		$dbh = new PDO('mysql:host=localhost;dbname=' . $database . ';charset=utf8', "root", "");

		return $dbh;
	}
?>