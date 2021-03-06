function saltar(e, id) {
    // Obtenemos la tecla pulsada
    (e.keyCode) ? k = e.keyCode : k = e.which;

    // Si la tecla pulsada es enter (codigo ascii 13)
    if (k == 13) {
        // Si la variable id contiene "submit" enviamos el formulario
        if (id == "submit") {
            document.forms[0].submit();
        } else {
            // nos posicionamos en el siguiente input
            document.getElementById(id).focus();
        }
    }
}

function seleccionar(id) {
    valor_input = document.getElementById(id).value;
    longitud = valor_input.length;
    document.getElementById(id).setSelectionRange(0, longitud);

}

function listaEstablecimiento() {
    $("#establecimiento").empty();
    $.ajax({
        type: 'post',
        url: 'controlador/listaEstablecimiento.php',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (i, e) {
                $("#establecimiento").append('<option value="' + e.value + '">' + e.label + '</option>');
            });
        }
    });
}

function listarPeriodo() {
    $("#periodo").empty();
    $.ajax({
        type: 'post',
        url: 'controlador/listarPeriodo.php',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (i, e) {
                $("#periodo").append('<option value="' + e.Periodo + '">' + e.Nombre + '</option>')
            });
        }
    });
}

$(document).ready(function () {
    listaEstablecimiento();
    listarPeriodo();

    $("#btnReporte").click(function () {
        generarReportePCPP();
    }).keyup(function (event) {
        if (event.keyCode == 13) {
            generarReportePCPP();
        }
    });

    $("#btnImportar").click(function () {
        subirArchivo();
    }).keyup(function (event) {
        if (event.keyCode == 13) {
            subirArchivo();
        }
    });

    $("#btnPlantilla").click(function () {
        DescargarPlantilla();
    }).keyup(function (event) {
        if (event.keyCode == 13) {
            DescargarPlantilla();
        }
    });

    $("#btnExportar").click(function () {
        exportarDataPCPP();
    }).keyup(function (event) {
        if (event.keyCode == 13) {
            exportarDataPCPP();
        }
    });

    $("#btnExpAud").click(function () {
        exportarData();
    }).keyup(function (event) {
        if (event.keyCode == 13) {
            exportarData();
        }
    });
});

function focuscontra() {
    $('#actual_contra').trigger('focus');
}

function guardar_nuevacontra() {
    var dni = $('#nuevop').val();
    var contra_actual = $('#actual_contra').val();
    var nueva_contra = $('#nueva_contra').val();
    var confi_contra = $('#confi_contra').val();
    var usuario = $('#Usuario').val();

    if (contra_actual != dni) {
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('LA CONTRASE??A ACTUAL NO ES LA CORRECTA');
        $('#actual_contra').focus();
    } else if (confi_contra != nueva_contra) {
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('LA CONFIRMACI??N DE LA CONTRASE??A NO COINCIDE CON LA NUEVA CONTRASE??A');

        $('#nueva_contra').val();
    } else if (contra_actual == nueva_contra) {
        $('#abrir_modal_mensaje').click();
        $('#mensaje').html('DEBE INGRESAR UNA CONTRASE??A DIFERENTE A LA ACTUAL');

        $('#nueva_contra').val();
    } else {
        param = {
            nueva_contra: nueva_contra,
            usuario: usuario
        }
        $.ajax({
            type: "POST",
            data: param,
            url: "./controlador/guardar_nuevacontra.php",
            success: function (data) {
                if (data != '') {
                    $('#abrir_modal_mensaje').click();
                    $('#mensaje').html('SE GUARDO LA NUEVA CONTRASE??A, INGRESE NUEVAMENTE CON LA NUEVA CONTRASE??A');

                    $('#btncerracontra').click();
                }

            }
        });
    }
}

function cerrarsesion() {
    window.location = "/ReporteDLS";
}

function generarReportePCPP() {
    var anio = $("#anio").val();
    var eess = $("#establecimiento").val();

    var data = {
        anio: anio,
        eess: eess
    };

    $.ajax({
        type: 'post',
        data: data,
        url: 'controlador/reportePCPP.php',
        dataType: 'json',
        success: function (data) {
            console.log(data);
        }
    });
}

function subirArchivo() {
    var file = $("#archivoupdate")[0].files[0];

    var data = new FormData();
    data.append("archivo", file);

    console.log(data);

    $.ajax({
        url: "controlador/subirArchivo.php",
        type: "post",
        data: data,
        processData: false,
        contentType: false,
        dataType: 'json',
        error: function (e) {
            Swal.fire(
                'Error!',
                'Hubo error',
                'error'
            )

            $("#btnExportar").attr('disabled', true);
            $("#btnExpAud").attr('disabled', true);
        },
        success: function (res) {
            $.each(res, function (i, e) {
                Swal.fire(
                    e.message,
                    '',
                    e.type
                )
                $("#archivo").val(e.file);
                $("#btnExportar").attr('disabled', false);
                $("#btnExpAud").attr('disabled', false);
            })
        }
    });
}

function exportarData() {
    var arc = $("#archivo").val();
    var eess = $("#establecimiento").val();
    var esta = $('select[name="establecimiento"] option:selected').text();
    Swal.showLoading();

    console.log(esta);

    var data = {
        excel: arc,
        eess: eess,
        esta: esta
    }

    $.ajax({
        type: 'post',
        url: 'controlador/leerExcel.php',
        data: data,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            Swal.hideLoading();
            $.each(data, function (i, e) {
                window.location.href = e.link;
            });
        }
    });
}

function exportarDataPCPP(){
    var arc = $("#archivo").val();
    var eess = $("#establecimiento").val();
    var esta = $('select[name="establecimiento"] option:selected').text();
    Swal.showLoading();

    console.log(esta);

    var data = {
        excel: arc,
        eess: eess,
        esta: esta
    }

    $.ajax({
        type: 'post',
        url: 'controlador/generarPCPP.php',
        data: data,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            Swal.hideLoading();
            $.each(data, function (i, e) {
                window.location.href = e.link;
            });
        }
    });
}

function DescargarPlantilla() {
    window.location.href = "../plantilla/Plantilla_PCPP.xlsx"
}

function cerrarsesion() {
    window.location = "/ReporteDLS";
}