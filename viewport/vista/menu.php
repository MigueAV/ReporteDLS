<!DOCTYPE html>
<html lang="en">
<?php
session_start();
include '../configuracion/header.php';
?>

<head>
    <link rel="icon" href="../viewport/vista/img/logodirisls.png">
    <link rel="stylesheet" type="text/css" href="./vista/style.css">
    <script src="../viewport/vista/js/function.js"></script>
    <script>
        $(function() {
            $("#myModalCambiarContra").draggable({
                handle: ".modal-header"
            });
        });
        $(function() {
            $('#myModalCambiarContra').on('shown.bs.modal', function(e) {
                $('.focus').focus();
            })
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            var valor = $('#nuevop').val();

            if (valor != '0') {
                $("#myModalCambiarContra").modal('show');
            }

            $("#cambiarcontra").click(function() {
                setTimeout(focuscontra, 500);
            });

            $("#confi_contra").keyup(function() {
                if (event.keyCode === 13) {
                    $("#guardar_nuevacontra").click();
                }

            });
        });
    </script>
</head>

<body>

    <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">DIRIS LIMA SUR</a>
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <!--<li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
            </li>-->
                </ul>
                <button type="button" class="navbar-text btn btn-outline-success-sm" onclick="cerrarsesion();"><i class="fas fa-sign-out-alt"></i> Cerrar Sesion
                </button>
            </div>
        </div>
    </nav>

    <div class="container">
        <?php
        $perfil = $_SESSION['perfil'];
        /*if ($perfil == 1) {
            include 'reporte.php';
        } else if ($perfil == 2) {
            include 'auditor.php';
        } else if ($perfil == 3) {
            include 'supervisor.php';
        }*/

        include 'reporte.php';
        ?>
        <button id="cambiarcontra" style="display:none;" data-toggle="modal" data-target="#myModalCambiarContra"> cambiarcontra</button>
        <div style="display:block;">
            <input id="nuevop" name="nuevop" class="form-control input-sm" value="<?php echo $_SESSION['nuevo']; ?>">
            <input id="Usuario" name="Usuario" class="form-control input-sm" value="<?php echo $_SESSION['usuarios']; ?>">
        </div>
    </div>

    <div class="modal fade" id="myModalCambiarContra" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center  text-white" style="text-align: center;">
                    <h4 class="modal-title text-center" style="text-align: center;font-size: 18px;color:black"><strong> CAMBIAR CONTRASEÑA</strong></h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="cerrarsesion();">×</button>
                </div>
                <div class="modal-body" style="padding-bottom: 2px;padding-top:2px;font-size:13px;">
                    <div class="row"><br>
                        <div class="col-sm-12 ">
                            <label>CONTRASEÑA ACTUAL</label>
                            <input type="password" id="actual_contra" class="form-control form-control-sm focus" autofocus placeholder="ACTUAL CONTRASEÑA" style="text-align: center;text-transform: uppercase;" onclick="seleccionar('actual_contra')" autocomplete=off onkeyup="if($('#actual_contra').val()!=''){saltar(event,'nueva_contra');}">
                        </div>
                        <div class="col-sm-12">
                            <label>NUEVA CONTRASEÑA</label>
                            <input class="form-control form-control-sm" type="password" id="nueva_contra" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'confi_contra');" onclick="seleccionar('nueva_contra');if($('#actual_contra').val()==''){ focuscontra();}">
                        </div>
                        <div class="col-sm-12">
                            <label>CONFIRMAR NUEVA CONTRASEÑA</label>
                            <input class="form-control form-control-sm" type="password" id="confi_contra" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'guardar_nuevacontra')" onclick="seleccionar('confi_contra')">
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-dark btn-sm" id="guardar_nuevacontra" onclick="guardar_nuevacontra();"><i class="fa fa-save"></i> GUARDAR</button>
                    <button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal" id="btncerracontra" onclick="cerrarsesion();"><i class="fa fa-close"></i> CERRAR</button>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="list-inline-item">
            <p style="text-align:center;font-size:11px;" class="mx-1">© 2022 ET. de Seguros - Diris Lima Sur </p>
            <p style="text-align:center;font-size:11px;" class="mx-1">Creado por Equipo Informático ETS</p>
        </div>
    </div>

    <?php
    include '../configuracion/alertas.php';
    ?>

</body>


</html>