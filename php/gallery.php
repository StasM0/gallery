<?php

function insertStuff($pdo, &$warning)
{
    $sql = "INSERT INTO `gallery` ( `title`, `description`, `location`, `tags`, `path`) VALUES (?,?,?,?,?)";
    $pdo->IUDStuff($sql, $_POST["title"], $_POST["description"], $_POST["location"], $_POST["tags"], $_POST["path"]);
    if (!empty($pdo->error)) {
        $warning .= $pdo->error;
        return $warning;
    } else {
        header("Location:http://localhost/gallery/index.php");
    }
}
$pdo = new PDOStuff('gallery');
$warning = '';
if (isset($_POST["title"])) {
    insertStuff($pdo, $warning);
}
$out = '';
$pdo->fetchAllStuff('gallery');
$photos = $pdo->result;
for ($x = 0; $x < count($photos); $x++) {
    if (file_exists($photos[$x]["path"])) {
        $exifData = exif_read_data($photos[$x]["path"]);
        $exif = array();
        if (!empty($exifData['Make']) && !empty($exifData['Model'])) {
            $exif["make"] = $exifData["Make"];
            $exif["model"] = $exifData["Model"];
        }
        if (!empty($exifData['COMPUTED']['ApertureFNumber'])) {
            $exif['apertureFNumber'] = $exifData['COMPUTED']['ApertureFNumber'];
        }
        if (!empty($exifData['FocalLengthIn35mmFilm'])) {
            $exif['focalLength'] = $exifData['FocalLengthIn35mmFilm'];
        }
        if (!empty($exifData['DateTimeOriginal'])) {
            $exif['dateTime'] = $exifData['DateTimeOriginal'];
        }
        $exif['fileName'] = $exifData['FileName'];
        $exif['width'] = $exifData['COMPUTED']['Width'];
        $exif['height'] = $exifData['COMPUTED']['Height'];
        $exif["fileSize"] = round($exifData['FileSize'] / 1048576, 2);
        $exif["mp"] = round($exifData['COMPUTED']['Width'] * $exifData['COMPUTED']['Height'] / 1000000);
        if (!empty($exifData['ExposureTime'])) {
            $exif['exposureTime'] = $exifData['ExposureTime'];
        }
        if (!empty($exifData['ShutterSpeedValue'])) {
            $exif['shutterSpeedValue'] = $exifData['ShutterSpeedValue'];
        }
        if (!empty($exifData['ISOSpeedRatings'])) {
            $exif['ISO'] = $exifData['ISOSpeedRatings'];
        }
        $photos[$x]["exif"] = $exif;
        $out .= '<div class="photo"  onclick="showFullImg(this,photos)" onmouseover="showOverlay(this)" onmouseout="hideOverlay(this)">
                <img class="gallery"  src="' . $photos[$x]['path'] . '">
                <div class="overlay" >
                    <p class="name">
                    ' . $photos[$x]['title'] . '</p>
                </div>
            </div>';
    } else {
        $warning .= $photos[$x]["path"] . " was not found on a device thus could not be loaded.";
    }
}
?>
<script>
    console.log("<?php echo $warning; ?>");
    const photos = <?= json_encode($photos); ?>;
</script>