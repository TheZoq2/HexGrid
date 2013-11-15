var mouseX = 0;
var mouseY = 0;

var mouseFrameX;
var mouseFrameY

var oldMouseX = 0;
var oldMouseY = 0;

/*function mouseMove(e)
{
    var mouseX, mouseY;

    if(e.offsetX) {
        mouseX = e.offsetX;
        mouseY = e.offsetY;
    }
    else if(e.layerX) {
        mouseX = e.layerX;
        mouseY = e.layerY;
    }
}*/

var mouseHoldTime = 200;
var mouseDown = false;
var mouseHeld = false;
var mouseHeldFor;
var mouseHoldStart;
var mouseClick = false;
var frameScroll;
function updateInput() //Call this to get all mouse hold features working
{
	oldMouseX = mouseFrameX;
	oldMouseY = mouseFrameY;
	mouseFrameX = mouseX;
	mouseFrameY = mouseY;

	oldMOuseX = 0; //Resetting the old coridnate
	oldMOuseY = 0;
	if(mouseHeld == true)
	{
		mouseHeldFor = totalTime - mouseHoldStart;
		//Checking how long it has been held
		if(mouseHeldFor > mouseHoldTime || (getMouseMoveX() != 0 && getMouseMoveY()))
		{
			mouseDown = true;
		}
	}

	//Calculating the mouse movement
    frameScroll = scrollAmount; //Saving the amount scrolled this frame
    scrollAmount = 0;//Restoring the scroll for next frame
}

function doMouseDown(e)
{
    mouseHeld = true;

    mouseHoldStart = totalTime;
}
function doMouseUp(e)
{
    mouseHeld = false;

    mouseDown = false;

    if(mouseHeldFor < mouseHoldTime)
    {
    	mouseClick = true;
    }
}

function getMouseDown()
{
	return mouseDown;
}
function getMouseX()
{
    return mouseX / getCanvasZoom() + getOffsetX();
}
function getMouseY()
{
    return mouseY / getCanvasZoom() + getOffsetY();
}

function getMouseMoveX()
{
	var move = mouseX - oldMouseX;
	move = move * 1/getCanvasZoom();
	return move;
}
function getMouseMoveY()
{
	var move = mouseY - oldMouseY;
	move = move * 1/getCanvasZoom();
	return move;
}
function getScrollAmount()
{
    return frameScroll;
}

function doMouseMove(e){
    //Updating the x and y cordinates of the mouse
    if(e.offsetX) {
        mouseX = e.offsetX;
        mouseY = e.offsetY;
    }
    else if(e.layerX) {
        mouseX = e.layerX;
        mouseY = e.layerY;
    }
}

function keyPressed(e) {
    if (e.keyCode == 87) { //Forward
        input.up = true;
    }

    if (e.keyCode == 65) { //Left key
        input.left = true;
    }

    if (e.keyCode == 83) { //Back
        input.down = true;
    }

    if (e.keyCode == 68) { //Right
        input.right = true;
    }
    if(e.keyCode == 66)
    {
        input.build = true;
    }
}

function keyReleased(e) {
    if (e.keyCode == 87) { //Forward
        input.up = false;
    }

    if (e.keyCode == 65) { //Left key
        input.left = false;
    }

    if (e.keyCode == 83) { //Back
        input.down = false;
    }

    if (e.keyCode == 68) { //Right
        input.right = false;
    }

    if(e.keyCode == 66)
    {
        input.build = false;
    }
}

var scrollAmount = 0;
function onScroll(e)
{
    var delta = 0;

    if (!e) e = window.event;
    // normalize the delta
    if (e.wheelDelta) {
        // IE and Opera
        delta = e.wheelDelta / 60;
    } else if (e.detail) {
        // W3C
        delta = -e.detail / 2;
    }

    //console.log("Delta: " + delta);
    scrollAmount = scrollAmount + delta;
}