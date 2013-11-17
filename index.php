<?php
    require_once("map.php");

    //generateMap(25, 25);
?>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/html5reset-1.6.1.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/canvas/canvas.js"></script>
        <script src="js/canvas/drawing.js"></script>
        <script src="js/canvas/particleEffect.js"></script>
        <script src="js/canvas/input.js"></script>
        <script src="js/canvas/images.js"></script>
        <script src="js/game.js"></script>
        <script src="js/main.js"></script>
        <script src="js/requests.js"></script>
        <script src="js/dataReader.js"></script>
    </head>
    <body>
        <?php
            printMap();
        ?>
        <div class="wrapper">
            <canvas ID="c_1" width="1280" height="720">
                
            </canvas>
        </div>

        <script>
            startDrawCanvas();
        </script>
    </body>
</html>
