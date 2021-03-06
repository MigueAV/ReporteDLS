<?php

class gestion_model
{
    private $db;
    private $dbg;

    public function __construct()
    {
        $this->db = database::conexionAuditoria();
        $this->dbg = database::conexionGESEGUR();
    }

    public function ResetearUsuario($codusuario, $dni)
    {
        $consulta = "EXEC SIS_ResetearUsuario '$codusuario','$dni'";
        $stmt = sqlsrv_query($this->db, $consulta);
        return $stmt;
    }

    public function ListaEstablecimiento()
    {
        $c = "exec [CTL].[LIST_EESS]";
        $s = sqlsrv_query($this->dbg, $c);
        return $s;
    }

    public function ReportePCPP($eess, $fua, $hist)
    {
        $dato = explode('-', $fua);
        $disa = $dato[0];
        $lote = $dato[1];
        $numero = $dato[2];
        $c = "exec [dbo].[REPORTE_PCPP] '$eess', '$disa', '$lote', '$numero', '$hist'";
        $s = sqlsrv_query($this->db, $c);
        return $s;
    }

    public function REPORTE_PCPP_EXT($eess, $fua, $hist)
    {
        $dato = explode('-', $fua);
        $disa = $dato[0];
        $lote = $dato[1];
        $numero = $dato[2];
        $c = "exec [dbo].[REPORTE_PCPP_EXT] '$eess', '$disa', '$lote', '$numero', '$hist'";
        $s = sqlsrv_query($this->db, $c);
        return $s;
    }

    public function ListarPeriodo(){
        $c = "exec listarPeriodo";
        $s = sqlsrv_query($this->db, $c);
        return $s;
    }
}
