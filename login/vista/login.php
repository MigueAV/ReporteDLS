<!DOCTYPE html>
<html>
<head>

    <title>Diris Lima Sur</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="./bootstrap/fonts/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="login/vista/styles.css">
    <link rel="icon" href="login/vista/img/logo_honadomani.png">
    <script src="./login/vista/js/saltar.js"></script>
    <script src="./login/vista/js/seleccionar.js"></script>
    <script src="./login/vista/js/ingresar_sistema.js"></script>
</head>
<script>
    window.addEventListener("keypress", function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
        }
    }, false);
</script>
<script>
    $(".tabs").on("click", "li a", function(e) {
        e.preventDefault();
        var $tab = $(this),
            href = $tab.attr("href");

        $(".active").removeClass("active");
        $tab.addClass("active");

        $(".show").removeClass("show").addClass("hide").hide();

        $(href).removeClass("hide").addClass("show").hide().fadeIn(550);
    });
</script>
<script>
    $(function() {
        $("#myModalUsuario").draggable({
            handle: ".modal-header"
        });

    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        document.getElementById("codusuid").focus({
            preventScroll: true
        });
        obtenerperfiles();
    });
</script>

<body class="m-0 vh-100 row justify-content-center align-items-center">

    <div class="container ">
    
        <div class="d-flex  justify-content-center text-center">
            <div class=" border col-auto align-self-center text-center cont" style="opacity:1; padding-left:0;padding-right:0;border:solid;border-radius: 20px 20px 50px 30px;-webkit-border-radius: 20px 20px 30px 30px;-moz-border-radius: 20px 20px 50px 30px;">
                <div class="flat" style="border-color:black;border:solid;border-radius: 20px 20px 30px 30px;-webkit-border-radius: 20px 20px 30px 30px;-moz-border-radius: 20px 20px 30px 30px;">
                    <div class="card-header" style="text-align: center;">
                    <img src="./login/vista/img/logodirisls.png" class="center-block img-responsive" style="border-radius: 10%;width:50%;height:10%"  alt="AVATAR">
                        <br></br>
                        <h3 style="text-align:center; font-family: inherit;font-size: 30px;color: #fff;line-height: 1.2;">¡Bienvenido!</h3>
                        <br>
                    </div>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" href="#home" style="font-weight:bold;color:black;" id="login">LOGIN</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-weight:bold;color:black;" href="#reset" id="ireset">RESETEAR</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-weight:bold;color:black;" href="#registro">REGISTRO</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="home" class="container tab-pane active"><br>
                            <h3 style="color:white;">LOGIN</h3>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                </div>
                                <input type="text" id="codusuid" class="form-control" placeholder="username" onkeyup="saltar(event,'contraid')" onclick="seleccionar('codusuid')" style="text-align: center;text-transform: uppercase;" autofocus>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-key"></i></span>
                                    <div id="resultado"></div>
                                </div>
                                <input type="password" id="contraid" class="form-control" style="text-align: center;text-transform: uppercase;" placeholder="password" onclick="seleccionar('contraid')" onkeyup="if($('#contraid').val()!=''){saltar(event,'btnlogin');}">
                            </div>
                            <div class="input-group form-group" style="padding:0;margin:3px;">
                                <div class="col-sm-12" style="padding:0;">
                                    <a href="#" style="text-align:center;" onclick="$('#ireset').click();"> ¿ Olvidó su contraseña ?</a>
                                </div>
                            </div>
                            <div class="input-group form-group">
                                <div class="col-sm-12">
                                    <button type="button" id="btnlogin" class="btn login_btn btn-block" onclick="ingresar_sistema();"><i class="fa fa-sign-in" aria-hidden="true"></i> INGRESAR</button>
                                </div>

                            </div>
                        </div>

                        <div id="reset" class="container tab-pane fade"><br>
                            <h3 style="color:white;">RESETEAR</h3>
                            <legend style="text-align:left;font-size:12px;color:white;padding-bottom:0">VALIDAR INFORMACIÓN</legend>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                </div>
                                <input type="text" id="busquedacodusu" class="form-control" placeholder="USERNAME" onkeyup="saltar(event,'idresetear')" onclick="seleccionar('busquedacodusu')" style="text-align: center;text-transform: uppercase;" autocomplete=off>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-key"></i></span>
                                </div>
                                <input type="text" id="idresetear" class="form-control" style="text-align: center;text-transform: uppercase;" onclick="seleccionar('idresetear')" placeholder="DNI" maxlength=8 autocomplete=off onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onkeyup="if($('#idresetear').val()!=''){saltar(event,'btnreset');}">
                            </div>
                            <div class="input-group form-group">
                                <div class="col-sm-12">
                                    <button type="button" id="btnreset" class="btn login_btn btn-block" onclick="resetear();"><i class="fa fa-refresh" aria-hidden="true"></i> RESETEAR</button>
                                </div>

                            </div>
                        </div>
                        <div id="registro" class="container tab-pane fade"><br>
                            <button class="btn btn-primary btn-sm" type="button" id="crear_usuario" style="float:right;display:none;" data-toggle="modal" data-target="#myModalUsuario">NUEVO</button>
                            <h3 style="color:white;">REGISTRO</h3>
                            <legend style="text-align:left;font-size:12px;color:white;padding-bottom:0">VALIDAR USUARIO</legend>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-user"></i></span>
                                </div>
                                <input type="text" id="bus_valiusu" class="form-control" placeholder="USERNAME" onkeyup="saltar(event,'bus_codusu')" onclick="seleccionar('bus_valiusu')" style="text-align: center;text-transform: uppercase;" autocomplete=off>
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-key"></i></span>
                                </div>
                                <input type="password" id="bus_codusu" class="form-control" style="text-align: center;text-transform: uppercase;" placeholder="CONTRASEÑA" onclick="seleccionar('bus_codusu')" autocomplete=off onkeyup="if($('#bus_codusu').val()!=''){saltar(event,'btncrearusuario');}">
                            </div>

                            <div class="input-group form-group">
                                <div class="col-sm-12">
                                    <button type="button" id="btncrearusuario" class="btn login_btn btn-block" onclick="validar();"><i class="fa fa-refresh" aria-hidden="true"></i> VALIDAR</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <div class="modal fade" id="myModalUsuario" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center" style="text-align: center;background-color:#337ab7;border-color: #337ab7;font-size: 14px;">
                    <h4 class="modal-title text-center" style="text-align: center;font-size: 15px;color: white;font-family: 'Open Sans', 'Helvetica Neue', helvetica, arial, verdana, sans-serif;"><strong style="text-align: center;"> AGREGAR USUARIO</strong></h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body" style="padding-bottom: 2px;padding-top:2px;font-size:13px;">
                    <div class="row"><br>
                        <div class="col-sm-12">
                            <label>DNI</label>
                            <input type="text" id="dato_dniusuario" class="form-control form-control-sm" style="text-align: center;text-transform: uppercase;" onclick="seleccionar('dato_dniusuario')" placeholder="DNI" maxlength=8 autocomplete=off onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onkeyup="if($('#dato_dniusuario').val()!=''){saltar(event,'datos_nombres');}">
                        </div>
                        <div class="col-sm-12">
                            <label>NOMBRE</label>
                            <input class="form-control form-control-sm" type="text" id="datos_nombres" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'datos_apellidosP');obtener();" placeholder="NOMBRES" onclick="seleccionar('datos_nombres')">
                        </div>
                        <div class="col-sm-12">
                            <label>APELLIDO PATERNO</label>
                            <input class="form-control form-control-sm" type="text" id="datos_apellidosP" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'datos_apellidosM')" onKeypress="obtener();" placeholder="APELLIDO PATERNO" onclick="seleccionar('datos_apellidosP')">
                        </div>
                        <div class="col-sm-12">
                            <label>APELLIDO MATERNO</label>
                            <input class="form-control form-control-sm" type="text" id="datos_apellidosM" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'lista_perfiles');obtener();" placeholder="APELLIDO MATERNO" onclick="seleccionar('datos_apellidosM')">
                        </div>

                        <div class="col-sm-12">
                            <label>USUARIO</label>
                            <input class="form-control form-control-sm" type="text" id="usuario" disabled style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'lista_perfiles')" onclick="seleccionar('usuario')">
                        </div>
                        <div class="col-sm-12">
                            <label>PERFIL</label>
                            <select class="form-control form-control-sm" id="lista_perfiles" name="lista_perfiles" onkeyup="saltar(event,'guardar_usuario')">

                            </select>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-dark btn-sm" id="guardar_usuario" onclick="guardar_usuario();"><i class="fa fa-save"></i> GUARDAR</button>
                    <button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> CERRAR</button>
                </div>
            </div>
        </div>

    </div>
    <?php include './configuracion/alerta_login.php'; ?>
    <script>
        $(document).ready(function() {
            $(".nav-tabs a").click(function() {
                $(this).tab('show');
            });
        });
    </script>
    <script>
        $("#contraid").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnlogin").click();
            }
        });
    </script>
    <script>
        $("#idresetear").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnreset").click();
            }
        });
    </script>
    <script>
        $("#bus_codusu").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btncrearusuario").click();
            }
        });
    </script>
    <script>
        $("#lista_perfiles").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#guardar_usuario").click();
            }
        });
    </script>
    <script>
        $("#dato_dniusuario").keyup(function(event) {
            if (($("#dato_dniusuario").val()).length == 8) {
                var dni = $('#dato_dniusuario').val();
                param = {
                    dni: dni
                }
                $.ajax({
                    url: "login/controlador/validarDNI.php",
                    dataType: "json",
                    data: param,
                    type: "post",
                    success: function(data) {
                        if (data != '') {
                            $('#abrir_modal_mensaje').click();
                            $('#mensaje').html('ESTE DNI YA HA SIDO REGISTRADO');

                            $('#dato_dniusuario').val('');
                        }

                    }
                })
            }
        });
    </script>
</body>

</html>