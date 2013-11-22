<?php
	//Password: yws275KhtD86YAar

	function getDBO($database)
	{
		$dbh = new PDO('mysql:host=localhost;dbname=' . $database . ';charset=utf8', "hex", "yws275KhtD86YAar");

		return $dbh;
	}
?>