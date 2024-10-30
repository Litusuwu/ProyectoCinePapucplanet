<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Funciones.aspx.cs" Inherits="PapucplanetWA.Funciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card no-border">
            <div class="card-header card-header-colored">
                <div class="row">
                     <div class="col-md-2">
                         <asp:Image ID="imgPosterPromocional" runat="server" CssClass="img-fluid img-thumbnail" Height="150" Width="100" />
                     </div>
                     <div class="col-md-6">
                         <h5><asp:Label ID="lblTituloPelicula" runat="server" Text="lblTituloPelicula" CssClass="col-form-label fw-bold"></asp:Label></h5>
                         <asp:Label ID="lblSinopsis" runat="server" Text="lblSinopsis" CssClass="col-form-label fw-bold"></asp:Label>
                     </div>
                </div>
                <div class="row">
                    <h5>
                        <asp:Label ID="lblTitulo" runat="server" Text="Información de las funciones"></asp:Label>
                    </h5>
                </div>
            </div>
            <div class="card-body pb-3">
                <div class="row">
                    
                </div>
            </div>
            <div class="card-footer clearfix">
                
            </div>
        </div>
    </div>
</asp:Content>
