var gameState = 0; //The current state of the game

var readyToSend = 1;

var testButton;

function mainLoop()
{
	drawUI();

	if(gameState == 0)
	{
		//Requesting map data

		createRequest("requests.php", "type=r_mapData", function(result){
			handleMapData(result);
		});

		//Requesting building data
		createRequest("requests.php", "type=r_buildingData", function(result){
			handleBuildingData(result);
		});

		testButton = createButton("img/UglyButton.png", xMax - 128, 128, 128, 128, 128, 128);

		gameState = 1;
	}
	if(gameState == 1)
	{
		if(input.build == true && readyToSend == 1)
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
		readyToSend = 1;
	}
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

		console.log("Vartype " + varType + " Var value: " + varValue);
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
				type = parseInt(type);
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