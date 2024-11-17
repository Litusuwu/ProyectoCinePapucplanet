<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="PapucplanetWA.Pagos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Métodos de Pago</title>
    <!-- Popper.js (necesario para Bootstrap dropdowns y tooltips) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="Styles/Pagos.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
            <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top">
                <div class="container-fluid">
                    <!-- Logo y Título -->
                    <a class="navbar-brand d-flex align-items-center gap-2" href="#" style="text-decoration: none; font-size: 1.25rem;">
                        <i class="fa fa-film" style="font-size: 1.5rem;"></i>
                        <strong>PAPUCPLANET</strong>
                    </a>

                    <div class="mx-auto">
                        <span class="nav-link text-white" style="font-size: 1.1rem;">3. Pago</span>
                    </div>

                    <!-- Elementos de Navegación -->
                    <ul class="navbar-nav ms-auto">

                        <!-- Dropdown de Usuario -->
                        <li class="nav-item dropdown">
                            <asp:LinkButton class="nav-link dropdown-toggle text-white" runat="server" id="lnkPrfCompra" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Bryan Smith Valdiviezo
                            </asp:LinkButton>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="lnkPrfCompra">
                                <li><a class="dropdown-item" href="#">Historial de Compras</a></li>
                                <li><a class="dropdown-item" href="Login.aspx">Cerrar Sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        <div class="container my-5">
            <h2 class="text-center locura">Elige tu método de pago</h2>
            
             <div id="custom-inputs" class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <!-- Nombre Completo -->
                    <div class="group">
                        <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form__field" placeholder=" " required="required" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label for="txtNombreCompleto">Nombre Completo</label>
                    </div>

                    <!-- Número de DNI -->
                    <div class="group">
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form__field" placeholder=" " MaxLength="8" required="required" />
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label for="txtDni">Número</label>
                    </div>
                </div>
            </div>



            <div class="row">
                <!-- Panel izquierdo: opciones de pago -->
                <div class="col-md-4">
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('credit-card')">
                        <i class="fas fa-credit-card"></i> Tarjeta de Crédito/Débito
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('yape')">
                        <i class="fas fa-mobile-alt"></i> Yape
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('plin')">
                        <i class="fas fa-mobile-alt"></i> Plin
                    </button>
                    <button type="button" class="btn btn-payment-option" onclick="showPaymentForm('bank-transfer')">
                        <i class="fas fa-university"></i> Transferencia Interbancaria
                    </button>
                </div>

                <!-- Panel derecho: formulario de pago -->
                <div class="col-md-8">
                    <!-- Formulario de Tarjeta de Crédito/Débito -->
                    <div id="credit-card" class="payment-method-card">
                        <h5><i class="fas fa-credit-card"></i> Tarjeta de Crédito/Débito</h5>
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
                        <asp:Button ID="btnPagarTarjeta" runat="server" CssClass="btn btn-dark w-100 boton-Filtrar" Text="Pagar con Tarjeta" OnClick="btnPagarTarjeta_Click" />
                    </div>

                    <!-- Formulario de Yape -->
                    <div id="yape" class="payment-method-card">
                        <h5><i class="fas fa-mobile-alt"></i> Yape</h5>
                        <p>Escanea el código QR de Yape para realizar el pago.</p>
                        <div class="text-center">
                            <asp:Image ID="imgQrYape" runat="server" CssClass="img-fluid qr-image" ImageUrl="./Images/yape.jpg" alt="QR de Yape" />
                        </div>
                        <asp:Button ID="btnConfirmarYape" runat="server" CssClass="btn btn-dark w-100 mt-3 boton-Filtrar" Text="Confirmar Pago con Yape" OnClick="btnConfirmarYape_Click" />
                    </div>

                    <!-- Formulario de Plin -->
                    <div id="plin" class="payment-method-card">
                        <h5><i class="fas fa-mobile-alt"></i> Plin</h5>
                        <p>Escanea el código QR de Plin para realizar el pago.</p>
                        <div class="text-center">
                            <asp:Image ID="imgQrPlin" runat="server" CssClass="img-fluid qr-image" ImageUrl="./Images/plin.jpg" alt="QR de Plin" />
                        </div>
                        <asp:Button ID="btnConfirmarPlin" runat="server" CssClass="btn btn-dark w-100 mt-3 boton-Filtrar" Text="Confirmar Pago con Plin" OnClick="btnConfirmarPlin_Click" />
                    </div>

                    <!-- Formulario de Transferencia Bancaria -->
                    <div id="bank-transfer" class="payment-method-card">
                        <h5><i class="fas fa-university"></i> Transferencia Interbancaria</h5>
                        <p>Realice la transferencia a cualquiera de los siguientes números de cuenta:</p>
                        <ul>
                            <li>BCP: 123-456789-0-12</li>
                            <li>Interbank: 234-567890-1-23</li>
                            <li>BBVA: 345-678901-2-34</li>
                        </ul>
                        <asp:TextBox ID="txtNumeroOperacion" runat="server" CssClass="form-control" placeholder="Número de Operación" />
                        <asp:Button ID="btnConfirmarTransferencia" runat="server" CssClass="btn  w-100 mt-3 boton-Filtrar" Text="Confirmar Pago por Transferencia" OnClick="btnConfirmarTransferencia_Click" />
                    </div>
                </div>
            </div>
        </div>
        
    </form>
    <footer class="bg-dark text-white text-center py-3 fixed-bottom">
        <p>&copy; 2024 PAPUCPLANET - Confitería del Cine. Todos los derechos reservados.</p>
    </footer>
    <!-- Script de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <script>
        function showPaymentForm(formId) {
            // Oculta todos los formularios
            document.querySelectorAll('.payment-method-card').forEach(function(form) {
                form.classList.remove('active-payment');
            });

            // Muestra el formulario seleccionado
            document.getElementById(formId).classList.add('active-payment');
        }
    </script>
</body>
</html>