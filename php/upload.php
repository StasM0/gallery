<?php
if (!empty($_FILES)) {
    $target_dir = "../images/img_gallery/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 0;
    $out = '';
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    // Check if image file is a actual image or fake image
    //if (isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if ($check !== false) {
        //  "File is an image - " . $check["mime"] . ".<br>";
        $uploadOk = 1;
    } else {
        $out .= "File is not an image.<br>";
        $uploadOk = 0;
    }
    //  }
    //Check if file already exists
    if (file_exists($target_file)) {
        $out .= "Sorry, file already exists.<br>";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 10000000) {
        $out .= "Sorry, your file is too large.<br>";
        $uploadOk = 0;
    }

    // // Allow certain file formats
    if (
        $imageFileType !== "jpg" && $imageFileType !== "png" && $imageFileType !== "jpeg"
        && $imageFileType !== "gif"
    ) {
        $out .= "Sorry, only JPG, JPEG, PNG & GIF files are allowed.<br>";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $out .= "Sorry, your file was not uploaded.<br>";
        echo $out;
        return false;
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "The file has been uploaded.";
            return true;
        } else {
            echo "Sorry, there was an error uploading your file.";
            return false;
        }
    }
}
