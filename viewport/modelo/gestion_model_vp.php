<?php

class gestion_model_vp{
    private $db;

    public function __construct()
    {
        $this->db = database::conexionAuditoria();
    }

}