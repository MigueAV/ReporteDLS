<div>

<div class="row">
    <div class="col-sm-3 mb-3">
        <select name="anio" id="anio">
            <?php 
                for($i=date('yyyy'); $i<=2018; $i--){
                    ?>
                        <option value="<?=$i;?>"><?=$i;?></option>
                    <?php
                }
            ?>
        </select>
    </div>
    <div></div>
    <div></div>
</div>

</div>