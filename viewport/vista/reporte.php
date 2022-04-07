<div class="card-body m-0 vh-100 row justify-content-center align-items-center">

    <div class="cuadro m-3 card-body ">
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
        <div class="row">
            <div class="col-sm mb-3">
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
        <br>
        <div class="row">
            <div class="col-sm">
                <button name="btnReporte" id="btnReporte" type="button" class="btn btn-sm btn-outline-dark">REPORTE PCPP</button>
            </div>
        </div>

    </div>



</div>