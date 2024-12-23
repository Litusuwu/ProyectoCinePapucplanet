﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="PapucplanetWA.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Reportes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Reporte.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="container row">
           <asp:Label ID="Filtros" CssClass="col-form-label fw-bold" runat="server" Text="Filtros:"></asp:Label>
            <div class="row align-items-center">
                <div class="container row">
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server" for="cphContenido_rbPelicula">Por Pelicula:</label>
                        <input type="radio" runat="server" autopostback="true" id="rbPelicula" class="form-check-input" name="FiltroInformacion" />
                    </div>
                    <div class="col-md-8 pb-md-3">
                        <asp:Label ID="lblTituloPelicula" runat="server" Text="Seleccione la pelicula:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:DropDownList ID="ddlTituloPelicula" runat="server" AutoPostBack="true" CssClass="form-control" Enabled="true" OnTextChanged="ddlSeleccion_Pelicula"></asp:DropDownList>
                    </div>
                </div>
                <div class="container row">
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server" for="cphContenido_rbSede">Por Sede:</label>
                        <input type="radio" runat="server" autopostback="true" id="rbSede" class="form-check-input" name="FiltroInformacion" />
                    </div>
                    <div class="col-md-8 pb-md-3">
                        <asp:Label ID="lblNombreSede" runat="server" Text="Seleccione la sede:" CssClass="col-form-label fw-bold"></asp:Label>
                        <asp:DropDownList ID="ddlNombreSede" runat="server" AutoPostBack="true" CssClass="form-control" Enabled="true" OnTextChanged="ddlSeleccion_Sede"></asp:DropDownList>
                    </div>
                    <asp:Label ID="Tiempos" CssClass="col-form-label fw-bold" runat="server" Text="Tiempos:"></asp:Label>
                    <div class="row align-items-center">
                        <div class="col-md-6 pb-md-2">
                            <asp:Label ID="lblFechaInicio" CssClass="col-form-label fw-bold" runat="server" Text="Desde:"></asp:Label>
                            <input id="dtpFechaInicio" runat="server" type="date" class="form-control" />
                        </div>
                        <div class="col-md-6 pb-md-2">
                            <asp:Label ID="lblFechaFin" CssClass="col-form-label fw-bold" runat="server" Text="Hasta:"></asp:Label>
                            <input id="dtpFechaFin" runat="server" type="date" class="form-control" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card-footer clearfix">
            <asp:LinkButton ID="lbRegresar" runat="server" Text="<i class='fa-solid fa-rotate-left'></i> Regresar" CssClass="float-start btn btn-secondary" OnClick="lbRegresar_Click" />
            <asp:LinkButton ID="lbGenerarReporte" runat="server" Text="<i class='fa-solid fa-print'></i> Generar Reporte" CssClass="float-end btn btn-purple" OnClick="lbGenerarReporte_Click" />
        </div>
    </div>
    <!--Convencion para campos vacios-->
    <div class="modal" id="form-modal-fechas-convencion">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Aviso de excepccion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbExcepcionMsg" CssClass="form-label mb-2" runat="server" Text="Desea realizar la siguiente excepcion?" ></asp:Label>
                    <!--<asp:TextBox ID="txtExcepcion" CssClass="form-control mb-3" runat="server" Enabled ="false"></asp:TextBox>-->
                    <textarea id="txtExcepcionMsg" runat="server" class="form-control" cols="20" rows="4" Enabled ="false" readonly="readonly" disabled="disabled"></textarea>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="lbAceptar" runat="server" Text="<i class='fa-solid fa-print'></i> Acepto" CssClass="float-end btn btn-primary" OnClick="lbAceptar_Click" />
                </div>
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
