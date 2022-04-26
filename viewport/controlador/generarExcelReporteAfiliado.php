<?php

set_time_limit(99999999999);

require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Color;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

$color = new Color();
$fill = new Fill();
$alignment = new Alignment();
$border = new Border();

$spread = new Spreadsheet();

$sheet = $spread->getActiveSheet();

$spread
    ->getProperties()
    ->setCreator("Diris Lima Sur")
    ->setTitle("Reporte PCPP - $esta")
    ->setCategory('Reporte');

require_once("../../configuracion/database.php");
require_once("../modelo/gestion_model.php");
$model = new gestion_model();

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

$result = array();

/*
RIS	Distrito	EESS	PPDD	afi_tipoformato	afi_mes	afi_periodo	Edad	Grupo Etareo	afi_idsexo	Cantidad
*/

$a = 1;

$sheet->setTitle('X RISS');

$sheet
    ->setCellValue("A$a", 'RIS	Distrito')
    ->setCellValue("B$a", 'EESS')
    ->setCellValue("C$a", 'PPDD')
    ->setCellValue("D$a", 'afi_tipoformato')
    ->setCellValue("E$a", 'afi_mes')
    ->setCellValue("F$a", 'afi_periodo')
    ->setCellValue("G$a", 'Edad')
    ->setCellValue("H$a", 'Grupo Etareo')
    ->setCellValue("I$a", 'afi_idsexo')
    ->setCellValue("J$a", 'Cantidad');

$sheet->getStyle("A$a:D$a")->applyFromArray($styleArray);


$writer = new Xlsx($spreadsheet);
$writer->save('pruebaReal.xlsx');
header("Location: pruebaReal.xlsx");

exit;
