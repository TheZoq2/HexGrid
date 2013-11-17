var grid;
var buildings = Array();
var buildingSprites = Array();
var tileSprites = Array();

var tileSize = 126;
var tileHeight = tileSize * 2;
var tileWidth = Math.sqrt(3.0) / 2.0 * tileHeight;

var zoomAmount = 0.1;
var zoomTarget = 0.1;

var neighbours = [
	[ [+1,  0], [ 0, -1], [-1, -1], [-1,  0], [-1, +1], [ 0, +1] ],
	[ [+1,  0], [+1, -1], [ 0, -1], [-1,  0], [ 0, +1], [+1, +1] ]
	];

var input = {
	up: false,
	down: false,
	left: false,
	right: false,
	build: false
};

function setupHex()
{
	loadSprites();

	setGridSize(25, 25);

	for(var y = 0; y < grid.length; y++)
	{
		for(var x = 0; x < grid[y].length; x++)
		{
			grid[x][y].type = Math.floor(Math.random() * 2)
		}
	}
}
function loadSprites()
{
	var outline = true;
	
	tileSprites[0] = createSprite("img/low/HexTile.png");
	setSpriteScale(tileSprites[0], 256, 256);
	tileSprites[1] = createSprite("img/low/GrassTile.png");
	setSpriteScale(tileSprites[1], 256, 256);
	tileSprites[2] = createSprite("img/low/RedTile.png");
	setSpriteScale(tileSprites[2], 256, 256);
	
	if(outline == true)
	{
		//tileSprites[0] = createSprite("img/low/TileTrans.png");
		//tileSprites[1] = createSprite("img/TileTransGrass.png");	
		//tileSprites[1] = createSprite("img/low/GrassTile.png");
	}

	for(var i = 0; i < tileSprites.length; i++)
	{
		setSpriteScale(tileSprites[i], 256, 256);
	}

	buildingSprites[0] = createSprite("img/olja.png");
	setSpriteScale(buildingSprites[0], 150, 150);
}

function drawHex()
{
	//drawSprite(tileSprites[0]);
	for(var y = 0; y < grid.length; y++)
	{
		var xOffset = 0;
		//Calculating the offset on the x axis
		if(y % 2 == 1)
		{
			xOffset = tileWidth / 2;
		}

		for(var x = 0; x < grid[y].length; x++)
		{
			var xCoord = x * tileWidth + xOffset;
			var yCoord = y * tileHeight * 3/4;
			if(xCoord > getScreenStartX() - tileWidth && xCoord < getScreenEndX() + tileWidth && yCoord > getScreenStartY() - tileHeight && yCoord < getScreenEndY() + tileHeight)
			{
				var tileType = grid[x][y].type;
				setSpritePosition(tileSprites[tileType], xCoord, yCoord)

				drawSprite(tileSprites[tileType]);
			}
		}
	}

	//var mouseTileX = hexFromCordX(getMouseX(), getMouseY());
	//var mouseTileY = hexFromCordY(getMouseX(), getMouseY());
	//grid[mouseTileX, mouseTileY].type = 1;
	//grid[mouseTileX][mouseTileY].type = 1;

	//Highlighting neighbours
	/*var closeTiles = getNeighbours(mouseTileX, mouseTileY);
	for(var i = 0;  i < closeTiles.length; i++)
	{
		if(closeTiles[i].x >= 0 && closeTiles[i].x < grid.length)
		{
			if(closeTiles[i].y >= 0 && closeTiles[i].y < grid[closeTiles[i].x].length)
			{
				//grid[closeTiles[i].x][closeTiles[i].y].type = 2;
			}
		}
	}*/
}

function drawBuildings()
{
	for(var i = 0; i < buildings.length; i++)
	{
		var buildingType = buildings[i].type;
		var xCoord = hexFromCordX(buildings[i].x)
		var yCoord = hexFromCordY(buildings[i].y);
		var sprite = buildingSprites[buildingType];
		setSpritePosition(sprite, xCoord, yCoord);
		drawSprite(sprite)
	}
}

function gameInput()
{
	var offsetScrollSpeed = 10 * speedMod;
	if(input.up == true)
	{
		offsetY = offsetY - offsetScrollSpeed;
	}
	if(input.down == true)
	{
		offsetY = offsetY + offsetScrollSpeed;
	}

	if(input.left == true)
	{
		offsetX = offsetX - offsetScrollSpeed;
	}
	if(input.right == true)
	{
		offsetX = offsetX + offsetScrollSpeed;
	}

	if(getMouseDown())
	{
		offsetX = offsetX - getMouseMoveX();
		offsetY = offsetY - getMouseMoveY();
	}

	zoomTarget = zoomTarget + getScrollAmount() / 20 * getCanvasZoom();

	var zoomPerFrame = 0.01 * speedMod;
	if(zoomTarget>zoomAmount + zoomPerFrame)
	{
		zoomAmount = zoomAmount + zoomPerFrame;
	}
	else if(zoomTarget < zoomAmount - zoomPerFrame)
	{
		zoomAmount = zoomAmount - zoomPerFrame;
	}
	setCanvasZoom(getZoom());
}
function getZoom()
{
	return zoomAmount;
}

function getNeighbours(xTile, yTile)
{
	var result = Array();
	//Checking if this is an odd or even row
	var mod = yTile % 2;
	for(var i = 0; i < neighbours[mod].length; i++)
	{
		result[i] = 
		{
			x: xTile + neighbours[mod][i][0],
			y: yTile + neighbours[mod][i][1]
		}
	}

	return result;
}

function setGridSize(xSize, ySize)
{
	grid = Array();

	for(var y = 0; y < ySize; y++) //Going through the y
	{
		grid[y] = Array(); //Creating an array in the slot
		for(var x = 0; x < xSize; x++) //Going through the x axis
		{
			grid[y][x] = {
				type: 0
			};
		}
	}
}

function hexFromCordX(xCoord, yCoord)
{
	var lowDist = 1000000;
	var lowX = -1;
	var lowY = -1;
	for(var y = 0; y < grid.length; y++)
	{
		var xOffset = 0;
		//Calculating the offset on the x axis
		if(y % 2 == 1)
		{
			xOffset = tileWidth / 2;
		}

		for(var x = 0; x < grid[y].length; x++)
		{
			var xPos = x * tileWidth + xOffset;
			var yPos = y * tileHeight * 3/4;
			
			var distX = xCoord - xPos;
			var distY = yCoord - yPos;

			var totDist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));

			//Checking if the tile is closer
			if(totDist < lowDist)
			{
				lowDist = totDist;
				lowX = x;
				lowY = y;
			}
		}
	}

	return lowX;
}

function hexFromCordY(xCoord, yCoord)
{
	var lowDist = 1000000;
	var lowX = -1;
	var lowY = -1;
	for(var y = 0; y < grid.length; y++)
	{
		var xOffset = 0;
		//Calculating the offset on the x axis
		if(y % 2 == 1)
		{
			xOffset = tileWidth / 2;
		}

		for(var x = 0; x < grid[y].length; x++)
		{
			var xPos = x * tileWidth + xOffset;
			var yPos = y * tileHeight * 3/4;
			
			var distX = xCoord - xPos;
			var distY = yCoord - yPos;

			var totDist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));

			//Checking if the tile is closer
			if(totDist < lowDist)
			{
				lowDist = totDist;
				lowX = x;
				lowY = y;
			}
		}
	}

	return lowY;
}

function coordFromHexX(x, y)
{
	var xOffset = 0;
	//Calculating the offset on the x axis
	if(y % 2 == 1)
	{
		xOffset = tileWidth / 2;
	}

	var xCoord = x * tileWidth + xOffset;
	var yCoord = y * tileHeight * 3/4;

	return xCoord;
}
function coordFromHexY(xCoord, yCoord)
{
	var xOffset = 0;
	//Calculating the offset on the x axis
	if(y % 2 == 1)
	{
		xOffset = tileWidth / 2;
	}

	var xCoord = x * tileWidth + xOffset;
	var yCoord = y * tileHeight * 3/4;

	return yCoord;
}