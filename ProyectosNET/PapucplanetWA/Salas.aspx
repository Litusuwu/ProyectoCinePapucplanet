<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Salas.aspx.cs" Inherits="PapucplanetWA.Salas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Salas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">

<div class="container mt-5">
    <!-- Movie Header -->
    <div class="row bg-white shadow rounded p-3 mb-4">
        <div class="col-md-3">
            <i class="fa-solid fa-building fs-1 custom-body-card"></i>
        </div>
        <div class="col-md-9">
            <h2><asp:Label ID="lblSedeNombre" runat="server" Text="Sede 1"></asp:Label></h2>
            <p>Ubicación: <asp:Label ID="lblUbicacion" runat="server" Text="Ubicación"></asp:Label></p>
            <div class="d-flex gap-2">
                <button class="btn btn-primary"><i class="fas fa-edit"></i> Editar Sede</button>
                <button class="btn btn-danger"><i class="fas fa-plus"></i> Agregar Nueva Sala</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>
