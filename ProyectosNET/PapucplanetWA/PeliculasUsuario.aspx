﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeliculasUsuario.aspx.cs" Inherits="PapucplanetWA.PeliculasUsuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PAPUCPLANET - Películas</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
    <link href="Styles/Peliculas.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">

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
                                <li><a class="dropdown-item" href="HistorialUsuario.aspx">Historial de Compras</a></li>
                                <li><a class="dropdown-item" href="Logout.aspx">Cerrar Sesión</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mb-4">
            <div class="espacio-PeliculasLabel">
                <h1 class="mb-4 locura">Películas</h1>
            </div>
            <div class="container my-4">
                <div class="row text-center align-items-center justify-content-center">
                    <div class="col-6 col-md-2 p-1 ">
                        <div class="p-3 border rounded contenedor-Filtro">
                            <strong>Película</strong>
                            <asp:DropDownList ID="ddlMovie" runat="server" CssClass="form-select mt-2" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-6 col-md-2 p-1">
                        <div class="p-3 border rounded contenedor-Filtro">
                            <strong>Sede</strong>
                            <asp:DropDownList ID="ddlCine" runat="server" CssClass="form-select mt-2" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-6 col-md-2 p-1">
                        <div class="p-3 border rounded contenedor-Filtro">
                            <strong>Fecha</strong>
                            <asp:DropDownList ID="ddlFecha" runat="server" CssClass="form-select mt-2" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-6 col-md-2 p-2">
                        <asp:LinkButton ID="btnFiltrar" runat="server" CssClass="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center boton-Filtrar" OnClick="FiltrarPeliculas">
                                <i class="fas fa-sliders-h me-2" style="color:white;"></i> Filtrar
                        </asp:LinkButton>
                    </div>
                </div>
            </div>



            <asp:Repeater ID="rptMovies" runat="server">
                <HeaderTemplate>
                    <div class="row row-cols-sm-1  row-cols-md-2 row-cols-lg-3 g-4">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 contenedor-Peliculas">
                            <a href='<%# "DetallePelicula.aspx?id_pelicula=" + Eval("idPelicula") %>'>
                                <div class="card-img full-image image-container img-fluid" style="background-image: url('<%#Eval("imagenPromocional").ToString().Substring(1)%>');"></div>
                            </a>
                            <div class="card-body text-center label-Peliculas">
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("titulo") %>' CssClass="card-title"></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            <div style="margin-bottom: 100px;"></div>
        </div>
    </form>
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 PAPUCPLANET - Peliculas del Cine. Todos los derechos reservados.</p>
    </footer>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
