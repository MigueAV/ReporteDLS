<?php

$nombre = $_FILES['archivo']['name'];
$tipo = $_FILES['archivo']['type'];
$tamanio = $_FILES['archivo']['size'];
$ruta = $_FILES['archivo']['tmp_name'];

$extension = pathinfo($nombre, PATHINFO_EXTENSION);

$fulldest = "upload/$nombre";
if (!file_exists("upload")) {
    mkdir("upload");
}
// "archivo"
$res = array();

if ($extension == 'xlsx') {
    if (move_uploaded_file($ruta, $fulldest)) {
        $res[] = array('message' => 'Se subió correctamente', 'type' => 'success', 'file' => $nombre, 'ext' => $extension);
    } else {
        $res[] = array('message' => 'No se subió correctamente', 'type' => 'error');
    }
}else{
    $res[] = array('message' => 'El archivo no es de formato Excel', 'type' => 'error');
}



echo json_encode($res);
