var gameState = 0; //The current state of the game

var readyToSend = 1;

var lastUpdateRequest = 0;
var requestInterval = 1000; //The amount of time in miliseconds to wait before making a new uptade request

var selTool = 0;
var selID = 0;

function mainLoop()
{
	if(gameState == 0)
	{
		requestMap();

		setupUI();

		gameState = 1;
	}
	if(gameState == 1) //The users turn
	{
		/*if(input.build == true && readyToSend == 1)
		{
			var hexX = hexFromCordX(getMouseX(), getMouseY());
			var hexY = hexFromCordY(getMouseY(), getMouseY());

			//console.log(hexFromCordX(5));

			if(hexX != -1 && hexY != -1)
			{
				function onResponse()
				{
					if(request.readyState == 4)
					{
						readyToSend = 1;
					}
				}
			}

			readyToSend = 0;
		}
		readyToSend = 1;*/

		//if a building is selected
		if(selTool == 1)
		{
			drawTextToScreen("Current selected: " + selID, 20, 20);	
			//Getting the current cordinates
			var xHex = hexFromCordX(getMouseX(), getMouseY());
			var yHex = hexFromCordY(getMouseX(), getMouseY());
			var xCoord = coordFromHexX(xHex, yHex);
			var yCoord = coordFromHexY(xHex, yHex);
			drawTextToScreen("xCoord: " + xCoord, 20, 40);
			//Placing a building ghost at the cordinates
			setSpritePosition(buildingData[selID].SID, xCoord, yCoord);
			drawSprite(buildingData[selID].SID);

			//Checking if the player wants to place the building
			if(getMouseClick() == 1)
			{
				addTurnBuilding(selID, xHex, yHex);
			}

		}
	}
	if(gameState == 2) //waiting for turn
	{
		drawTextToScreen("totalTime " + totalTime, 20, 20);
		if(totalTime > lastUpdateRequest + requestInterval) //Checking if an update request has been sent recently
		{
			//Sending a request to the server requesting turn data
			createRequest("requests.php", "type=r_turnData", onTurnUpdate);

			lastUpdateRequest = totalTime;
		}
	}
}

function requestMap()
{
	//Requesting map data

	createRequest("requests.php", "type=r_mapData", function(result){
		handleMapData(result);
	});

	//Requesting building data
	createRequest("requests.php", "type=r_buildingData", function(result){
		handleBuildingData(result);
	});
}

function handleMapData(data) //Takes care of map data that is returned from the server
{
	//Separating the data in the result
	var strings = data.split("|");

	//Reading the first data which hopefully contains sizes
	var varArray = separateVariables(strings[0]);
	for(var i = 0; i < varArray.length; i++)
	{
		var varType = getVarType(varArray[i]);
		var varValue = getVarValue(varArray[i]);
	}

	for(var i = 1; i < strings.length; i++) //Reading the actual map data from the result
	{
		var posX = -1;
		var posY = -1;
		var type = 0;

		var varArray = separateVariables(strings[i]);
		for(var n = 0; n < varArray.length; n++)
		{
			var varType = getVarType(varArray[n]);
			var varValue = getVarValue(varArray[n]);

			if(varType == "posX")
			{
				posX = parseInt(varValue);
			}

			if(varType == "posY")
			{
				posY = parseInt(varValue);
			}

			if(varType == "type")
			{
				type = parseInt(varValue);
			}
		}

		if(posX != -1 && posY != - 1) //Making sure no data is misisng
		{
			grid[posX][posY].type = type;
		}
	}
}

function handleBuildingData(data)
{
	//Separating datagroups
	var buildingStr = data.split("|");

	for(var i = 0; i < buildingStr.length; i++)
	{
		varArray = separateVariables(buildingStr[i]);

		var posX = -1;
		var posY = -1;
		var type = 0;

		for(var n = 0; n < varArray.length; n++) //Going thru all the variables in the data section
		{
			var varType = getVarType(varArray[n]);
			var varValue = getVarValue(varArray[n]);

			if(varType == "posX")
			{
				posX = parseInt(varValue);
			}
			if(varType == "posY")
			{
				posY = parseInt(varValue);
			}

			if(varType == "type")
			{
				type = parseInt(varValue);
			}
		}

		if(posX != -1 && posY != -1) //Making sure type and positions are relevant
		{
			//Adding the building to the building array
			buildings[i] = {
				x: posX,
				y: posY,
				type: type
			};
		}
	}
}

function onTurnUpdate(data) //Function to run when a response from an update request has been sent
{
	if(data == "waitingForOthers") //If it is not the clients turn
	{

	}
	else if(data == "makeTurn") //If its the clients turn
	{
		gameState = 1;
	}
}

var endRequest;

function endTurn() //This function is run when the user ends the tiurn
{
	//Sending data about new buildings created this turn
	var endTurnRequest = "type=r_endTurn&buildings=";
	for(var i = 0; i < getTurnBuildingAmount(); i++)
	{
		var turnBuilding = getTurnBuildingAt(i);
		endTurnRequest += "type=" + turnBuilding.type + ",";
		endTurnRequest += "xPos=" + turnBuilding.x + ",";
		endTurnRequest += "yPos=" + turnBuilding.y;

		endTurnRequest += "|"
	}

	//Sending that data
	endRequest = createRequest("requests.php", endTurnRequest, function(response){
		console.log(response);

		//Sending a request for the updated map
		requestMap();
	});

	//Clearing buildings constructed this turn
	turnBuildings = Array();

	gameState = 2;
}