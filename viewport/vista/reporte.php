<div class="card-body">

    <div class="row">
        <div class="col-sm-2 mb-3">
            <div class="row">
                <div class="col-3">
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
        <div class="col-sm-6 mb-3">
            <div class="row">
                <div class="col-1">
                    <label for="establecimiento">EESS:</label>
                </div>
                <div class="col">
                    <select name="establecimiento" id="establecimiento" class="form-control form-control-sm"></select>
                </div>
            </div>
        </div>
        <div class="col-sm mb-3">
            <button name="btnReporte" id="btnReporte" type="button" class="btn btn-sm btn-outline-dark">REPORTE PCPP</button>
        </div>
    </div>

</div>