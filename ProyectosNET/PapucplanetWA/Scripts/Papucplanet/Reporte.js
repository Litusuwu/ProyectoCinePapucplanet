function showModalFormConvencion() {
    modalFormConvencion = new bootstrap.Modal(document.getElementById('form-modal-fechas-convencion'));
    modalFormConvencion.show();
}

let modalFormError;
function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();
}
