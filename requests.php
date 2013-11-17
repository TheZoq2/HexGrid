<?php
	if(isset($_POST["type"]))
	{
		if($_POST["type"] == "r_mapData")
		{
			require_once("map.php");

			//Connecting to the map database
			require_once("connect.php");
			$dbo = getDBO("map");

			//Getting the basic info about the map
			$sqlRequest = "SELECT * FROM `base` WHERE 1";
			$stmt = $dbo->prepare($sqlRequest);
			$stmt->execute();

			$data = $stmt->fetch();
			//Saving the data about the map
			$sizeX = $data["sizeX"];
			$sizeY = $data["sizeY"];

			//Requesting the actual map data
			$sqlRequest = "SELECT * FROM `tile` WHERE 1";
			$stmt = $dbo->prepare($sqlRequest);
			$stmt->execute();

			$mapData = $stmt->fetchAll();

			$map = array();
			for($x = 0; $x < $sizeX; $x++)
			{
				$map[$x] = array();
			}

			//Going though the data
			foreach ($mapData as $tile) 
			{
				$map[$tile["posX"]][$tile["posY"]] = new Tile();
				$map[$tile["posX"]][$tile["posY"]]->setType($tile["type"]);
			}

			//Creating a string with the data to return
			$responseString = "";

			//Adding the base data
			$responseString .= "sizeX=" . $sizeX;
			$responseString .= ",sizeY=" . $sizeY;

			for($x = 0; $x < $sizeX; $x++)
			{
				for($y = 0; $y < $sizeY; $y++)
				{
					$responseString .= "|";
					$responseString .= "posX=" . $x;
					$responseString .= ",posY=". $y;
					$responseString .= ",type=". $map[$x][$y]->getType();
				}
			}

			echo $responseString; //Returning the string
			exit();
		}
		if($_POST["type"] == "r_buildingData")
		{
			returnBuildingData();
		}	
		if($_POST["type"] == "r_buildBuilding"); //Creating a new building
		{
			$posX = intval($_POST["posX"]);
			$posY = intval($_POST["posY"]);
			$type = intval($_POST["type"]);

			createBuilding($posX, $posY, $type);

			//Exit the PHP file
			exit();
		}
	}

	echo "error_noType";

	function createBuilding($posX, $posY, $type)
	{
		//Connecting to the database
		require_once("connect.php");

		$dbo = getDBO("map");

		//Creating an SQL request
		$sqlRequest = "INSERT INTO `buildings`(`id`, `posX`, `posY`, `type`) VALUES ('','" . $posX . "','" . $posY . "','" . $type . "')";

		$stmt = $dbo->prepare($sqlRequest);
		$stmt->execute();
	}

	function returnBuildingData()
	{
		//Connecting to the database
		require_once "connect.php";

		$dbo = getDBO("map");

		//Getting the content of the building table
		$sqlRequest = "SELECT * FROM `buildings` WHERE 1";

		$stmt = $dbo->prepare($sqlRequest);
		$stmt->execute();

		$buildings = $stmt->fetchAll();

		$responseString = "";

		foreach ($buildings as $building) {
			$posX = $building["posX"];
			$posY = $building["posY"];
			$type = $building["type"];

			//Adding the building to the response string
			$responseString .="posX=" . $posX;
			$responseString .=",posY=" . $posY;
			$responseString .=",type=" . $type;
			$responseString .="|";
		}

		echo $responseString;

		exit(); //The request has been awnsered, return
	}
?>