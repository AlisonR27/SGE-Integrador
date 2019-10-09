//Alerts
function AlertInsertSuccessful() {
    alert("O seu formulário foi submetido com sucesso!");
}
function AlertInsertFailed() {
    alert("Falha ao tentar submeter formulário!");
}


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}