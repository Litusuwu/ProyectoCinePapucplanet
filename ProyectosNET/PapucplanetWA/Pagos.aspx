<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="PapucplanetWA.Pagos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Métodos de Pago</title>
    <!-- Popper.js (necesario para Bootstrap dropdowns y tooltips) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Styles/Butacas.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="Styles/Pagos.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server" onkeydown="handleEnter(event);">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top navBar-Butacas">
            <div class="container d-flex justify-content-between align-items-center">
                <!-- Logo y Título -->
                <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                    style="text-decoration: none; font-size: 1.25rem; color: white;">
                    <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                    <strong>PAPUCPLANET</strong>
                </a>

                <div class="mx-auto text-center flex-grow-2">
                    <span class="navbar-text text-white">3. Pago</span>
                </div>

                <!-- Elementos de Navegación -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item dropdown me-3">
                            <asp:LinkButton runat="server" class="nav-link dropdown-toggle text-decoration-none navBar-Expandido" ID="lnkPrfCompra" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container my-4" style="padding-top: 55px;">

            <div class="d-flex justify-content-between">
                <asp:LinkButton ID="btnRegresar" runat="server"
                    CssClass="btn btn-outline-dark w-25 d-flex align-items-center justify-content-center boton-Filtrar"
                    OnClick="btnRegresar_Click">
                            Regresar al Paso Anterior
                        </asp:LinkButton>
                <asp:LinkButton ID="btnCancel" runat="server" 
                    CssClass="btn btn-outline-dark btn-sm d-flex align-items-center justify-content-center boton-Filtrar"
                    OnClientClick="$('#confirmCancelModal').modal('show'); return false;">
                            <i class="fas fa-window-close"></i> Cancelar
                </asp:LinkButton>
            </div>
        </div>
        <div class="container my-5">
            <div style="margin-bottom: 100px;"></div>
            <h2 class="text-center locura">Elige tu método de pago</h2>

            <div id="custom-inputs" class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <!-- Nombre Completo -->
                    <div class="group">
                        <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form__field" placeholder=" " />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label for="txtNombreCompleto">Nombre Completo</label>
                        <!-- Etiqueta para mostrar error -->
                        <asp:Label ID="lblErrorNombreCompleto" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                    </div>

                    <!-- Número de DNI -->
                    <div class="group">
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form__field" placeholder=" " MaxLength="8" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label for="txtDni">DNI</label>
                        <!-- Etiqueta para mostrar error -->
                        <asp:Label ID="lblErrorTelefono" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>



            <div class="row">
                <!-- Panel izquierdo: opciones de pago -->
                <div class="col-md-4">
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('credit-card')">
                        <i class="fas fa-credit-card"></i>Tarjeta de Crédito/Débito
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('yape')">
                        <i class="fas fa-mobile-alt"></i>Yape
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('plin')">
                        <i class="fas fa-mobile-alt"></i>Plin
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('bank-transfer')">
                        <i class="fas fa-university"></i>Transferencia Interbancaria
                    </button>
                </div>

                <!-- Panel derecho: formulario de pago -->
                <div class="col-md-8">
                    <asp:UpdatePanel ID="UpdatePanelPagoTarjeta" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>

                            <!-- Modales (Error y Éxito) -->
                            <asp:UpdatePanel ID="UpdatePanelModals" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <!-- Modal de Error -->
                                    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger text-white">
                                                    <h5 class="modal-title" id="errorModalLabel">
                                                        <i class="bi bi-exclamation-triangle-fill me-2"></i>Error </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Etiqueta que muestra el mensaje de error -->
                                                    <asp:Label ID="lblErrorModal" runat="server" CssClass="form-text text-danger"></asp:Label>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal de Éxito -->
                                    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header bg-success text-white">
                                                    <h5 class="modal-title" id="successModalLabel">
                                                        <i class="bi bi-check-circle-fill me-2"></i>Pago Realizado</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="redirectToPeliculas()"></button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    ¡Tu pago ha sido procesado con éxito, te enviaremos tu entrada al correo!
                           
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button"
                                                        class="btn w-100"
                                                        style="background-color: green; color: white; border: none;"
                                                        onclick="redirectToPeliculas()">
                                                        Aceptar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal de Advertencia -->
                                    <div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="warningModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header bg-danger text-white justify-content-center">
                                                    <h5 class="modal-title" id="warningModalLabel">
                                                        <i class="bi bi-exclamation-circle-fill me-2"></i>Advertencia
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    Completa la selección de método de pago antes de continuar.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary w-100" data-bs-dismiss="modal">Cerrar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <!-- Formulario de Tarjeta de Crédito/Débito -->
                    <div id="credit-card" class="payment-method-card">
                        <h5><i class="fas fa-credit-card"></i>Tarjeta de Crédito/Débito</h5>
                        <div class="mb-3">
                            <asp:TextBox ID="txtNumeroTarjeta" runat="server" CssClass="form-control" placeholder="Número de Tarjeta" MaxLength="16" />
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <asp:TextBox ID="txtFechaExpiracion" runat="server" CssClass="form-control" placeholder="MM/AA" MaxLength="5" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control" placeholder="CVV" MaxLength="3" TextMode="Password" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox ID="txtNombreTarjeta" runat="server" CssClass="form-control" placeholder="Nombre en la Tarjeta" />
                        </div>
                        <asp:Button ID="btnPagarTarjeta" runat="server" CssClass="btn btn-dark w-100 boton-Filtrar" Text="Pagar con Tarjeta" OnClick="btnPagarTarjeta_Click"  />
                    </div>

                    <!-- Formulario de Yape -->
                    <div id="yape" class="payment-method-card" style="margin-bottom: 50px;">
                        <h5><i class="fas fa-mobile-alt"></i>Yape</h5>
                        <p>Escanea el código QR de Yape para realizar el pago.</p>
                        <div class="text-center">
                            <asp:Image ID="imgQrYape" runat="server" CssClass="img-fluid qr-image" ImageUrl="./Images/yape.jpg" alt="QR de Yape" />
                        </div>
                        <asp:Button ID="btnConfirmarYape" runat="server" CssClass="btn btn-dark w-100 mt-3 boton-Filtrar" Text="Confirmar Pago con Yape" OnClick="btnConfirmarYape_Click" />
                    </div>

                    <!-- Formulario de Plin -->
                    <div id="plin" class="payment-method-card" style="margin-bottom: 50px">
                        <h5><i class="fas fa-mobile-alt"></i>Plin</h5>
                        <p>Escanea el código QR de Plin para realizar el pago.</p>
                        <div class="text-center">
                            <asp:Image ID="imgQrPlin" runat="server" CssClass="img-fluid qr-image" ImageUrl="./Images/plin.jpg" alt="QR de Plin" />
                        </div>
                        <asp:Button ID="btnConfirmarPlin" runat="server" CssClass="btn btn-dark w-100 mt-3 boton-Filtrar" Text="Confirmar Pago con Plin" OnClick="btnConfirmarPlin_Click" />
                    </div>


                    <!-- Formulario de Transferencia Bancaria -->
                    <div id="bank-transfer" class="payment-method-card">
                        <h5><i class="fas fa-university"></i>Transferencia Interbancaria</h5>
                        <p>Realice la transferencia a cualquiera de los siguientes números de cuenta:</p>
                        <ul>
                            <li>BCP: 123-456789-0-12</li>
                            <li>Interbank: 234-567890-1-23</li>
                            <li>BBVA: 345-678901-2-34</li>
                        </ul>
                        <asp:TextBox ID="txtNumeroOperacion" runat="server" CssClass="form-control" placeholder="Número de Operación" onkeypress="return handleEnter(event, 'btnConfirmarTransferencia');" />
                        <asp:Button ID="btnConfirmarTransferencia" runat="server" CssClass="btn  w-100 mt-3 boton-Filtrar" Text="Confirmar Pago por Transferencia" OnClick="btnConfirmarTransferencia_Click" UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmCancelModalLabel">Confirmación</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro que desea cancelar?
   
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnConfirmCancel" runat="server" CssClass="btn btn-danger" Text="Sí" OnClick="btnCancelar_Click" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 PAPUCPLANET - Pagos del Cine. Todos los derechos reservados.</p>
    </footer>
    <!-- Script de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <script>
        // Función para redirigir a la pantalla de "PeliculasUsuario"
        function redirectToPeliculas() {
            window.location.href = "PeliculasUsuario.aspx";
        }
    </script>

    <script>
        function showPaymentForm(formId) {
            // Oculta todos los formularios
            document.querySelectorAll('.payment-method-card').forEach(function (form) {
                form.classList.remove('active-payment');
            });

            // Muestra el formulario seleccionado
            document.getElementById(formId).classList.add('active-payment');
        }
    </script>

    <script>
        function handleEnter(event) {
            if (event.key === "Enter") {
                event.preventDefault(); // Evita el envío predeterminado del formulario

                // Identifica qué campo está activo
                const activeElement = document.activeElement;

                // Realiza acciones específicas dependiendo del campo activo
                if (activeElement.id === "txtNombreCompleto" || activeElement.id === "txtDni") {
                    // Mostrar el modal de advertencia
                    const warningModal = new bootstrap.Modal(document.getElementById("warningModal"));
                    warningModal.show();
                } else if (activeElement.id === "txtNumeroOperacion") {
                    // Simula un clic en el botón de Confirmar Transferencia
                    const btnTransferencia = document.querySelector("#btnConfirmarTransferencia");
                    if (btnTransferencia) {
                        btnTransferencia.click();
                    }
                } else if (activeElement.id === "txtNumeroTarjeta" || activeElement.id === "txtCvv" || activeElement.id === "txtFechaExpiracion") {
                    // Simula un clic en el botón de Pagar con Tarjeta
                    const btnPagar = document.querySelector("#btnPagarTarjeta");
                    if (btnPagar) {
                        btnPagar.click();
                    }
                }
            }
        }
    </script>

</body>
</html>
