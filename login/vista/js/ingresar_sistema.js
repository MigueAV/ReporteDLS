function ingresar_sistema(){
    var usuario=$('#codusuid').val();
    var password=$('#contraid').val();

    var url1 = "./login/controlador/validarLogeo.php";

    $.ajax({
        type: "post",
        url: url1,
        data: {
            username: usuario,
            userpass: password
        },
        success: function (datos) {
            if(usuario!='' && password!='') {
                $("#resultado").html(datos);
            } else{
                if(usuario==''){
                    $('#mensaje').val('INGRESE EL USUARIO');
                    $('#abrir_modal_mensaje').click();
                    $("#codusuid").focus();
                } else {
                    if(password==''){
                        $('#mensaje').val('INGRESE EL PASSWORD');
                        $('#abrir_modal_mensaje').click();
                        $("#contraid").focus();
                    }
                }
            }
        }
    })
}

function resetear(){
    var usuario=$('#busquedacodusu').val();
    var password=$('#idresetear').val();

    var url1 = "./login/controlador/resetearUsuario.php";

    $.ajax({
        type: "post",
        url: url1,
        data: {
            username: usuario,
            userpass: password
        },
        success: function (datos) {
            if(usuario!='' && password!='') {
                if(datos=='EXITO'){
                    $('#mensaje').val('SE RESETEO EL USUARIO, INGRESE CON SU DNI COMO CONTRASEÑA');
                    $('#abrir_modal_mensaje').click();
                    $('#busquedacodusu').val('');
                    $('#idresetear').val('');
                    $('#login').click();
                }else{
                    
                    $('#mensaje').val('NO SE LOGRÓ RESETEAR EL USUARIO, VERIFIQUE LOS DATOS INGRESADOS');
                    $('#abrir_modal_mensaje').click();
                    $('#busquedacodusu').focus();
                }
            } else{
                if(usuario==''){
                    $('#mensaje').val('INGRESE EL USUARIO');
                    $('#abrir_modal_mensaje').click();
                    $("#codusuid").focus();
                } else {
                    if(password==''){
                        $('#mensaje').val('INGRESE EL PASSWORD');
                        $('#abrir_modal_mensaje').click();
                        $("#contraid").focus();
                    }
                }
            }
        }
    })
}
function validar(){
    var usuario=$('#bus_valiusu').val();
    var password=$('#bus_codusu').val();

    var url1 = "./login/controlador/validar_usu.php";
   
    $.ajax({
        type: "post",
        url: url1,
        data: {
            username: usuario,
            userpass: password
        },
        success: function (datos) {
            if(usuario!='' && password!='') {
                if(datos!='ERROR'){
                    if(datos=='1'){
                        $('#crear_usuario').click();
                    }else{
                        $('#mensaje').val('USUARIO NO TIENE PERFIL VALIDO PARA CREAR USUARIOS');
                        $('#abrir_modal_mensaje').click();
                    }
                }else{
                    $('#abrir_modal_mensaje').click();
                    $('#mensaje').html('USUARIO O CONTRASEÑA INVALIDA');
                    $('#bus_valiusu').focus();
                
                }
            } else{
                if(usuario==''){
                    $('#mensaje').val('INGRESE EL USUARIO');
                    $('#abrir_modal_mensaje').click();
                    $("#bus_valiusu").focus();
                } else {
                    if(password==''){
                        $('#mensaje').val('INGRESE EL PASSWORD');
                        $('#abrir_modal_mensaje').click();
                        $("#bus_codusu").focus();
                        $("#bus_codusu").trigger('focus');
                    }
                }
            }
        }
    })
}

function obtener(){
    $nombre=$('#datos_nombres').val();
    $apellido1=$('#datos_apellidosP').val();
    $apellido2=$('#datos_apellidosM').val();
    
    $1=$nombre.substr(0,1);
    $ap1=$apellido1.replace(/ /g, ""); 
    $2=$apellido2.substr(0,1);

    $usuario=$1+$ap1+$2;
    $('#usuario').val($usuario);

    
}

function obtenerperfiles(){
    $.ajax({
        url: "login/controlador/ObtenerPerfil.php",
        dataType: "json",
        success: function (data) {
            if(data!=''){
                $.each(data,function(key, registro) {
                    $("#lista_perfiles").append('<option  value="'+registro.Id+'">'+registro.Descripcion+'</option>');
                });
            }
        }

    });
}

function guardar_usuario(){
    var nombres=$('#datos_nombres').val();
    var apellido1=$('#datos_apellidosP').val();
    var apellido2=$('#datos_apellidosM').val();
    var usuario=$('#usuario').val();
    var perfil=$('#lista_perfiles').val();
    var dni=$('#dato_dniusuario').val();
   
    if(dni==''){
        $('#mensaje').val('INGRESE EL NÚMERO DE DNI DEL USUARIO');
        $('#abrir_modal_mensaje').click();
       
    }else if(nombres==''){
        $('#mensaje').val('INGRESE EL NOMBRE DEL USUARIO');
        $('#abrir_modal_mensaje').click();
        
    }else if(apellido1==''){
        $('#mensaje').val('INGRESE EL APELLIDO PATERNO DEL USUARIO');
        $('#abrir_modal_mensaje').click();
        
    }else if(apellido2==''){
        $('#mensaje').val('INGRESE EL APELLIDO MATERNO DEL USUARIO');
        $('#abrir_modal_mensaje').click();
       
    }else if(usuario==''){
        $('#mensaje').val('INGRESE EL CODIGO DEL USUARIO');
        $('#abrir_modal_mensaje').click();
       
    }else if(perfil==''){
        $('#mensaje').val('INGRESE EL PERFIL DEL USUARIO');
        $('#abrir_modal_mensaje').click();
        
    }else{
        c=confirm('ESTA SEGURO QUE DESEA CREAR ESTE NUEVO USUARIO?');
        if(c==true){
            param={
                dni:dni,
                nombres:nombres,
                apellido1:apellido1,
                apellido2:apellido2,
                usuario:usuario,
                perfil:perfil
            }
            $.ajax({
                url: "login/controlador/guardarusuario.php",
                data:param,
                type: "post",
                success: function (data) {
                    $('#mensaje').val('EL USUARIO SE REGISTRO CON EXITO');
                    $('#abrir_modal_mensaje').click();
                    $('#datos_nombres').val('');
                    $('#datos_apellidosP').val('');
                    $('#datos_apellidosM').val('');
                    $('#usuario').val('');
                    $('#lista_perfiles').val(1);
                    $('#dato_dniusuario').val('');
                    $('#dato_dniusuario').focus();
                }
        
            });
        }
    }

}