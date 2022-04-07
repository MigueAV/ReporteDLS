<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$usuario = new gestion_model();
$username = strtolower($_POST['username']);
$dni = $_POST['userpass'];

if($username!='' and $dni!='') {

    $idperfil = $usuario->ValidarDatos($username, $dni);

    if ($idperfil['Id']!= '' ) {
        $hash = password_hash($dni, PASSWORD_DEFAULT, [100]);
        $usuario->ResetearUsuario($username,$hash);
        echo 'EXITO';

    } else {
        echo 'ERROR';
    }
}
