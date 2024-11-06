<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Sedes.aspx.cs" Inherits="PapucplanetWA.Sedes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Sedes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Sedes.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="d-flex justify-content-center justify-content-md-between align-items-center mb-4 mt-1">
        <h1 class="text-center mb-0 w-100">Sedes</h1>
        <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn-sede" OnClick="btnAddClienteClick">
            <i class="fa-solid fa-plus mr-1"></i>Añadir
        </asp:LinkButton>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Repeater ID="sedes" runat="server">
                <HeaderTemplate>
                    <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-md-6 mb-4">
                        <div class="card custom-width-card mx-auto text-center bg-custom border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("universidad") %></h5>
                                <i class="fa-solid fa-building fs-1 custom-body-card"></i>
                                <p class="card-text">Ubicación: <%# Eval("ubicacion") %></p>
                            
                                <asp:LinkButton ID="lbSalas" runat="server" CssClass="btn-sede" OnClick="lbSalasXSede_Click" CommandArgument='<%# Eval("idSede") %>'>Salas</asp:LinkButton>
                            
                                <asp:LinkButton ID="lbModificar" runat="server" CssClass="btn-warning btn-sede" OnClick="lbModificar_Click" CommandArgument='<%# Eval("idSede") %>'><i class='fa-solid fa-edit'></i> Modificar</asp:LinkButton>
                            
                                <asp:LinkButton ID="lbEliminar" runat="server" CssClass="btn btn-danger" OnClick="lbEliminar_Click" CommandArgument='<%# Eval("idSede") %>'><i class='fa-solid fa-trash'></i> Eliminar</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
    <!--POP UP de Añadir-->
    <div class="modal" id="form-modal-sede-add">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Sede</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server"  UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblNombreSede" CssClass="form-label mb-2" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="txtNombreSede" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                        
                            <!-- Label para el mensaje de error -->
                            <asp:Label ID="lblNombreErrorAdd" CssClass="text-danger" runat="server" Visible="false"></asp:Label>
                        
                            <asp:Label ID="lblUbicacionSede" CssClass="form-label mb-2" runat="server" Text="Ubicación:"></asp:Label>
                            <asp:TextBox ID="txtUbicacionSede" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="lbGuardar" runat="server" CssClass="btn-sede" OnClick="lbGuardar_Click">Confirmar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--POP UP de Modificar-->
    <div class="modal" id="form-modal-sede-mod">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Sede</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbNombreSedeMod" CssClass="form-label mb-2" runat="server" Text="Nombre:"></asp:Label>
                    <asp:TextBox ID="txtNombreSedeMod" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                    <asp:Label ID="lblUbicacionSedeMod" CssClass="form-label mb-2" runat="server" Text="Ubicacion:"></asp:Label>
                    <asp:TextBox ID="txtUbicacionSedeMod" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="lbGuardarMod" runat="server" CssClass="btn-sede" OnClick="lbGuardar_ClickMod">Confirmar</asp:LinkButton>
                </div>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
