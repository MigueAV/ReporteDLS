<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");

$dato = new gestion_model();

$obtenertodo=$dato->obtenerperfiles();

$result = array();

do {
    while($row = sqlsrv_fetch_array($obtenertodo, SQLSRV_FETCH_ASSOC)) {
        $result[] = $row;
    }
} while (sqlsrv_next_result($obtenertodo));

sqlsrv_free_stmt($obtenertodo);

$data = json_encode($result);

echo $data ;


?>