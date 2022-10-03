function habilitar(){
titulo = document.getElementById("Titulo").value;
autor = document.getElementById("Autor").value;
if(titulo == "" && autor== ""){
    document.getElementById("Aceptar").disabled= true;
}
else{
    document.getElementById("Aceptar").disabled= false;
}

}
titulo = document.getElementById("Titulo").addEventListener("keyup",habilitar);
autor = document.getElementById("Autor").addEventListener("keyup",habilitar);