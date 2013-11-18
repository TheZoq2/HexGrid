
buttons = Array();

function createButton(img, scaleX, scaleY, frameWidth, frameHeight )
{
	SID = createSprite(img);
	setSpritesheet(SID, frameWidth, frameHeight);
	setSpriteScale(SID, scaleX, scaleY);

	buttons[buttons.length] = 
	{
		SID: SID
	}
}