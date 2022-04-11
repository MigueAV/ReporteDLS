<?php
require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$model = new gestion_model();

$result = array();

$lista =$model->ListarPeriodo();

do {
    while($row = sqlsrv_fetch_array($lista, SQLSRV_FETCH_ASSOC)) {
        $result[] = $row;
    }
} while (sqlsrv_next_result($lista));

sqlsrv_free_stmt($lista);

$data = json_encode($result);

echo $data ;