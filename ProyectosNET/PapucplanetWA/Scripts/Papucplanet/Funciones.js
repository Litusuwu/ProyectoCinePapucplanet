let modalFormAgregarNuevaFuncion;
let modalFormError;
let shouldReopenModal = false;

function showModalFormAgregarNuevaFuncion() {
    shouldReopenModal = true;
    modalFormAgregarNuevaFuncion = new bootstrap.Modal(document.getElementById('form-modal-agregar-nueva-funcion'));
    modalFormAgregarNuevaFuncion.show();
}

function hideModalFormAgregarNuevaFuncion() {
    modalFormAgregarNuevaFuncion.hide();
}
function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();
    document.getElementById('errorModal').addEventListener('hidden.bs.modal', function () {
        if (shouldReopenModal) {
            showModalFormAgregarNuevaFuncion();
        }
    }, { once: true });
}