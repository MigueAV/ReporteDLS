<div class="card-body vh-100 row justify-content-center align-items-center">
    <div class="cuadro m-2 card-body ">
        <div class="row">
            <div class="col-sm mb-3">
                <div class="title">
                    <h5>REPORTE - PCPP</h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
            <h5 style="text-align:center; font-family: inherit;font-size: 15px;color: #000;line-height: 1.2;">-------------- Seleccione el Año y Establecimiento a buscar --------------</h5>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm mb-3">
                <div class="row">
                    <div class="col-1">
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
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm">
                <div class="row">
                    <div class="col-1">
                        <label for="establecimiento">EESS:</label>
                    </div>
                    <div class="col">
                        <select name="establecimiento" id="establecimiento" class="form-control form-control-sm"></select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm">
                <div class="row">
                    <div class="col-2">
                        <label for="archivoupdate">Archivo:</label>
                    </div>
                    <div class="col">
                        <input name="archivoupdate" id="archivoupdate" class="form-control form-control-sm" type="file" />
                    </div>
                </div>
            </div>
        </div>
        <!--br-->
        <div class="row">
            <div class="col-sm">
                <button name="btnImportar" id="btnImportar" type="button" class="btn btn-sm btn-outline-dark">IMPORTAR</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm">
                <button name="btnExportar" id="btnExportar" type="button" class="btn btn-sm btn-outline-dark">EXPORTAR</button>
            </div>
        </div>

    </div>



</div>