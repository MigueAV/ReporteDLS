<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
session_start();
$usuario = new gestion_model();
$username = strtolower($_POST['username']);
$userpass = $_POST['userpass'];


if($username!='' and $userpass!='') {
    $idperfil = $usuario->IngresarLogin($username, $userpass);

    if ($idperfil['Id']!= '' and password_verify($userpass,$idperfil['Clave'])) {
       echo $idperfil['Perfil'];
       
    } else {
        echo 'ERROR';
    }
}
