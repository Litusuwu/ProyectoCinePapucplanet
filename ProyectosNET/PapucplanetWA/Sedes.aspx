<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Sedes.aspx.cs" Inherits="PapucplanetWA.Sedes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Sedes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Sedes</h2>
            <a href="#" class="btn btn-primary rounded-circle">
                <i class="fa-solid fa-plus"></i> Añadir
            </a>
        </div>
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <!-- Tarjeta 1 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 1</h5>
                </div>
            </div>
            <!-- Tarjeta 2 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 2</h5>
                </div>
            </div>
            <!-- Tarjeta 3 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 3</h5>
                </div>
            </div>
            <!-- Tarjeta 4 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 4</h5>
                </div>
            </div>
            <!-- Tarjeta 5 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 5</h5>
                </div>
            </div>
            <!-- Tarjeta 6 -->
            <div class="col">
                <div class="card text-center p-3 border-0 shadow-sm">
                    <i class="fa-solid fa-building card-icon"></i>
                    <h5 class="mt-2">Sede 6</h5>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
