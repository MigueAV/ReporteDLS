<?php

require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

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

$color = new Color();
$fill = new Fill();
$alignment = new Alignment();
$border = new Border();

$spread = new Spreadsheet();

$sheet = $spread->getActiveSheet();

$spread
    ->getProperties()
    ->setCreator("Diris Lima Sur")
    //->setLastModifiedBy('Juan Perez')
    ->setTitle("Reporte PCPP - $esta")
    //->setSubject('Excel de prueba')
    ->setDescription("Reporte PCPP - $esta")
    ->setKeywords('PHPSpreadsheet')
    ->setCategory('Reporte');

$styleArray = [
    'font' => [
        'bold' => true,
    ],
    'alignment' => [
        'horizontal' => $alignment::HORIZONTAL_CENTER,
    ],
    'borders' => [
        'top' => [
            'borderStyle' => $border::BORDER_THIN,
        ],
    ],
    'fill' => [
        'fillType' => $fill::FILL_GRADIENT_LINEAR,
        'rotation' => 90,
        'startColor' => [
            'argb' => 'FFA0A0A0',
        ],
        'endColor' => [
            'argb' => 'FFFFFFFF',
        ],
    ],
];

$stylePrimero = [
    'font' => [
        'bold' => true,
    ],
    'alignment' => [
        'horizontal' => $alignment::HORIZONTAL_CENTER,
    ]
];

$styleBorder = [
    'borders' => [
        'outline' => [
            'borderStyle' => $border::BORDER_THIN,
            'color' => ['argb' => '000000'],
        ],
    ],
];


//$sheet->set
$sheet->setTitle('FUAS EVALUACION');

$sheet1 = $spread->createSheet();
$sheet1->setTitle('DETALLE PCPP');

foreach ($worksheetData as $worksheet) {

    $sheetName = $worksheet['worksheetName'];

    $reader->setLoadSheetsOnly($sheetName);
    $spreadsheet = $reader->load($inputFileName);

    $worksheet = $spreadsheet->getActiveSheet();
    $arr = $worksheet->toArray();

    $sheet->mergeCells('A1:D1');
    $sheet->setCellValue("A1", "PCPP - $esta");
    $sheet->getStyle('A1')->applyFromArray($stylePrimero);

    $sheet->setCellValue("A2", "N");
    $sheet->setCellValue("B2", "FUA");
    $sheet->setCellValue("C2", "HISTORIA");
    $sheet->setCellValue("D2", "FECHA");

    $sheet->getStyle('A2:D2')->applyFromArray($styleArray);

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

    $sheet1->getStyle('A1:J1')->applyFromArray($styleArray);

    $j = 3;
    $k = 2;
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

            $sheet->getStyle("A$j:D$j")->applyFromArray($styleBorder);

            $sheet1->setCellValue("A$k", $n);
            $sheet1->setCellValue("B$k", $row['FUA']);
            $sheet1->setCellValue("C$k", $row['historia']);
            $sheet1->setCellValue("D$k", $row['Beneficiario']);
            $sheet1->setCellValue("E$k", $row['Fecha']);
            $sheet1->setCellValue("F$k", $row['Servicio']);
            $sheet1->setCellValue("G$k", $row['Contrato']);
            $sheet1->setCellValue("H$k", $row['Periodo']);
            $sheet1->setCellValue("I$k", $row['Digitador']);
            $sheet1->setCellValue("J$k", $row['Usuario']);
            $sheet1->getStyle("A$k:J$k")->applyFromArray($styleBorder);
        }
        $j++;
        $k++;
    }
}

$sheet->getColumnDimension('A')->setAutoSize(true);
$sheet->getColumnDimension('B')->setAutoSize(true);
$sheet->getColumnDimension('C')->setAutoSize(true);
$sheet->getColumnDimension('D')->setAutoSize(true);

$sheet1->getColumnDimension('A')->setAutoSize(true);
$sheet1->getColumnDimension('B')->setAutoSize(true);
$sheet1->getColumnDimension('C')->setAutoSize(true);
$sheet1->getColumnDimension('D')->setAutoSize(true);
$sheet1->getColumnDimension('E')->setAutoSize(true);
$sheet1->getColumnDimension('F')->setAutoSize(true);
$sheet1->getColumnDimension('G')->setAutoSize(true);
$sheet1->getColumnDimension('H')->setAutoSize(true);
$sheet1->getColumnDimension('I')->setAutoSize(true);
$sheet1->getColumnDimension('J')->setAutoSize(true);

//echo json_encode($res);

$out = "reporte-$esta.xlsx";

$writer = new Xlsx($spread);
$writer->save($out);

$res[] = array('link' => "controlador/$out");

echo json_encode($res);
