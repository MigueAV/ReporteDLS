<?php

require '../../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$model = new gestion_model();

$result = array();

$anio = $_GET['anio'];
$eess = $_GET['eess'];

$lista = $model->ReportePCPP($anio, $eess);

// Establecer propiedades
/*$objPHPExcel->getProperties()
    ->setCreator("Diris Lima Sur")
    //->setLastModifiedBy("Cattivo")
    ->setTitle("Reporte PCPP")
    ->setSubject("Reporte PCPP");*/
//->setDescription("Demostracion sobre como crear archivos de Excel desde PHP.")
//->setKeywords("Excel Office 2007 openxml php")
//->setCategory("Pruebas de Excel");


$sheet
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

while ($row = sqlsrv_fetch_array($lista, SQLSRV_FETCH_ASSOC)) {
    $sheet
        ->setCellValue('A' . $i, $row['NRO'])
        ->setCellValue('B' . $i, $row['FUA'])
        ->setCellValue('C' . $i, $row['historia'])
        ->setCellValue('D' . $i, $row['Beneficiario'])
        ->setCellValue('E' . $i, $row['Fecha'])
        ->setCellValue('F' . $i, $row['Servicio'])
        ->setCellValue('G' . $i, $row['Contrato'])
        ->setCellValue('H' . $i, $row['Periodo'])
        ->setCellValue('I' . $i, $row['Digitador'])
        ->setCellValue('J' . $i, $row['Usuario']);
    $i++;
}

$writer = new Xlsx($spreadsheet);
$writer->save('report/pruebaReal.xlsx');
header("Location: pruebaReal.xlsx");

exit;
