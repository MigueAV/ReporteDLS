<?php


require '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

$file = $_POST['excel'];

$rutaArchivo  = "./upload/$file";

$res = array();

try {
    $documento = IOFactory::load($rutaArchivo);
    $totalDeHojas = $documento->getSheetCount();

    for ($indiceHoja = 0; $indiceHoja < $totalDeHojas; $indiceHoja++) {
        $hojaActual = $documento->getSheet($indiceHoja);
        $numeroMayorDeFila = $hojaActual->getHighestRow(); // Numérico
        $letraMayorDeColumna = $hojaActual->getHighestColumn(); // Letra
        $numeroMayorDeColumna = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::columnIndexFromString($letraMayorDeColumna);

        for ($indiceFila = 1; $indiceFila <= $numeroMayorDeFila; $indiceFila++) {
            $n = ''; $fua = ''; $his = '';
            for ($indiceColumna = 1; $indiceColumna <= $numeroMayorDeColumna; $indiceColumna++) {
                $celda = $hojaActual->getCellByColumnAndRow($indiceColumna, $indiceFila);
                $valorRaw = $celda->getValue();
                $valorFormateado = $celda->getFormattedValue();
                $valorCalculado = $celda->getCalculatedValue();
                $fila = $celda->getRow();

                $columna = $celda->getColumn();

                if($columna == 'A') $n = $valorRaw;
                if($columna == 'B') $fua = $valorRaw;
                if($columna == 'C') $his = $valorRaw;                
            }
            $res[]  = array('N' => $n, 'fua' => $fua, 'his' => $his);
        }
    }

    $worksheetData = $reader->listWorksheetInfo($inputFileName);

    $res = array();

    foreach ($worksheetData as $worksheet) {
        $sheetName = $worksheet['worksheetName'];
        $reader->setLoadSheetsOnly($sheetName);
        $spreadsheet = $reader->load($inputFileName);

        $worksheet = $spreadsheet->getActiveSheet();
        $arr = $worksheet->toArray();
        $n      = print_r($arr, 1);
        $fua    = print_r($arr, 2);
        $his    = print_r($arr, 3);
    }
} catch (Exception $e) {
    $res[] = array('Error' => $e);
}



echo json_encode($res);
