<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");

$guardar= new gestion_model();

$dni= $_POST['dni'];
$nombres=strtoupper($_POST['nombres']);
$apellido1=strtoupper($_POST['apellido1']);
$apellido2=strtoupper($_POST['apellido2']);
$usuario=strtoupper($_POST['usuario']);
$perfil=$_POST['perfil'];


$hash = password_hash($dni, PASSWORD_DEFAULT, [100]);

$guardar->guardar_usuario($usuario,$dni,$hash,$perfil,$apellido1,$nombres,$apellido2);
