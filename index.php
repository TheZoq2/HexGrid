<?php
    require_once("map.php");

    generateMap(25, 25);
?>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/html5reset-1.6.1.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/game.css"/>
        <script src="js/canvas/canvas.js"></script>
        <script src="js/canvas/drawing.js"></script>
        <script src="js/canvas/particleEffect.js"></script>
        <script src="js/canvas/input.js"></script>
        <script src="js/canvas/images.js"></script>
        <script src="js/game.js"></script>
        <script src="js/main.js"></script>
        <script src="js/requests.js"></script>
        <script src="js/dataReader.js"></script>
        <script src="js/UI.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <canvas ID="c_1" width="1280" height="720">
                
            </canvas>
        </div>

        <div id="UI_rightBar">
        </div>
        <div id="UI_controlBar">
            <a id="UI_b_endTurn" href="#">

            </a>
        </div>

        <script>
            startDrawCanvas();
        </script>
    </body>
</html>
