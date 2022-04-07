<?php

class gestion_model{
    private $db;

    public function __construct()
    {
        $this->db = database::conexionAuditoria();
    }

    public function ResetearUsuario($codusuario,$dni){
        $consulta="EXEC SIS_ResetearUsuario '$codusuario','$dni'";
        $stmt=sqlsrv_query($this->db,$consulta);
        return $stmt;
    }

}