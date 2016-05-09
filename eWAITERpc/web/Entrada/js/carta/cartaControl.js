function borrarPosCarta(){
    alert("borramos");
}
function borrar() {
    var plato = document.getElementById("nombreAlert").innerHTML;
    var answer = confirm("Vas a eliminar: " + plato);
    if (answer)
        alert("lo borramos");
    else
        alert("no lo borramos");
} 