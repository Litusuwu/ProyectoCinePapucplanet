<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="AgregarNuevaPelicula.aspx.cs" Inherits="PapucplanetWA.AgregarNuevaPelicula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card no-border">
            <div class="card-header card-header-colored">
                <h5>
                    <!-- Cambiar el titulo dependiendo de si se registran o muestran datos -->
                    <asp:Label ID="lblTitulo" runat="server" Text="Datos de la película"></asp:Label>
                </h5>
            </div>
            <div class="card-body pb-2">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="lblImagenPromocional" runat="server" Text="Imagen Promocional:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:Image ID="imgImagenPromocional" runat="server" CssClass="img-fluid img-thumbnail" ImageUrl="/Images/placeholder.jpg" Height="450" Width="350" />
                        <asp:FileUpload ID="fileUploadImagenPromocional" CssClass="form-control mb-2" runat="server" onchange="this.form.submit()" ClientIDMode="Static" style="width: 350px;"/>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-12 pb-md-3">
                            <asp:Label ID="lblNombrePelicula" runat="server" Text="Título de la película:" CssClass="col-form-label fw-bold text-red"></asp:Label>
                            <asp:TextBox ID="txtNombrePelicula" runat="server" CssClass="form-control" placeholder="Ingrese el título de la película"></asp:TextBox>
                        </div>
                        <div class="col-md-12 pb-md-3">
                            <asp:Label ID="lblGenero" runat="server" Text="Seleccione el género:" CssClass="col-form-label fw-bold"></asp:Label>
                            <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col-md-12 pb-md-3">
                            <asp:Label ID="lblDuracion" runat="server" Text="Duración de la película:" CssClass="col-form-label fw-bold"></asp:Label>
                            <asp:TextBox ID="txtDuracion" runat="server" CssClass="form-control" placeholder="Ingrese la duración (en minutos)"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:Label ID="lblSinopsis" runat="server" Text="Sinopsis de la película:" CssClass="col-form-label fw-bold"></asp:Label>
                            <textarea id="txtSinopsis" runat="server" class="form-control" cols="20" rows="4"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer clearfix">
                <asp:LinkButton ID="lbRegresar" runat="server" Text="<i class='fa-solid fa-rotate-left'></i> Regresar" CssClass="float-start btn btn-secondary" OnClick="lbRegresar_Click" />
                <asp:LinkButton ID="lbGuardar" runat="server" Text="<i class='fa-regular fa-floppy-disk'></i> Guardar" CssClass="float-end btn btn-primary" OnClick="lbGuardar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
