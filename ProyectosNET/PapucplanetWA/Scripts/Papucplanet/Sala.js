let modalFormSedeAdd;
let modalFormError;
function showModalFormSalaAdd() {
    modalFormSedeAdd = new bootstrap.Modal(document.getElementById('form-modal-sala-add'));
    modalFormSedeAdd.show();
}

function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();
}

function hideModalFormSedeAdd() {
    modalFormSedeAdd.hide();
}