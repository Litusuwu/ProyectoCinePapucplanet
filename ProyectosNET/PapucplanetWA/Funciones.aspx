<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Funciones.aspx.cs" Inherits="PapucplanetWA.Funciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Funciones.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="upContenedor" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="container">
                <div class="card no-border">
                    <div class="card-header card-header-colored">
                        <div class="row">
                            <div class="col-md-2">
                                <asp:Image ID="imgPosterPromocional" runat="server" CssClass="img-fluid img-thumbnail" Height="150" Width="100" />
                            </div>
                            <div class="col-md-6">
                                <h5>
                                    <asp:Label ID="lblTituloPelicula" runat="server" Text="lblTituloPelicula" CssClass="col-form-label fw-bold"></asp:Label></h5>
                                <p>
                                    <asp:Label ID="lblSinopsis" runat="server" Text="lblSinopsis" CssClass="text-normal"></asp:Label>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <h5>
                                <asp:Label ID="lblTitulo" runat="server" Text="Información de las funciones" CssClass="text-red"></asp:Label>
                            </h5>
                        </div>
                    </div>
                    <div class="card-body pb-3">
                        <div class="container row">
                            <div class="row align-items-center">

                                <div class="col-sm-4">
                                    <input id="dtpFiltrarFecha" runat="server" type="date" class="form-control" />
                                </div>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="lbBuscar" CssClass="btn btn-purple" runat="server" OnClick="lbBuscar_Click" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" />
                                </div>
                                <div class="col text-end p-3">
                                    <asp:LinkButton ID="lbRegistrar" CssClass="btn btn-purple" runat="server" OnClick="lbRegistrar_Click" Text="<i class='fa-regular fa-circle-plus'></i>  Agregar Nueva Función" />
                                </div>
                            </div>
                        </div>
                        <div class="container row">
                            <asp:GridView ID="gvFunciones" runat="server" AllowPaging="true" PageSize="4" AutoGenerateColumns="false"
                                CssClass="table table-hover table-responsive table-striped text-center gridview-pagination" ShowHeaderWhenEmpty="true"
                                PagerStyle-CssClass="pagination-container" OnPageIndexChanging="gvFunciones_PageIndexChanging" OnRowDataBound="gvFunciones_RowDataBound">
                                <RowStyle CssClass="centered-row" />
                                <Columns>
                                    <asp:BoundField HeaderText="Sede" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField HeaderText="Sala" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField HeaderText="Fecha" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField HeaderText="Hora de Inicio" ItemStyle-CssClass="text-center" />
                                    <asp:BoundField HeaderText="Hora de Fin" ItemStyle-CssClass="text-center" />
                                    <asp:TemplateField HeaderText="Butacas" ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Ver Butacas" OnClick="lbButacas_Click" CommandArgument='<%# Eval("idFuncion") %>' CssClass="text-red" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <!-- Botón para Modificar -->
                                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-pencil'></i>"
                                                OnClick="lbModificar_Click" CommandArgument='<%# Eval("idFuncion") %>'
                                                CssClass="btn btn-warning btn-sm" ToolTip="Modificar" />
                                            <!-- Botón para Eliminar -->
                                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>"
                                                OnClick="lbEliminar_Click" CommandArgument='<%# Eval("idFuncion") %>'
                                                CssClass="btn btn-danger btn-sm" ToolTip="Eliminar" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal" id="form-modal-agregar-nueva-funcion">
                <contenttemplate>
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 id="modalTitle" runat="server" class="modal-title">Agregar Nueva Función</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="upAgregarFuncion" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div class="row pb-1 pt-1">
                                            <div class="col-md-12 pb-md-2">
                                                <asp:Label ID="lblSede" CssClass="col-form-label fw-bold" runat="server" Text="Sede:"></asp:Label>
                                                <asp:DropDownList ID="ddlSede" runat="server" AutoPostBack="true" CssClass="form-select"
                                                    OnSelectedIndexChanged="ddlSede_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 pb-md-2">
                                                <asp:Label ID="lblSala" CssClass="col-form-label fw-bold" runat="server" Text="Sala:"></asp:Label>
                                                <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-select"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 pb-md-2">
                                                <asp:Label ID="lblFecha" CssClass="col-form-label fw-bold" runat="server" Text="Fecha:"></asp:Label>
                                                <input id="dtpFecha" runat="server" type="date" class="form-control" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lblHoraInicio" CssClass="col-form-label fw-bold" runat="server" Text="Hora Inicio:"></asp:Label>
                                                <asp:TextBox ID="tmHoraInicio" runat="server" type="time" CssClass="form-control" AutoPostBack="true" OnTextChanged="tmHoraInicio_TextChanged"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Label ID="lblHoraFin" CssClass="col-form-label fw-bold" runat="server" Text="Hora Fin:"></asp:Label>
                                                <asp:TextBox ID="txtHoraFin" runat="server" CssClass="form-control" placeholder="Ingrese la hora de inicio" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="lbConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-purple" OnClick="lbConfirmar_Click" />
                            </div>
                        </div>
                    </div>
                </contenttemplate>
            </div>
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


