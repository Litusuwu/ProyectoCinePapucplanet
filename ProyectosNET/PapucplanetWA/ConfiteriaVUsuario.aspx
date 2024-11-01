<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfiteriaVUsuario.aspx.cs" Inherits="PapucplanetWA.ConfiteriaVUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet"/>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet"/>
    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet"/>
    
    <link href="Styles/Confiteria.css" rel="stylesheet" />
    <title>Confitería</title>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar fixed-top navBar-login">
        <div class="container-fluid">
            <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasVUsuario.aspx"
                style="text-decoration: none; font-size: 1.25rem;">
                <i class="fa fa-film icon d-inline-block align-text-top" alt="Logo" width="20" height="44"/></i>
                PAPUCPLANET
            </a>
        </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm navBar-Confiteria">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <i class="mdi mdi-popcorn cinema-icon" style="font-size: 24px; color:white;"></i>
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
        <div class="container my-4">
            <asp:Panel ID="panelAll" runat="server" CssClass="row">
                <asp:Repeater ID="rptAllItems" runat="server" OnItemDataBound="rptAllItems_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src='<%# Eval("UrlImagen").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("Nombre") %>'>
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><strong>S/. <%# Eval("Precio") %></strong></p>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("Id") %>' OnClick="DecrementarCantidad_Click" />
                                        <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0"/>
                                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("Id") %>' OnClick="IncrementarCantidad_Click" />
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
                                <img src='<%# Eval("UrlImagen").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("Nombre") %>'>
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><strong>S/. <%# Eval("Precio") %></strong></p>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("Id") %>' OnClick="DecrementarCantidad_Click" />
                                        <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0" />
                                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("Id") %>' OnClick="IncrementarCantidad_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
            <asp:Panel ID="panelBebidas" runat="server" CssClass="row" Visible="false">
                <asp:Repeater ID="rptBebidas" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 mb-3">
                            <div class="card">
                               <img src='<%# Eval("UrlImagen").ToString().Substring(1) %>' class="card-img-top carta" alt='<%# Eval("Nombre") %>'>
                                <div class="card-body text-center">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><strong>S/. <%# Eval("Precio") %></strong></p>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-outline-dark btn-sm me-2" CommandArgument='<%# Eval("Id") %>' OnClick="DecrementarCantidad_Click" />
                                        <asp:Label ID="lblQuantity" runat="server" CssClass="quantity-label" Text="0" />
                                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-outline-dark btn-sm ms-2" CommandArgument='<%# Eval("Id") %>' OnClick="IncrementarCantidad_Click" />
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
            <div class="container my-4 d-flex justify-content-end">
                <div class="checkout-section">
                    <a href="#" class="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center boton-Filtrar">
                        <i class="fas fa-shopping-cart me-2"></i> 
                        Continuar
                        <asp:Label ID="cartCount" runat="server" CssClass="badge bg-dark ms-2">0</asp:Label>
                    </a>
                </div>
            </div>
        </div>
   

    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 PAPUCPLANET - Confitería del Cine. Todos los derechos reservados.</p>
    </footer>
        </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
