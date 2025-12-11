function mostrartext() {
  document.getElementById("mostrar").textContent = "Hola!";
}

function canvicolor() {
  document.getElementById("mostrar").style.color = "red";
}

function inputext(){
  let output = document.getElementById("outputext")
  output.textContent = document.getElementById("inputext").value
}

function mesmida(){
  document.getElementById("mida").style.fontSize = (5 + parseInt(document.getElementById("mida").style.fontSize)) + "px";
}

function suma(){
  document.getElementById("outputsuma").textContent = Number(document.getElementById("num1").value) + Number(document.getElementById("num2").value)
}

function sumamasmas(){
  document.getElementById("sumauno").textContent = 1 + Number(document.getElementById("sumauno").value);
}


function getNelements(){
  document.getElementById("nelements").textContent = document.getElementsByTagName("article").length
}

function canviimatge(){
  document.getElementById("img").src = "image2.png"
}

function addli(){
  document.getElementById("ulista").appendChild(document.createElement("li"))
}

function canvidetext(){
  document.getElementById("head").textContent = document.getElementById("head").textContent + " jaja hola"
}