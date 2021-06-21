window.addEventListener("DOMContentLoaded", ()=>{
  if(document.getElementById("item-image")){
  const ImageList = document.getElementById("image-list");
  const createImageHTML = (blob)=>{
    const imageElement = document.createElement("div");
    const textElement  = document.createElement("p");
          textElement.setAttribute("id", "preview"),
          textElement.textContent = "プレビュー画像";

    const blobElement = document.createElement("img");

          blobElement.setAttribute('src', blob);
          blobElement.setAttribute('class','image-js-resize');
          imageElement.appendChild(textElement);
          imageElement.appendChild(blobElement);
          ImageList.appendChild(imageElement);
  };

   document.getElementById("item-image").addEventListener("change", function(e){

     const imageContent = document.querySelector("img");
     const textWithImage= document.getElementById("preview");
     if(imageContent){
       imageContent.remove();
       textWithImage.remove();
     }

     const file = e.target.files[0];
     const blob = window.URL.createObjectURL(file);

     createImageHTML(blob);
   });
  }
});

