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
                <asp:LinkButton ID="lbModificar" runat="server" style="display:none"></asp:LinkButton>
                <div class="container row">
                    <div class="row align-items-center">
                        <div class="col-sm-4 pb-md-2">
                            <asp:Label ID="lblSede" CssClass="col-form-label fw-bold" runat="server" Text="Sede:"></asp:Label>
                            <asp:DropDownList ID="ddlSede" runat="server" AutoPostBack="true" CssClass="form-select"
                                OnSelectedIndexChanged="ddlSede_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2 pb-md-2">
                            <asp:Label ID="lblSala" CssClass="col-form-label fw-bold" runat="server" Text="Sala:"></asp:Label>
                            <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col-md-2 pb-md-2">
                            <asp:Label ID="lblFechaFiltro" CssClass="col-form-label fw-bold" runat="server" Text="Fecha:"></asp:Label>
                            <input id="dtpFechaFiltro" runat="server" type="date" class="form-control" />
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
                    <!-- Contenedor para las tablas de horas y reservas -->
                    <div class="tables-container">
                        <!-- Tabla de Horas -->
                        <table id="tablaHoras" class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th class="text-center">Horario</th>
                                </tr>
                            </thead>
                            <tbody id="tblHorasBody" runat="server">
                                <!-- Las filas de la tabla de horas se generarán dinámicamente desde el backend -->
                            </tbody>
                        </table>

                        <!-- Tabla de Reservas -->
                        <table id="tablaReservas" class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th class="text-center">Funciones</th>
                                </tr>
                            </thead>
                            <tbody id="tblReservasBody" runat="server">
                                <!-- Las reservas se generarán dinámicamente desde el backend -->
                            </tbody>
                        </table>
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
                                                    <asp:Label ID="lblPelicula" CssClass="col-form-label fw-bold" runat="server" Text="Sala:"></asp:Label>
                                                    <asp:DropDownList ID="ddlPelicula" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlPelicula_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label ID="lblHoraInicio" CssClass="col-form-label fw-bold" runat="server" Text="Hora Inicio:"></asp:Label>
                                                    <asp:DropDownList ID="ddlHoraInicio" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlHoraInicio_SelectedIndexChanged">
                                                    </asp:DropDownList>
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
                                    <asp:LinkButton ID= "lbEliminar" runat="server" Text="<i class='fa-solid fa-trash'></i> Eliminar"
                                        OnClick="lbEliminar_Click" CssClass="btn btn-danger"/>
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
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lbModificar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
