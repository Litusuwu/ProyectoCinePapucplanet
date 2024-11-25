<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfiteriaVUsuario.aspx.cs" Inherits="PapucplanetWA.ConfiteriaVUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome (solo una versión) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <!-- Material Design Icons -->
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />

    <!-- Fuentes de Google -->
    <link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet" />

    <!-- Archivos CSS personalizados -->
    <link href="Styles/Confiteria.css" rel="stylesheet" />
    <link href="Styles/Butacas.css" rel="stylesheet" />
    <link href="Styles/Peliculas.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <!-- JavaScript: JQuery (necesario para algunas funcionalidades) -->
    <script src="Scripts/jquery-3.7.1.js"></script>

    <!-- Popper.js (necesario para Bootstrap dropdowns y tooltips) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <title>Confitería</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="butContainer" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="panelConfiteria" runat="server">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top navBar-Butacas">
                        <div class="container d-flex justify-content-between align-items-center">
                            <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                                style="text-decoration: none; font-size: 1.25rem; color: white;">
                                <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                                <strong>PAPUCPLANET</strong>
                            </a>
                            <div class="mx-auto text-center flex-grow-2">
                                <span class="navbar-text text-white">2. Confitería</span>
                            </div>

                            <div class="collapse navbar-collapse" id="navbarNav2">
                                <ul class="navbar-nav ms-auto">
                                    <li class="nav-item dropdown me-3">
                                        <asp:LinkButton runat="server" class="nav-link dropdown-toggle text-decoration-none navBar-Expandido" ID="lnkPrfCompra" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        </asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </asp:Panel>


                <asp:Panel ID="panelPeliculas" runat="server">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top">
                        <div class="container position-relative">
                            <a class="navbar-brand d-flex align-items-center" href="PeliculasUsuario.aspx">
                                <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                                <strong>PAPUCPLANET</strong>
                            </a>
                            <button class="navbar-toggler navBar-Expandido" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavConfiteria" aria-controls="navbarNavConfiteria" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="fas fa-bars" style="color: white; font-size: 24px;"></i>
                            </button>
                            <div class="collapse navbar-collapse navBar-Expandido" id="navbarNavConfiteria">
                                <ul class="navbar-nav ms-auto navBar-Expandido">
                                    <li class="nav-item me-3">
                                        <asp:LinkButton ID="lnkPeliculas" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/PeliculasUsuario.aspx">Películas</asp:LinkButton>
                                    </li>
                                    <li class="nav-item me-3">
                                        <asp:LinkButton ID="lnkConfiteria" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/ConfiteriaVUsuario.aspx">Confitería</asp:LinkButton>
                                    </li>
                                    <li class="nav-item dropdown me-3">
                                        <asp:LinkButton runat="server" class="nav-link dropdown-toggle text-decoration-none navBar-Expandido" ID="lnkPerfilOutside" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        </asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </asp:Panel>
                <nav class="navbar navbar-expand-lg navbar-dark shadow-sm navBar-Confiteria">
                    <div class="container">
                        <a class="navbar-brand d-flex align-items-center" href="#">
                            <i class="mdi mdi-popcorn cinema-icon" style="font-size: 24px; color: white;"></i>
                        </a>
                        <button class="navbar-toggler navBar-Expandido" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars" style="color: white; font-size: 24px;"></i>
                        </button>
                        <div class="collapse navbar-collapse navBar-Expandido" id="navbarNav">
                            <ul class="navbar-nav ms-3 navBar-Expandido">
                                <li class="nav-item me-3">
                                    <asp:LinkButton ID="btnAll" runat="server" Text="Todos" CssClass="nav-link navBar-Expandido" OnClick="MostrarPanel" CommandArgument="all" />
                                </li>
                                <li class="nav-item me-3">
                                    <asp:LinkButton ID="btnAlimentos" runat="server" Text="Alimentos" CssClass="nav-link navBar-Expandido" OnClick="MostrarPanel" CommandArgument="alimentos" />
                                </li>
                                <li class="nav-item me-3">
                                    <asp:LinkButton ID="btnBebidas" runat="server" Text="Bebidas" CssClass="nav-link navBar-Expandido" OnClick="MostrarPanel" CommandArgument="bebidas" />
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container my-4"  style="padding-top: 15px;">

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
                <div class="container my-4">
                    <div class="container my-4">
                        <asp:Panel ID="panelAll" runat="server" CssClass="row">
                            <asp:Repeater ID="rptAllItems" runat="server" OnItemDataBound="rptAllItems_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src='<%# Eval("imagenURL").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("nombre") %>'>
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                                <p class="card-text"><strong>S/. <%# Eval("precio") %></strong></p>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="DecrementarCantidad_Click" />
                                                    <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0" />
                                                    <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="IncrementarCantidad_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:Panel ID="panelAlimentos" runat="server" CssClass="row" Visible="false">
                            <asp:Repeater ID="rptAlimentos" runat="server" OnItemDataBound="rptAllItems_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src='<%# Eval("imagenURL").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("nombre") %>'>
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                                <p class="card-text"><strong>S/. <%# Eval("precio") %></strong></p>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="DecrementarCantidad_Click" />
                                                    <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0" />
                                                    <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="IncrementarCantidad_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <asp:Panel ID="panelBebidas" runat="server" CssClass="row" Visible="false">
                            <asp:Repeater ID="rptBebidas" runat="server" OnItemDataBound="rptAllItems_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img src='<%# Eval("imagenURL").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("nombre") %>'>
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                                <p class="card-text"><strong>S/. <%# Eval("precio") %></strong></p>
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="DecrementarCantidad_Click" />
                                                    <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0" />
                                                    <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("id") + "," + Eval("tipo") %>' OnClick="IncrementarCantidad_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <div class="container my-4 d-flex justify-content-end">
                            <div id="cart" runat="server" class="checkout-section">
                                <asp:LinkButton ID="btnContinue" runat="server" CssClass="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center boton-Filtrar" OnClick="btnContinue_Click">
                                    <i class="fas fa-shopping-cart me-2"></i>
                                    Continuar
                                <asp:Label ID="cartCount" runat="server" CssClass="badge bg-dark ms-2">0</asp:Label>
                                </asp:LinkButton>
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

                    <footer class="bg-dark text-white text-center py-3">
                        <p>&copy; 2024 PAPUCPLANET - Confitería del Cine. Todos los derechos reservados.</p>
                    </footer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
