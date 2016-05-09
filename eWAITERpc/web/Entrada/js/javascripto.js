//javascript eWAITER

//control de tamaño de pantalla
$(document).ready(myFunction)
function myFunction() {
    if(window.innerWidth < 1350 || window.innerHeight < 560){
        alert("Es posible que con esta resolución no\n\se visualize de forma correcta el programa\n\para ello usa una superior a 1350x560 ");
    }
}

