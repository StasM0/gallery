function cancel(event) {
  event.preventDefault();
  const div = document.getElementById("formDiv");
  div.innerHTML = "";
  div.removeAttribute("style");
  let container = document.getElementsByTagName("body")[0];

  container.removeAttribute("style");
}
const getFileName = (event) => {
  const files = event.target.files;
  const fileName = files[0].name;
  let path = "images/img_gallery/" + fileName;
  let fileInput = document.getElementById("file");
  let file = fileInput.files[0];

  let reader = new FileReader();

  // Define a function to execute when the file is loaded
  reader.onload = function (event) {
    // Create a new image element
    var img = document.createElement("img");
    img.id = "preview";

    // Set the src attribute of the image to the data URL representing the file contents
    img.src = event.target.result;

    // Append the image to a container element on the webpage
    document.getElementById("formDiv").appendChild(img);
  };
  reader.readAsDataURL(file);

  var viewportWidth = window.innerWidth || document.documentElement.clientWidth;
  var viewportHeight = window.innerHeight || document.documentElement.clientHeight;

  // Perform actions based on the dimensions

  // Perform actions based on viewport size
  if (viewportWidth == 768) {
    // Small viewport
  } else if (viewportWidth < 920) {
    // Medium viewport
    document.getElementById("formDiv").style.gridTemplateRows = "1fr 1fr";
  } else {
    // Large viewport
    document.getElementById("formDiv").style.gridTemplateColumns = "1fr 1fr";
  }
  document.getElementById("path").value = path;
};
function submit(btn) {
  const form = document.getElementById("newImgForm");
  if (form.checkValidity()) {
    btn.disabled = true;
    let xhttp = new XMLHttpRequest();
    //xhttp.onload = function () {};
    let fileInput = document.getElementById("file");
    let file = fileInput.files[0];
    var formData = new FormData();

    formData.append("fileToUpload", file);

    xhttp.open("POST", "php/upload.php");

    xhttp.send(formData);
    xhttp.onload = function () {
      console.log("Sent"); // Handle response from the server if needed
      if (this.responseText == "The file has been uploaded.") {
        //document.getElementById("wrapper").innerHTML += this.responseText;
        setTimeout(function () {
          form.submit();
        }, 500);
        //window.location.href = "http://localhost/VSC/gallery/index.php";
        // Submit the form after XMLHttpRequest is done
      } else {
        document.getElementById("wrapper").innerHTML += this.responseText;
        const timeOut = setTimeout(function () {
          window.location.href = "http://localhost/VSC/gallery/index.php";
        }, 3000);
      }
    };
  }
}
function addImage() {
  const div = document.getElementById("formDiv");
  div.style = "display:grid";

  div.innerHTML = `<div id="wrapper">
  <form action="" method="post" id="newImgForm">
      <div id="inputs">
          <div id="titleDiv">
              <label for="title">Title* </label>
              <input required type="text" id="title" onKeyUp="validate(this)" name="title">
          </div>
      
          <div id="descrDiv">
              <label for="description">Description </label>
              <!---<input type="text" id="description" name="description"> -->
              <textarea name="description" id="description" cols="30" rows="3"></textarea>
          </div>
      
          <div id="locationDiv">
              <label for="location">Location </label>
              <input type="text" id="location" name="location">
          </div>
  
          <div id="tagsDiv">
              <label for="tags">Tags*</label>
              <input onKeyUp="validate(this)" placeholder="starts with a hash(#) and is separated by space" required type="text" id="tags" name="tags">
          </div>
          <input type="hidden" id="path" value="" name="path" >
      </div>
  </form>
  <form action="" method="post" id="FileForm" enctype="multipart/form-data">
      <input type="file" required name="fileToUpload" id="file">
  </form>
  <div id="btns">
      <button name="cancel" onclick="cancel(event)" >Cancel</button>
      <button type="button" onclick="submit(this)" name="submit" id="submit">Add</button>
  </div> 
</div>`;
  document.getElementById("file").addEventListener("change", getFileName);
  document.getElementsByTagName("body")[0].style.overflow = "hidden";
}
function validate(el) {
  if (el.value.length < 2) {
    el.style.borderBottom = "1px red solid";
  } else {
    el.removeAttribute("style");
  }
}
function showOverlay(photoElement) {
  let overlay = photoElement.querySelector(".overlay");
  if (overlay) {
    overlay.style.display = "flex";
  }
}
function hideOverlay(photoElement) {
  let overlay = photoElement.querySelector(".overlay");
  if (overlay) {
    overlay.style.display = "none";
  }
}
function closeImg() {
  let div = document.getElementById("big");
  let container = document.getElementsByTagName("body")[0];
  div.removeAttribute("style");
  container.removeAttribute("style");
  div.innerHTML = "";
}

function showFullImg(div, photos) {
  const photo = photos.find(function (photo) {
    if (photo.path == div.querySelector(".gallery").getAttribute("src")) {
      return photo;
    }
  });
  let out;
  out = `<button id='cross'  class='toggle' onclick='closeImg()'><img id='inCross' src='images/cross.png'></button>
   <div id='bigImgDiv'><img class='bigImg toggle' src='${photo.path}'></div>
  <div class="photoInfo">
      <div class="dbInfo">
          <div class='photoTitle'>${photo.title}</div>`;
  if (photo.description) {
    out += `<div class="photoDescr">${photo.description}</div>`;
  }
  out += `
  </div>

      <div class="photoDetails">
        <div class="photoCameraChar grid">`;
  if (photo.exif.make && photo.exif.model) {
    out += `<img src="images/camera-icon.png">
                  <div class="photoCameraModel">${photo.exif.make} ${photo.exif.model}</div>`;
  }
  out += "<span>";
  if (photo.exif.apertureFNumber) {
    out += photo.exif.apertureFNumber + " ";
  }
  if (photo.exif.focalLength) {
    out += photo.exif.focalLength + " mm";
  }
  out += `</span>
        </div>`;
  if (photo.exif.dateTime) {
    out += `<div class="photoDateInfo grid">
          <img src="images/calendar-icon.png">
          <div class="photoDate">${photo.exif.dateTime.substr(0, 7).replace(":", ".")}.${photo.exif.dateTime.substr(8, 2)}</div>
          <span>${photo.exif.dateTime.substr(10, 6)}</span>
        </div>`;
  }
  out += `<div class="photoFileInfo grid">
          <img src="images/image-icon.png">
          <div class="photoFileName">${photo.exif.fileName}</div> 
          <span>${photo.exif.mp} MP · ${photo.exif.width} × ${photo.exif.height} · ${photo.exif.fileSize} MB</span>
        </div>
        <div class="photoSettings">`;
  if (photo.exif.exposureTime) {
    out += `<img src="images/shutter-icon.png">
           <div class="photoExposure">${photo.exif.exposureTime}</div>`;
  }
  if (photo.exif.shutterSpeedValue) {
    out += '<div class="photoShutter">' + photo.exif.shutterSpeedValue + "</div>";
  }
  if (photo.exif.ISO) {
    out += '<div class="photoISO">' + photo.exif.ISO + "</div>";
  }
  out += `</div>

    </div>
    <div class="dbInfo"><div class="photoLocation">${photo.location}</div>
  <div class="photoTags">${photo.tags}</div></div>
  </div></div>`;
  document.getElementById("big").innerHTML = out;
  document.getElementById("big").style.display = "grid";
  document.getElementsByTagName("body")[0].style.overflow = "hidden";
}
