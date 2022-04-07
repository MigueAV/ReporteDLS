saltar = (campo, e) => {
    if (e.keyCode == 13) {
        $("#" + campo).focus();
    }
}

seleccionar = (id) => {
    valor_input = document.getElementById(id).value;
    longitud = valor_input.length;
    document.getElementById(id).setSelectionRange(0, longitud);
}

$(document).ready(function(){
    
});