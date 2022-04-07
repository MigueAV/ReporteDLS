<script>
  $(function() {
    $("#modalMensaje").draggable({
      handle: ".modal-header"
    });
    $('#modalMensaje').on('shown.bs.modal', function(e) {
      $('.focus').focus();
    });
  });
</script>

<button id="abrir_modal_mensaje" style="display:none;" data-toggle="modal" data-target="#modalMensaje">ABRIR MODAL </button>

<div class="modal fade" tabindex="-1" role="dialog" id="modalMensaje">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="padding:5px;">
        <h5 class="modal-title" style="padding:0;margin:1px;">Mensaje</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="padding-top:5px;padding-bottom:5px;">
        <div class="row" style="padding-top:0;padding-bottom:0;">
          <div class="col-sm-2">
            <img src="./img/cancel.png" class="center-block img-responsive" width='60' height='50'>
          </div>
          <div class="col-sm-10" style="justify-content: center;display: flex;text-align:center;padding-left:0;">
            <textarea id="mensaje" name="mensaje" class="form-control form-control-sm" style="text-align:center;font-weight:bolder;border-color:transparent;font-size:17px;background-color:transparent;" disabled></textarea>
          </div>
        </div>


      </div>
      <div class="modal-footer" style="text-align:center;float:middle;justify-content: center;padding-top:0;padding-bottom:0;">
        <button type="button" id="cierremensaje" class="btn btn-sm btn-outline-dark focus" style="text-align:center;float:middle;justi" autofocus data-dismiss="modal">ACEPTAR</button>
      </div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function() {
    $("#cierremensaje").keyup(function(event) {
      if (event.keyCode === 13) {
        $("#cierremensaje").click();
      }
    });
  });
</script>