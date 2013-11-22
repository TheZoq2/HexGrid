
buttons = Array();

function createButton(img, x, y, scaleX, scaleY, frameWidth, frameHeight )
{
	SID = createSprite(img);
	setSpritesheet(SID, frameWidth, frameHeight);
	setSpriteScale(SID, scaleX, scaleY);
	setSpritePosition(SID, x, y);

	buttons[buttons.length] = 
	{
		SID: SID,
		x: x,
		y: y,

		scaleX: scaleX,
		scaleY: scaleY,

		hitState: 0
	};

	return buttons.length - 1;
}

function drawUI()
{
	//Looping thru the button array to draw all buttons
	for(var i = 0; i < buttons.length; i++)
	{
		//Updating the scale of the sprite to prevent resizing
		setSpriteScale(buttons[i].SID, buttons[i].scaleX / getZoom(), buttons[i].scaleY / getZoom())

		drawSpriteToScreen(buttons[i].SID);
	}
}

function checkButtonHit(buttonID)
{
	//Checking if the mouse is on the button
	
}