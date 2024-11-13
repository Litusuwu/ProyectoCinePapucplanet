<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="AgregarNuevoConsumible.aspx.cs" Inherits="PapucplanetWA.AgregarNuevoConsumible" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Consumible.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
    <div class="card no-border">
        <div class="card-header card-header-colored">
            <h5>
                <!-- Cambiar el titulo dependiendo de si se registran o muestran datos -->
                <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" CssClass="text-red"></asp:Label>
            </h5>
        </div>
        <div class="card-body pb-2">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblImagenConsumible" runat="server" Text="Imagen Consumible:" CssClass="col-form-label fw-bold"></asp:Label>
                    <asp:Image ID="imgImagenConsumible" runat="server" CssClass="img-fluid img-thumbnail" ImageUrl="/Images/placeholder.jpg" Height="450" Width="350" />
                    <asp:FileUpload ID="fileUploadImagenConsumible" CssClass="form-control mb-2" runat="server" onchange="this.form.submit()" ClientIDMode="Static" style="width: 350px;"/>
                </div>
                <div class="col-md-6">
                    <div class="col-md-12 pb-md-3">
                        <asp:Label ID="lblNombreConsumible" runat="server" Text="Nombre del Consumible:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:TextBox ID="txtNombreConsumible" runat="server" CssClass="form-control" placeholder="Ingrese nombre del consumible"></asp:TextBox>
                    </div>
                    
                    <div class="col-md-12 pb-md-3">
                        <asp:Label ID="lblPrecio" runat="server" Text="Precio del consumible:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Ingrese el precio del consumible"></asp:TextBox>
                    </div>
                    <div class="col-md-12 pb-md-3">
                        <div class="form-check form-check-inline">
                            <input type="radio" runat="server" AutoPostBack="true" id="rbAlimento" class="form-check-input" Onchecked="rbHabilitarAlimentoNoBebida"/>
                            <label class="form-check-label" runat="server" for="cphContenido_rbAlimento">Alimento</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="radio" runat="server" AutoPostBack="true" id="rbBedida" class="form-check-input" Onchecked="rbHabilitarBebidaNoAlimento"/>
                            <label class="form-check-label" runat="server" for="cphContenido_rbBedida">Bebida</label>
                        </div>
                    </div>
                    <!--Alimento-->
                    <div class="col-md-12 pb-md-3">
                        <asp:Label ID="lblPesoPromedio" runat="server" Text="Peso Promedio Alimento (g):" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:TextBox ID="txtPesoPromedio" runat="server" CssClass="form-control" placeholder="Ingrese el peso promedio" Enabled ="true"></asp:TextBox>
                    </div>
                    <div class="col-md-12 pb-md-3">
                        <asp:Label ID="lblTipoAlimento" runat="server" Text="Tipo De Alimento:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:DropDownList ID="ddlTipoAlimento" runat="server" AutoPostBack="true" CssClass="form-control" Enabled ="true"></asp:DropDownList>
                    </div>
                    <!--Bebida-->
                    <div class="col-md-12 pb-md-3">
                        <asp:Label ID="lblOnzas" runat="server" Text="Onzas de Bedida (oz):" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:TextBox ID="txtOnzas" runat="server" CssClass="form-control" placeholder="Ingrese las onzas" Enabled ="true"></asp:TextBox>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="checkbox" runat="server" id="rbTieneHielo" class="form-check-input" Disable ="false"/>
                        <label class="form-check-label" runat="server" for="cphContenido_rbTieneHielo">Tiene Hielo?</label>
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
<!--Modal Error-->
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
