<?php
class database {

    public static function conexionSighos() {
        $serverName = "SERV-SEGUROS\LIMASUR";
        $connectionInfo = array("Database" => "db_sighoshsb","CharacterSet" => "UTF-8", "UID"=>"dev", "PWD"=>"D3v3l0p321r$");
        $conn = sqlsrv_connect($serverName, $connectionInfo);

        if (!$conn) {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <a href="#" class="close" data-dismiss="alert" aria-label="close"><?php echo utf8_encode("x") ?></a>
                <?php echo utf8_encode("Error: No se pudo establecer la conexion con la base de datos..."); ?>
            </div>
            <?php
        }
        return $conn;
    }
    public static function conexionAuditoria() {
        $serverName = "SERV-SEGUROS\LIMASUR";
        $connectionInfo = array("Database" => "SEGUROS","CharacterSet" => "UTF-8", "UID"=>"dev", "PWD"=>"D3v3l0p321r$");
        $conn1 = sqlsrv_connect($serverName, $connectionInfo);

        if (!$conn1) {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <a href="#" class="close" data-dismiss="alert" aria-label="close"><?php echo utf8_encode("x") ?></a>
                <?php echo utf8_encode("Error: No se pudo establecer la conexion con la base de datos Auditoria..."); ?>
            </div>
            <?php
        }
        return $conn1;
    }
    public static function conexionGESEGUR() {
        $serverName = "SERV-SEGUROS\LIMASUR";
        $connectionInfo = array("Database" => "GESEGUR","CharacterSet" => "UTF-8", "UID"=>"dev", "PWD"=>"D3v3l0p321r$");
        $conn = sqlsrv_connect($serverName, $connectionInfo);

        if (!$conn) {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <a href="#" class="close" data-dismiss="alert" aria-label="close"><?php echo utf8_encode("x") ?></a>
                <?php echo utf8_encode("Error: No se pudo establecer la conexion con la base de datos Auditoria..."); ?>
            </div>
            <?php
        }
        return $conn;
    }
 

}
?>