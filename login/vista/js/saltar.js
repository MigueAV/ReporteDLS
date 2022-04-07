function saltar(e, id) {
    (e.keyCode) ? k = e.keyCode : k = e.which;
    if (k == 13) {
        if (id == "submit") {
            document.forms[0].submit();
        } else {
            document.getElementById(id).focus();
        }
    }
}