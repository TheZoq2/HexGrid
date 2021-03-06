var ballX = Array();
var ballY = Array();
var ballS = Array();

xMax = 1280;
yMax = 720;

function startDrawCanvas(){
    //Must be done before anything else
    if(canLoaded == false){
        createCanvas();
        
        clearColor = "#000000"
        drawColor = "#00FF00"
        
        canLoaded = true;
    }
    
    //Adapting the width and height
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    
    xMax = canvas.width;
    yMax = canvas.height;
    
    setInterval(function(){drawCanvas()}, 1000/60);

    setupHex();

    //Starting input handeling
    document.onkeydown = keyPressed;
    document.onkeyup = keyReleased;

    document.addEventListener("mousedown", doMouseDown, false);
    document.addEventListener("mouseup", doMouseUp, false);
    //Supporting scroll wheel
    document.addEventListener('DOMMouseScroll', onScroll, false)
    document.onmousewheel = onScroll; //Yeay for browsers!!!
}

function drawCanvas(){
    cls();
    updateInput();

    drawHex();

    timing();

    gameInput();

    drawTextToScreen("Speed mod: " + speedMod, 20, 20);
}

//Timing functions
var timer = new Date();
newTime = 0;
frameTime = 0;
var speedMod; // This constant will be used to fix lag and for timer based movment
var totalTime = 0; //This variable will be increased every time the frame is updated to keep track of the time the game has been running
var FPS;

function timing() {
    //////////////////////////////////////////////////////////////
    //Updating the frametime
    timer = (new Date);

    oldTime = newTime;
    newTime = timer.getMilliseconds();

    if (oldTime > newTime) {
        newTime = newTime + 1000;
    }

    frameTime = newTime - oldTime;

    totalTime = totalTime + frameTime;

    //Reseting the new time
    if (newTime > 1000) {
        newTime = newTime - 1000
    }

    speedMod = frameTime / 16.6;
}