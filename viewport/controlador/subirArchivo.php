<?php

$nombre = $_FILES['archivo']['name'];
$tipo = $_FILES['archivo']['type'];
$tamanio = $_FILES['archivo']['size'];
$ruta = $_FILES['archivo']['tmp_name'];

$fulldest = "upload/$nombre";
if (!file_exists("upload")) {
    mkdir("upload");
}
// "archivo"
$res = array();
if (move_uploaded_file($ruta, $fulldest)) {
    $res[] = array('message' => 'Se subió correctamente', 'type' => 'success');
} else {
    $res[] = array('message' => 'No se subió correctamente', 'type' => 'error');
}

echo json_encode($res);
