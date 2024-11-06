let modalFormAgregarNuevaFuncion;
function showModalFormAgregarNuevaFuncion() {
    modalFormAgregarNuevaFuncion = new bootstrap.Modal(document.getElementById('form-modal-agregar-nueva-funcion'));
    modalFormAgregarNuevaFuncion.show();
}

function hideModalFormAgregarNuevaFuncion() {
    modalFormAgregarNuevaFuncion.hide();
}