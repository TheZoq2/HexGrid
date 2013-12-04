<?php
	class Building
	{
		public function __construct($type, $x, $y)
		{
			$this->type = $type;
			$this->x = $x;
			$this->y = $y;
		}

		public function printData()
		{
			echo ("Type: " . $this->type . " xPos" . $this->x . " yPos ". $this->y);
		}

		public function getType()
		{
			return $this->type;
		}
		public function getX()
		{
			return $this->x;
		}
		public function getY()
		{
			return $this->y;
		}

		private $type;
		private $x;
		private $y;
	}

	if(isset($_POST["type"]))
	{
		if($_POST["type"] == "r_turnData")
		{
			echo "makeTurn";
			exit();
		}
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
		/*if($_POST["type"] == "r_buildBuilding"); //Creating a new building
		{
			$posX = intval($_POST["posX"]);
			$posY = intval($_POST["posY"]);
			$type = intval($_POST["type"]);

			createBuilding($posX, $posY, $type);

			//Exit the PHP file
			exit();
		}*/
		if($_POST["type"] == "r_endTurn")
		{
			handleEndTurnRequest();

			exit(); //Exiting the PHP code since the request has been taken care of
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

	function handleEndTurnRequest()
	{
		//Data about buildings is sent as a string where each building is separated by |. Each building part contains sevral data fields separated by ",".
		//The data has a datatype and a value separated by "="

		//Getting the buildings
		$buildingStr = $_POST["buildings"];

		//Spliting the building string into individual buildings
		$buildingStrings = explode("|", $buildingStr);

		//Variables to store the new building
		$newBuildings = array();

		$cBuilding = 0;
		foreach($buildingStrings as $thisStr) //Going thru each of the buildings
		{
			$dataStrings = explode(",", $thisStr);

			//Variables to store building data
			$bType = -1;
			$bX = 0;
			$bY = 0;

			foreach($dataStrings as $data)
			{
				//Spliting the string into datatype and value
				$dataArray = explode("=", $data);
				//Checking what kind of data this is
				$dataType = $dataArray[0];
				switch ($dataType) {
					case 'type':
						$bType = intval( $dataArray[1] );

						break;
					case 'xPos':
						$bX = intval($dataArray[1]);
						break;
					case 'yPos':
						$bY = intval($dataArray[1]);
						break;
					default:
						# code...
						break;
				}
			}

			if($bType != -1) //Making sure the type actually exists
			{
				$newBuildings[$cBuilding] = new Building($bType, $bX, $bY);
			}
			$cBuilding++;
		}

		//Preparing to send a request to the server
		require_once("connect.php");
		$dbo = getDBO("map");

		$sqlRequest = "INSERT INTO `buildings`(`id`, `posX`, `posY`, `type`) VALUES ('',:xPos,:yPos,:type)";
		$stmt = $dbo->prepare($sqlRequest);


		//Looping through all the buildings
		foreach($newBuildings as $building)
		{
			$type = $building->getType();
			$x = $building->getX();
			$y = $building->getY();
			$stmt->bindParam(":type", $type);
			$stmt->bindParam(":xPos", $x);
			$stmt->bindParam(":yPos", $y);

			$stmt->execute();
		}
	}
?>