<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialUsuario.aspx.cs" Inherits="PapucplanetWA.HistorialUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PAPUCPLANET - Películas</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet" />
    <link href="Styles/HistorialUsuario.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-collapse navbar-dark bg-black shadow-sm fixed-top navBar-Peliculas">
            <div class="container position-relative">
                <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                    style="text-decoration: none; font-size: 1.25rem; color: white;">
                    <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                    <strong>PAPUCPLANET</strong>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars" style="color: white; font-size: 24px;"></i>
                </button>
                <div class="collapse navbar-collapse navBar-Expandido" id="navbarNav">
                    <ul class="navbar-nav ms-auto navBar-Expandido">
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkPeliculas" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/PeliculasUsuario.aspx">Películas</asp:LinkButton>
                        </li>
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkConfiteria" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/ConfiteriaVUsuario.aspx">Confitería</asp:LinkButton>
                        </li>
                        <li class="nav-item dropdown me-3">
                            <asp:LinkButton runat="server" class="nav-link dropdown-toggle text-decoration-none navBar-Expandido" id="lnkPerfil" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            </asp:LinkButton>
                            <ul class="dropdown-menu" aria-labelledby="lnkPerfilDropdown">
                                <li><a class="dropdown-item" href="#">Historial de Compras</a></li>
                                <li><a class="dropdown-item" href="Logout.aspx">Cerrar Sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
    </nav>

        
        <div class="container mt-5 pt-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="monserrat">Historial de Compras</h2>
                    <div class="d-flex align-items-center ms-auto">
                        <span id="boletasTotal" class="badge bg-darkred me-2 monserrat" style="font-size: 1.25rem;color:black;">0</span>
                        <i class="fas fa-shopping-cart" style="font-size: 1.5rem; color: darkred;"></i>
                    </div>
                </div>
                <hr class="separator-line" />
                <asp:Panel ID="pnlBoletas" runat="server"></asp:Panel>
            </div>
             
        

        <footer class="bg-dark text-white text-center py-3 sticky-bottom">
            <p>&copy; 2024 PAPUCPLANET - Peliculas del Cine. Todos los derechos reservados.</p>
        </footer>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
