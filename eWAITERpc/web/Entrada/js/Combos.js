function comboSubCat(){
    alert("CACA");
    $.post("combo.jsp", $("#data").serialize(),function(data){$("#subcat").html(data);});
}

function lista(){
   $.post("productosLista.jsp", $("#data").serialize(), function(data){$("#tabla").html(data);});
   event.preventDefault();
}

