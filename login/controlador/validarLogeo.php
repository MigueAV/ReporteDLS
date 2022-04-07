<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
session_start();
$usuario = new gestion_model();
$username = strtolower($_POST['username']);
$userpass = $_POST['userpass'];
date_default_timezone_set('America/Lima');
$hoy=date('Y-m-d');
$Fdia10=date('Y-m-d',strtotime($hoy.'- 10 days'));
//$hash = password_hash($userpass, PASSWORD_DEFAULT, [100]);

if($username!='' and $userpass!='') {
    $idperfil = $usuario->IngresarLogin($username, $userpass);

    if ($idperfil['Id']!= '' and password_verify($userpass,$idperfil['Clave'])) {
        $_SESSION['usuarios'] = strtoupper($username);
        $_SESSION['id'] = $idperfil['Id'];
        $_SESSION['perfil']=$idperfil['Perfil'] ;
        $_SESSION['nomusu']=$idperfil['Nombres'];
        if($idperfil['Perfil']==2){
            $_SESSION['filtro']=1;
        }else{
            $_SESSION['filtro']=3;
        }
        
        $_SESSION['fprocedencia']=1;
        $_SESSION['fespecialidad']='';
        $_SESSION['fprestacion']='';
        $_SESSION['fdesde']=$Fdia10;
        $_SESSION['fhasta']=$Fdia10;
        $_SESSION['numero']='';
        if($userpass==$idperfil['Dni']){
            $_SESSION['nuevo']=$userpass;
        }else{
            $_SESSION['nuevo']=0;
        }
        
        ?>
        <input type="hidden" id="usuario" value="<?=$_SESSION['id']?>">
        <?php
        echo'<script type="text/javascript">
            var v_usuario=document.getElementById("usuario").value;
           window.location.href="./viewport/";
        </script>';
        ?>
        <?php
    } else {
        echo'<script type="text/javascript">
            $("#codusuid").focus();
            $("#modalMensaje").modal("show");
            $("#mensaje").html("USUARIO O PASSWORD INCORRECTOS");
            
        </script>';
        ?>
        <script type="text/javascript">
            $(":text").each(function () {
                $($(this)).val('');
            });
            $(":password").each(function () {
                $($(this)).val('');
            });
        </script>
        <?php
        $_SESSION = array();
    }
}
?>