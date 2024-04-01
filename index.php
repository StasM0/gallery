<?php include("php/PDOStuff.php");
include("php/gallery.php"); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="interactive-widget" content="resizes-content">
    <link rel="stylesheet" href="styles/layout.css">
    <link rel="stylesheet" href="styles/gallery.css">
    <link rel="stylesheet" href="styles/form.css">
    <link rel="stylesheet" href="styles/media.css">
    <title>Gallery</title>
</head>

<body>
    <div id="container">
        <div id="header">
            <p>Gallery</p><img id="addImage" onclick="addImage()" src="images/plus-gallery.svg">
        </div>
        <main>
            <div class="wrapper">
                <div id="photos"><?php echo $out; ?></div>
                <div class='big' id='big'></div>
                <div id="formDiv"></div>
            </div>
        </main>
    </div>
    <script src="scripts/gallery.js"></script>
</body>

</html>