function comboSubCat(){
    $.post("combo.jsp", $("#data").serialize(),function(data){$("#subcat").html(data);})
}

