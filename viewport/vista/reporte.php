<div class="card-body vh-100 row justify-content-center align-items-center">
    <div class="cuadro m-2 card-body ">
        <div class="row">
            <div class="col-sm mb-3">
                <div class="title">
                    <h5>PCPP GESTIONADOR</h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <h5 style="text-align:center; font-family: inherit;font-size: 15px;color: #000;line-height: 1.2;">-------------- Seleccione el Año y Establecimiento a buscar --------------</h5>
            </div>
        </div>
        <br>
        <!--div class="row">
            <div class="col-sm mb-3">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-2">
                        <label for="anio">AÑO:</label>
                    </div>
                    <div class="col">
                        <select name="anio" id="anio" class="form-control form-control-sm">
                            <?php
                            for ($i = date('Y'); $i >= 2018; $i--) {
                            ?>
                                <option value="<?= $i; ?>"><?= $i; ?></option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm mb-3">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-2">
                        <label for="periodo">PERIODO:</label>
                    </div>
                    <div class="col">
                        <select name="periodo" id="periodo" class="form-control form-control-sm">
                        </select>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </div-->
        <div class="row">
            <div class="col-sm">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-2">
                        <label for="establecimiento">EESS:</label>
                    </div>
                    <div class="col-sm mb-3">
                        <select name="establecimiento" id="establecimiento" class="form-control form-control-sm"></select>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-2">
                        <label for="archivoupdate">Archivo:</label>
                    </div>
                    <div class="col-sm mb-3">
                        <input type="file" name="archivoupdate" id="archivoupdate" class="form-control form-control-sm">
                        <input type="hidden" name="archivo" id="archivo">
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
        </div>
        <!--br-->

        <?php

        if ($perfil == 1) {
        ?>
            <div class="row">
                <div class="col-sm mb-3">
                    <button name="btnPlantilla" id="btnPlantilla" type="button" class="btn btn-sm btn-outline-secondary">PLANTILLA</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnImportar" id="btnImportar" type="button" class="btn btn-sm btn-outline-info">IMPORTAR</button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm mb-3">
                    <button name="btnExportar" id="btnExportar" type="button" class="btn btn-sm btn-outline-success" disabled>EXPORTAR PCPP</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnExpAud" id="btnExpAud" type="button" class="btn btn-sm btn-outline-primary" disabled>EXPORTAR AUDITOR</button>
                </div>
            </div>
        <?php
        } else if ($perfil == 2) {
        ?>
            <div class="row">
                <div class="col-sm mb-3">
                    <button name="btnPlantilla" id="btnPlantilla" type="button" class="btn btn-sm btn-outline-secondary">PLANTILLA</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnImportar" id="btnImportar" type="button" class="btn btn-sm btn-outline-info">IMPORTAR</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnExpAud" id="btnExpAud" type="button" class="btn btn-sm btn-outline-primary" disabled>EXPORTAR</button>
                </div>
            </div>
        <?php
        } else if ($perfil == 3) {
        ?>
            <div class="row">
                <div class="col-sm mb-3">
                    <button name="btnPlantilla" id="btnPlantilla" type="button" class="btn btn-sm btn-outline-secondary">PLANTILLA</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnImportar" id="btnImportar" type="button" class="btn btn-sm btn-outline-info">IMPORTAR</button>
                </div>
            </div>
            <div class="row">
                <div class="col-sm mb-3">
                    <button name="btnExportar" id="btnExportar" type="button" class="btn btn-sm btn-outline-success" disabled>EXPORTAR PCPP</button>
                </div>
                <div class="col-sm mb-3">
                    <button name="btnExpAud" id="btnExpAud" type="button" class="btn btn-sm btn-outline-primary" disabled>EXPORTAR AUDITOR</button>
                </div>
            </div>
        <?php
        }
        ?>



    </div>

</div>