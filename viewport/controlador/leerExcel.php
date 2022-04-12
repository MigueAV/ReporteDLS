<?php


require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();

require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$model = new gestion_model();

$file = $_POST['excel'];
$eess = $_POST['eess'];
$esta = $_POST['esta'];

$inputFileType = 'Xlsx';
$inputFileName  = "./upload/$file";

$res = array();

/** Create a new Reader of the type defined in $inputFileType **/
$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
/** Advise the Reader that we only want to load cell data **/
$reader->setReadDataOnly(true);

$worksheetData = $reader->listWorksheetInfo($inputFileName);

$spread = new Spreadsheet();
$spread
    ->getProperties()
    ->setCreator("Diris Lima Sur")
    //->setLastModifiedBy('Juan Perez')
    ->setTitle("Reporte PCPP - $esta")
    //->setSubject('Excel de prueba')
    ->setDescription("Reporte PCPP - $esta")
    ->setKeywords('PHPSpreadsheet')
    ->setCategory('Reporte');

$sheet = $spread->getActiveSheet();
//$sheet->set
$sheet->setTitle('FUAS EVALUACION');

$sheet1 = $spread->createSheet();
$sheet1->setTitle('DETALLE PCPP');

/*$styleCell = [
    'borders' => [
        'diagonalDirection' => Borders::DIAGONAL_BOTH,
        'allBorders' => [
            'borderStyle' => Border::BORDER_THIN,
        ],
    ]
];*/

foreach ($worksheetData as $worksheet) {

    $sheetName = $worksheet['worksheetName'];

    $reader->setLoadSheetsOnly($sheetName);
    $spreadsheet = $reader->load($inputFileName);

    $worksheet = $spreadsheet->getActiveSheet();
    $arr = $worksheet->toArray();

    $sheet->setCellValue("A1", "N");
    $sheet->setCellValue("B1", "FUA");
    $sheet->setCellValue("C1", "HISTORIA");
    $sheet->setCellValue("D1", "FECHA");

    $sheet1->setCellValue("A1", "N");
    $sheet1->setCellValue("B1", "FUA");
    $sheet1->setCellValue("C1", "HISTORIA");
    $sheet1->setCellValue("D1", "BENEFICIARIO");
    $sheet1->setCellValue("E1", "FECHA");
    $sheet1->setCellValue("F1", "SERVICIO");
    $sheet1->setCellValue("G1", "CONTRATO");
    $sheet1->setCellValue("H1", "PERIODO");
    $sheet1->setCellValue("I1", "DIGITADOR");
    $sheet1->setCellValue("J1", "USUARIO");

    $j = 2;
    for ($i = 1; $i < count($arr); $i++) {
        $n      = $arr[$i][0];
        $fua    = $arr[$i][1];
        $hist   = $arr[$i][2];
        $hist   = str_replace('_', '', $hist);
        //$res[]  = array('N' => $n, 'FUA' => $fua, 'HISTORIA' => $hist);

        $lista = $model->ReportePCPP($eess, $fua, $hist);
        while ($row = sqlsrv_fetch_array($lista, SQLSRV_FETCH_ASSOC)) {
            $sheet->setCellValue("A$j", $n);
            $sheet->setCellValue("B$j", $row['FUA']);
            $sheet->setCellValue("C$j", $row['historia']);
            $sheet->setCellValue("D$j", $row['Fecha']);

            $sheet1->setCellValue("A$j", $n);
            $sheet1->setCellValue("B$j", $row['FUA']);
            $sheet1->setCellValue("C$j", $row['historia']);
            $sheet1->setCellValue("D$j", $row['Beneficiario']);
            $sheet1->setCellValue("E$j", $row['Fecha']);
            $sheet1->setCellValue("F$j", $row['Servicio']);
            $sheet1->setCellValue("G$j", $row['Contrato']);
            $sheet1->setCellValue("H$j", $row['Periodo']);
            $sheet1->setCellValue("I$j", $row['Digitador']);
            $sheet1->setCellValue("J$j", $row['Usuario']);
        }
        $j++;
    }
}

//echo json_encode($res);

$out = "reporte-$esta.xlsx";

$writer = new Xlsx($spread);
$writer->save($out);

$res[] = array('link' => "controlador/$out");

echo json_encode($res);
