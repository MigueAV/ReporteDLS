<?php


require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$spreadsheet = new Spreadsheet();

$file = $_POST['excel'];

$inputFileType = 'Xlsx';
$inputFileName  = "./upload/$file";

$res = array();

/** Create a new Reader of the type defined in $inputFileType **/
$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
/** Advise the Reader that we only want to load cell data **/
$reader->setReadDataOnly(true);

$worksheetData = $reader->listWorksheetInfo($inputFileName);

foreach ($worksheetData as $worksheet) {

    $sheetName = $worksheet['worksheetName'];

    //echo "<h4>$sheetName</h4>";
    /** Load $inputFileName to a Spreadsheet Object **/
    $reader->setLoadSheetsOnly($sheetName);
    $spreadsheet = $reader->load($inputFileName);

    $worksheet = $spreadsheet->getActiveSheet();
    $arr = $worksheet->toArray();
    $res[] = $arr;
    //echo '<pre>', print_r($arr, 1), '</pre>';
}

echo json_encode($res);
