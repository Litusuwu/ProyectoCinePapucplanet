<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Salas.aspx.cs" Inherits="PapucplanetWA.Salas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Salas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Sala.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
<div class="container mt-4">
    <div class="header-container row align-items-center">
        <!-- Columna para la imagen -->
        <div class="col-md-2 d-flex justify-content-center align-items-center">
            <i class="fa-solid fa-building fs-1 custom-body-card text-center"></i>
        </div>
        <!-- Columna para la información de la sede -->
        <div class="col-md-8">
            <h2><asp:Label ID="lblSedeNombre" runat="server" Text="Sede 1"></asp:Label></h2>
            <p class="mt-4">Ubicación: <asp:Label ID="lblUbicacion" runat="server" Text="Ubicación"></asp:Label></p>
        </div>
        
        <!-- Columna para el botón -->
        <div class="position-absolute top-0 end-0 mt-2 me-2 text-md-end">
            <a href="Home.aspx" class="text-decoration-none"><i class="fa-solid fs-2 fa-house me-2 text-dark"></i></a>
        </div>
    </div>
</div>
<!-- Lista de Salas por sede -->
<div class="container mt-2">
    <!-- Encabezado con Título y Botón de Agregar Nueva Sala -->
    <div class="header-container row align-items-center my-4">
        <!-- Columna para el título alineado a la izquierda -->
        <div class="col-md-6">
            <h5 class="mb-0"><i class="fas fa-info-circle"></i> Información de las salas</h5>
        </div>

        <!-- Columna para el botón alineado a la derecha -->
        <div class="col-md-6 text-end">
            <asp:LinkButton ID="btnAddSala" runat="server" CssClass="btn btn-sede" OnClick="btnAddSala_Click">
                <i class="fa-solid fa-plus me-1"></i>Añadir
            </asp:LinkButton>
        </div>
    </div>

    <!-- Contenedor de la Tabla con Barra de Búsqueda -->
</div>
    <!-- Tabla de Salas -->
    <asp:GridView ID="gvSalas" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false"
        CssClass="table table-hover table-responsive table-striped text-center gridview-pagination" ShowHeaderWhenEmpty="true"
        PagerStyle-CssClass="pagination-container" OnPageIndexChanging="gvSalas_PageIndexChanging" OnRowDataBound="gvSalas_RowDataBound">

        <Columns>
            <asp:BoundField DataField="numeroSala" HeaderText="Sala" ItemStyle-CssClass="text-center py-4" />
            <asp:BoundField DataField="numCol" HeaderText="Numero de columnas" ItemStyle-CssClass="text-center py-4" />
            <asp:BoundField DataField="numFila" HeaderText="Número de filas" ItemStyle-CssClass="text-center py-4" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" ItemStyle-CssClass="text-center py-4" />

            <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="text-center py-4">
                <ItemTemplate>
                    <!-- Botón para Eliminar -->
                    <asp:LinkButton runat="server"  CommandArgument='<%# Eval("idSala") %>'
                        CssClass="text-decoration-none text-danger" ToolTip="Eliminar" OnClick="btnDeleteSala_Click">
                            <i class="fas fa-trash"></i>
                        </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <!--POP UP de Añadir-->
    <div class="modal" id="form-modal-sala-add">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Sede</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblNumSala" CssClass="form-label mb-2" runat="server" Text="Numero Sala:"></asp:Label>
                    <asp:TextBox ID="txtNumSala" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                    <asp:Label ID="lblNumCol" CssClass="form-label mb-2" runat="server" Text="Numero de columnas:"></asp:Label>
                    <asp:TextBox ID="txtNumCol" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                    <asp:Label ID="lblNumFilas" CssClass="form-label mb-2" runat="server" Text="Numero de filas:"></asp:Label>
                    <asp:TextBox ID="txtNumFilas" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                    <asp:Label ID="lblCapacidad" CssClass="form-label mb-2" runat="server" Text="Capacidad:"></asp:Label>
                    <asp:TextBox ID="txtCapacidad" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="lbGuardarAdd" runat="server" CssClass="btn-sede" OnClick="lbGuardar_ClickAdd">Confirmar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="form-modal-sala-butacas">
    
    </div>
</asp:Content>
