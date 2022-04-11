<?php

require_once '../../libraries/PHPExcel/Classes/PHPExcel.php';

$file = $_POST['excel'];

$archivo = "./upload/$file";

try {
    $inputFileType = PHPExcel_IOFactory::identify($archivo);
    $objReader = PHPExcel_IOFactory::createReader($inputFileType);
    $objPHPExcel = $objReader->load($archivo);

    $sheet = $objPHPExcel->getSheet(0);
    $highestRow = $sheet->getHighestRow();
    $highestColumn = $sheet->getHighestColumn();

    $res = array();

    for ($row = 2; $row <= $highestRow; $row++) {
        $n      = $sheet->getCell("A" . $row)->getValue();
        $fua    =  $sheet->getCell("B" . $row)->getValue();
        $his    = $sheet->getCell("C" . $row)->getValue();
        $res[]  = array('N' => $n, 'fua' => $fua, 'his' => $his);
    }
} catch (Exception $e) {
    $res[] = array('Error' => $e);
}



echo json_encode($res);
