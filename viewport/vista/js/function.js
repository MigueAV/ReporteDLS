function saltar(e,id)
{
    // Obtenemos la tecla pulsada
    (e.keyCode)?k=e.keyCode:k=e.which;

    // Si la tecla pulsada es enter (codigo ascii 13)
    if(k==13)
    {
        // Si la variable id contiene "submit" enviamos el formulario
        if(id=="submit")
        {
            document.forms[0].submit();
        }else{
            // nos posicionamos en el siguiente input
            document.getElementById(id).focus();
        }
    }
}

function seleccionar(id){
    valor_input = document.getElementById(id).value;
    longitud = valor_input.length;
    document.getElementById(id).setSelectionRange (0, longitud);

}

$(document).ready(function(){
    
});

function focuscontra(){
    $('#actual_contra').trigger('focus');
}

function guardar_nuevacontra(){
    var dni=$('#nuevop').val();
    var contra_actual=$('#actual_contra').val();
    var nueva_contra=$('#nueva_contra').val();
    var confi_contra=$('#confi_contra').val();
    var usuario=$('#Usuario').val();

    if(contra_actual!=dni){
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('LA CONTRASEÑA ACTUAL NO ES LA CORRECTA');
        $('#actual_contra').focus();
    }else if(confi_contra!=nueva_contra){
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('LA CONFIRMACIÓN DE LA CONTRASEÑA NO COINCIDE CON LA NUEVA CONTRASEÑA');
        
        $('#nueva_contra').val();
    }else if(contra_actual==nueva_contra){
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('DEBE INGRESAR UNA CONTRASEÑA DIFERENTE A LA ACTUAL');
        
        $('#nueva_contra').val();
    }else{
        param={
            nueva_contra:nueva_contra,
            usuario:usuario
        }
        $.ajax({
            type: "POST",
            data: param,
            url: "./controlador/guardar_nuevacontra.php",
            success: function(data) {
               if(data!=''){
                $('#abrir_modal_mensaje').click();
                    $('#mensaje').html('SE GUARDO LA NUEVA CONTRASEÑA, INGRESE NUEVAMENTE CON LA NUEVA CONTRASEÑA');
                  
                   $('#btncerracontra').click();
               }
              
            }
        });
    }
}

function cerrarsesion(){
    window.location="/ReporteDLS";
}
