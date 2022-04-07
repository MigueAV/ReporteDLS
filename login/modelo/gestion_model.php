<?php
class gestion_model{
    private $db;

    public function __construct() {
        $this->db = database::conexionAuditoria();
    }

    public function IngresarLogin($codusuario,$password){
        $consulta="EXEC IngresarSistema '$codusuario','$password'";
        $stmt=sqlsrv_query($this->db,$consulta);
        $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
        sqlsrv_free_stmt($stmt);
        return $row;
    }
    public function ValidarDatos($codusuario,$dni){
        $consulta="EXEC dbo.SIS_ValidarUsuario '$codusuario','$dni'";
        $stmt=sqlsrv_query($this->db,$consulta);
        $row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
        sqlsrv_free_stmt($stmt);
        return $row;
    }
    public function ResetearUsuario($codusuario,$dni){
        $consulta="EXEC SIS_ResetearUsuario '$codusuario','$dni'";
        $stmt=sqlsrv_query($this->db,$consulta);
        return $stmt;
    }
    public function obtenerperfiles(){
        $consulta="EXEC SIS_ObtenerPerfiles";
        $stmt=sqlsrv_query($this->db,$consulta);
        return $stmt;
    }
    public function validardni($dni){
        $consulta="EXEC SIS_ValidarDni '$dni'";
        $stmt=sqlsrv_query($this->db,$consulta);
        return $stmt;
    }
    public function guardar_usuario($codusuario, $dni, $clave, $perfil, $ape1, $nombres, $ape2){
        $consulta="EXEC SIS_GuardarUsuario '$codusuario','$dni','$clave','$perfil','$ape1','$nombres','$ape2'";
        $stmt=sqlsrv_query($this->db,$consulta);
    }
}
