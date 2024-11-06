let modalFormSedeAdd;
let modalFormSedeMod;
let modalFormError;
function showModalFormSedeAdd() {
    modalFormSedeAdd = new bootstrap.Modal(document.getElementById('form-modal-sede-add'));
    modalFormSedeAdd.show();
}

function showModalFormSedeMod() {
    modalFormSedeMod = new bootstrap.Modal(document.getElementById('form-modal-sede-mod'));
    modalFormSedeMod.show();
}

function showModalFormError() {
    modalFormError = new bootstrap.Modal(document.getElementById('errorModal'));
    modalFormError.show();
}

function hideModalFormSedeAdd() {
    modalFormSedeAdd.hide();
}

function hideModalFormSedeMod() {
    modalFormSedeMod.hide();
}

