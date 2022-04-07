<?php

require_once '../../libraries/PHPExcel/Classes/PHPExcel.php';

require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");

$objPHPExcel = new PHPExcel();
$model = new gestion_model();

$result = array();

$lista = $model->ListaEstablecimiento();

$anio = $_GET['anio'];
$eess = $_GET['eess'];

// Establecer propiedades
$objPHPExcel->getProperties()
    ->setCreator("Diris Lima Sur")
    //->setLastModifiedBy("Cattivo")
    ->setTitle("Reporte PCPP")
    ->setSubject("Reporte PCPP");
//->setDescription("Demostracion sobre como crear archivos de Excel desde PHP.")
//->setKeywords("Excel Office 2007 openxml php")
//->setCategory("Pruebas de Excel");


$objPHPExcel->setActiveSheetIndex(0)
    ->setCellValue('A3', 'NRO')
    ->setCellValue('B3', 'FUA')
    ->setCellValue('C3', 'HISTORIA')
    ->setCellValue('D3', 'BENEFICIARIO')
    ->setCellValue('E3', 'FECHA')
    ->setCellValue('F3', 'SERVICIO')
    ->setCellValue('G3', 'CONTRATO')
    ->setCellValue('H3', 'PERIODO')
    ->setCellValue('I3', 'DIGITADOR')
    ->setCellValue('J3', 'USUARIO');

$i = 4;

foreach ($lista as $detalle) {
    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A' . $i, $detalle['NRO'])
        ->setCellValue('B' . $i, $detalle['FUA'])
        ->setCellValue('C' . $i, $detalle['historia'])
        ->setCellValue('D' . $i, $detalle['Beneficiario'])
        ->setCellValue('E' . $i, $detalle['Fecha'])
        ->setCellValue('F' . $i, $detalle['Servicio'])
        ->setCellValue('G' . $i, $detalle['Contrato'])
        ->setCellValue('H' . $i, $detalle['Periodo'])
        ->setCellValue('I' . $i, $detalle['Digitador'])
        ->setCellValue('J' . $i, $detalle['Usuario']);
}



header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="pruebaReal.xlsx"');
header('Cache-Control: max-age=0');
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;
