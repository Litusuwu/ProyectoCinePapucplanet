function showModalFormBebidaDetalle() {
    var modalFormBebidaDetalle = new bootstrap.Modal(document.getElementById('form-modal-bebida-detalle'));
    modalFormBebidaDetalle.toggle();
}

function showModalFormAlimentoDetalle() {
    var modalFormAlimentoDetalle = new bootstrap.Modal(document.getElementById('form-modal-alimento-detalle'));
    modalFormAlimentoDetalle.toggle();
}

let modalFormError;
function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();
}
