<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PapucplanetWA.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenido" runat="server">
    <h1 class="text-center mb-4 mt-1">Bienvenido/a
        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
    </h1>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 g-5">
        <!-- Tarjeta 1: Sedes -->
        <div class="col">
            <div class="card custom-width-card mx-auto text-center bg-custom  border-0 shadow-sm">
                <a href="Sedes.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-building fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Sedes</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 2: Películas -->
        <div class="col">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                <a href="Peliculas.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-film fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Películas</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 3: Consumibles -->
        <div class="col">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                <a href="Consumibles.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-popcorn fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Consumibles</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 4: Funciones -->
        <div class="col">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                <a href="Funciones.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-clapperboard-play fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Funciones</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 5: Boletas -->
        <div class="col mb-5">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                <a href="Boletas.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-receipt fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Boletas</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 6: Reportes -->
        <div class="col mb-5">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm mb">
                <a href="Reportes.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-file-alt fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Reportes</h5>
                    </div>
                </a>
            </div>
        </div>
        <!-- Tarjeta 7: Usuarios -->
        <div class="col mb-5">
            <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                <a href="Usuarios.aspx" class="text-decoration-none">
                    <div class="card-body my-4">
                        <i class="fa-solid fa-users fs-1 custom-body-card"></i>
                        <h5 class="card-title mt-2 custom-body-card">Usuarios</h5>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
