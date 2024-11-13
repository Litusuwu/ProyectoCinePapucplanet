let modalFormAgregarNuevaFuncion;
let modalFormError;

function showModalFormAgregarNuevaFuncion() {
    modalFormAgregarNuevaFuncion = new bootstrap.Modal(document.getElementById('form-modal-agregar-nueva-funcion'));
    modalFormAgregarNuevaFuncion.show();
}

function hideModalFormAgregarNuevaFuncion() {
    modalFormAgregarNuevaFuncion.hide();
}
function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();

    // Agregar evento para reabrir el modal anterior al cerrar el modal de error
    document.getElementById('errorModal').addEventListener('hidden.bs.modal', function () {
        // Reabre el modal de agregar o modificar función al cerrar el modal de error
        showModalFormAgregarNuevaFuncion();
    }, { once: true }); // { once: true } asegura que se ejecute solo una vez
}