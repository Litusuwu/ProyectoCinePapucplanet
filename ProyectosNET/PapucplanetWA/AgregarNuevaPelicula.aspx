<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="AgregarNuevaPelicula.aspx.cs" Inherits="PapucplanetWA.AgregarNuevaPelicula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Pelicula.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="card no-border">
            <div class="card-header card-header-colored">
                <h5>
                    <!-- Cambiar el titulo dependiendo de si se registran o muestran datos -->
                    <asp:Label ID="lblTitulo" runat="server" Text="Datos de la película" CssClass="text-red"></asp:Label>
                </h5>
            </div>
            <div class="card-body pb-2">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="lblImagenPromocional" runat="server" Text="Imagen Promocional:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:Image ID="imgImagenPromocional" runat="server" CssClass="img-fluid img-thumbnail" ImageUrl="/Images/placeholder.jpg" Height="450" Width="350" />
                        <asp:FileUpload ID="fileUploadImagenPromocional" CssClass="form-control mb-2" runat="server" onchange="this.form.submit()" ClientIDMode="Static" style="width: 350px;"/>
                    </div>
                    <div class="col-md-8">
                        <div class="col-md-12 pb-md-3">
                            <asp:Label ID="lblNombrePelicula" runat="server" Text="Título de la película:" CssClass="col-form-label fw-bold"></asp:Label>
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
                <asp:LinkButton ID="lbGuardar" runat="server" Text="<i class='fa-regular fa-floppy-disk'></i> Guardar" CssClass="float-end btn btn-purple" OnClick="lbGuardar_Click" />
            </div>
        </div>
    </div>
    <!--POP UP de Error-->
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="errorModalLabel">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>Mensaje de Error
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblMensajeError" runat="server" Text="Mensaje de ejemplo..." CssClass="form-text text-danger"></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
