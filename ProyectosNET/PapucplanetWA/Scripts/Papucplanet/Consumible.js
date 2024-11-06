function showModalFormBebidaDetalle() {
    var modalFormBebidaDetalle = new bootstrap.Modal(document.getElementById('form-modal-bebida-detalle'));
    modalFormBebidaDetalle.toggle();
}

function showModalFormAlimentoDetalle() {
    var modalFormAlimentoDetalle = new bootstrap.Modal(document.getElementById('form-modal-alimento-detalle'));
    modalFormAlimentoDetalle.toggle();
}

let modalFormError;
function showModalFromError() {
    modalFromConsumible = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFromConsumible.show();
}
