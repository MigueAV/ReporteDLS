<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$usuario = new gestion_model();
$username = strtolower($_POST['usuario']);
$nueva_contra = $_POST['nueva_contra'];

if($username!='' and $nueva_contra!='') {
    $hash = password_hash($nueva_contra, PASSWORD_DEFAULT, [100]);
    $usuario->ResetearUsuario($username,$hash);
    echo 'EXITO';

}

?>