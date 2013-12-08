<?php
	class Tile
	{
		public $type;

		public function __construct()
		{
		}
		public function setType($type)
		{
			$this->type = $type;
		}
		public function getType()
		{
			return $this->type;
		}
	}

	function generateMap($sizeX, $sizeY)
	{
		$map = Array();
		
		for($y = 0; $y < $sizeY; $y++)
		{
			$map[$y] = Array();
			for($x = 0; $x < $sizeX; $x++)
			{
				$map[$y][$x] = new Tile;

				if(rand(0,20) == 1)
				{
					$map[$y][$x]->setType(2);
				}
				elseif(rand(0, 20) == 1)
				{
					$map[$y][$x]->setType(3);
				}
				else
				{
					$map[$y][$x]->setType(1);
				}
			}
		}
		//Database
		require_once "connect.php";

		$dbh = getDBO("map");

		//Saving base map data
		$sqlRequest = "UPDATE `base` SET `index`=1,`sizeX`=" . $sizeX . ",`sizeY`=" . $sizeY . " WHERE `index`=1";

		$stmt = $dbh->prepare($sqlRequest);
		$stmt->execute();

		$cID = 1;

		//$sqlRequest = "UPDATE `tile` SET `posX`=:posX,`posY`=:posY,`type`=:type WHERE `id`=:ID;";
		//$stmt = $dbh->prepare($sqlRequest);

		for($y = 0; $y < $sizeY; $y++)
		{
			for($x = 0; $x < $sizeX; $x++)
			{
				$type = $map[$x][$y]->getType();
				$ID = $cID;
				
				/*
				//Setting the parameters for the SQL request
				$stmt->bindParam(":type", $ID);
				$stmt->bindParam(":ID", $ID);
				$stmt->bindParam(":posX", $x);
				$stmt->bindParam(":posY", $y);

				$stmt->execute();
				*/

				$sqlRequest = "UPDATE `tile` SET `posX`=" . $x . ",`posY`= " . $y . ",`type`=" . $type . " WHERE `id`=" . $cID . ";";
				$stmt = $dbh->prepare($sqlRequest);
				$stmt->execute();

				$cID++;
			}
		}
	}

	function printMap()
	{
		require_once "connect.php";
		

		$dbh = getDBO("map");
		$sqlRequest = "SELECT * FROM `base` WHERE 1";


		$stmt = $dbh->prepare($sqlRequest);
		$stmt->execute();

		$base = $stmt->fetch();
		
		$sizeX = $base["sizeX"];
		$sizeY = $base["sizeY"];

		$map = array();
		for($y = 0; $y < $sizeY; $y++)
		{
			$map[$y] = array();
			for($x = 0; $x < $sizeX; $x++)
			{
				$map[$y][$x] = new Tile;

				//$map[$x][$y] = 5;
			}
		}

		$sqlRequest = "SELECT * FROM `tile` WHERE 1";

		$stmt = $dbh->prepare($sqlRequest);
		$stmt->execute();

		$tiles = $stmt->fetchAll();
		//print_r($map[2][0]);

		foreach($tiles as $tile)
		{
			$posX = $tile["posX"];
			$posY = $tile["posY"];

			if($posX >= 0 && $posX < $sizeX && $posY >= 0 && $posY < $sizeY)
			{
				$map[ $posX ][ $posY ]->setType($tile["type"]);
			}
		}
	}
?>