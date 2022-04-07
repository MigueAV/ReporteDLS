<div>

<div class="row">
    <div class="col-sm-1 mb-3">
        <label for="anio">AÑO</label>
        <select name="anio" id="anio" class="form-control form-control-sm">
            <?php 
                for($i=date('Y'); $i>=2018; $i--){
                    ?>
                        <option value="<?=$i;?>"><?=$i;?></option>
                    <?php
                }
            ?>
        </select>
    </div>
    <div class="col-sm mb-3">
        <label for="establecimiento">EESS</label>
        <select name="establecimiento" id="establecimiento" class="form-control form-control-sm"></select>
    </div>
    <div class="col-sm mb-3">
        <button type="button" class="btn btn-sm btn-outline-dark">REPORTE PCPP</button>
    </div>
</div>

</div>

