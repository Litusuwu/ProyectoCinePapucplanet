function showModalFormConvencion() {
    modalFormConvencion = new bootstrap.Modal(document.getElementById('form-modal-fechas-convencion'));
    modalFormConvencion.show();
}

let modalFormError;
function showModalFromError() {
    modalFormReporte = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormReporte.show();
}
