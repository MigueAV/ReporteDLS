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
        $(function () {
            $("#myModalCambiarContra").draggable({
                handle: ".modal-header"
            });       
        });
        $(function () {
            $('#myModalCambiarContra').on('shown.bs.modal', function (e) {
                $('.focus').focus();
            })
        });
    </script>
    <script type="text/javascript">
    $(document).ready(function(){
        var valor=$('#nuevop').val();

        if(valor!='0'){
            $('#cambiarcontra').click();
        }

        $("#cambiarcontra").click(function(){
            setTimeout(focuscontra, 500);
        });

        $("#confi_contra").keyup(function() {
            if(event.keyCode === 13){
                $("#guardar_nuevacontra").click();
            }

        });
    });
    </script>
</head>


<body>

    <?php
        include 'reporte.php';
    ?>

    <div class="container">
        <button id="cambiarcontra" style="display:none;" data-toggle="modal" data-target="#myModalCambiarContra" > cambiarcontra</button>
        <div style="display:none;">
            <input id="nuevop" name="nuevop" class="form-control input-sm" value="<?php echo $_SESSION['nuevo'];?>">
            <input id="Usuario" name="Usuario" class="form-control input-sm" value="<?php echo $_SESSION['usuarios'];?>">
        </div>
    </div>

  

    <div class="modal fade" id="myModalCambiarContra" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" >
            <div class="modal-content" >
                <div class="modal-header text-center  text-white" style="text-align: center;">
                <h4 class="modal-title text-center" style="text-align: center;font-size: 18px;color:black"><strong > CAMBIAR CONTRASEÑA</strong></h4>
                <button type="button" class="close" data-dismiss="modal" onclick="cerrarsesion();">×</button>
                </div>
                <div class="modal-body" style="padding-bottom: 2px;padding-top:2px;font-size:13px;">
                    <div class="row"><br>
                        <div class="col-sm-12 ">
                            <label>CONTRASEÑA ACTUAL</label>
                            <input type="password" id="actual_contra"  class="form-control form-control-sm focus" autofocus placeholder="ACTUAL CONTRASEÑA"  style="text-align: center;text-transform: uppercase;" onclick="seleccionar('actual_contra')"  autocomplete=off  onkeyup="if($('#actual_contra').val()!=''){saltar(event,'nueva_contra');}">
                        </div>
                        <div class="col-sm-12">
                            <label>NUEVA CONTRASEÑA</label>
                        <input class="form-control form-control-sm" type="password" id="nueva_contra" style="text-align: center;text-transform: uppercase;" onkeyup="saltar(event,'confi_contra');"  onclick="seleccionar('nueva_contra');if($('#actual_contra').val()==''){ focuscontra();}" >
                        </div>
                        <div class="col-sm-12">
                            <label>CONFIRMAR NUEVA CONTRASEÑA</label>
                            <input class="form-control form-control-sm" type="password" id="confi_contra" style="text-align: center;text-transform: uppercase;"  onkeyup="saltar(event,'guardar_nuevacontra')" onclick="seleccionar('confi_contra')" >
                        </div>

                    </div>
                </div>
                <div class="modal-footer" >
                <button type="button" class="btn btn-outline-dark btn-sm" id="guardar_nuevacontra"  onclick="guardar_nuevacontra();"><i class="fa fa-save"></i> GUARDAR</button>
                <button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal" id="btncerracontra" onclick="cerrarsesion();"><i class="fa fa-close"></i> CERRAR</button>
                </div>
            </div>
        </div>
    </div>

    <?php
    include '../configuracion/alertas.php';
    ?>

    <div class="footer">
        <div class="list-inline-item">
            <p style="text-align:left" class="mx-1">© 2022 ET. de Seguros - Diris Lima Sur </p> 
            <p style="text-align:left" class="mx-1">Creado por Equipo Informático ETS</p>
        </div>
    </div>

</body>


</html>