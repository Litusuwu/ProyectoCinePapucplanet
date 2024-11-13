<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Boletas.aspx.cs" Inherits="PapucplanetWA.Boletas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Boletas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <div class="col-sm-4 pb-md-2">
                    <asp:Label ID="lblCliente" CssClass="col-form-label fw-bold" runat="server" Text="Nombre Cliente:"></asp:Label>
                    <asp:TextBox ID="txtCliente" CssClass="form-control" runat="server" placeholder="Ingrese el nombre del cliente"></asp:TextBox>
                </div>
                <div class="col-md-3 pb-md-2">
                    <asp:Label ID="lblFechaInicio" CssClass="col-form-label fw-bold" runat="server" Text="Desde:"></asp:Label>
                    <input id="dtpFechaInicio" runat="server" type="date" class="form-control" />
                </div>
                <div class="col-md-3 pb-md-2">
                    <asp:Label ID="lblFechaFin" CssClass="col-form-label fw-bold" runat="server" Text="Hasta:"></asp:Label>
                    <input id="dtpFechaFin" runat="server" type="date" class="form-control" />
                </div>
                <div class="col-sm-2">
                    <asp:LinkButton ID="lbBuscar" CssClass="btn btn-purple" runat="server" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" />
                </div>
            </div>
        </div>
    </div>
    <div class="container row">
        <asp:GridView ID="gvBoletas" runat="server" AllowPaging="true" PageSize="8" AutoGenerateColumns="false"
            CssClass="table table-hover table-responsive table-striped text-center gridview-pagination" ShowHeaderWhenEmpty="true"
            PagerStyle-CssClass="pagination-container" OnPageIndexChanging="gvBoletas_PageIndexChanging" OnRowDataBound="gvBoletas_RowDataBound">
            <RowStyle CssClass="centered-row" />
            <Columns>
                <asp:BoundField HeaderText="Fecha de Compra" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Nombre Cliente" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Metodo de Pago" ItemStyle-CssClass="text-center"/>
                <asp:BoundField HeaderText="Monto Pagado" ItemStyle-CssClass="text-center"/>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <!-- Botón para ver lineas boleta -->
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-circle-info'></i>"
                            OnClick="lbLineasBoleta_Click" CommandArgument='<%# Eval("id") %>'
                            CssClass="btn btn-danger btn-sm" ToolTip="LineasBoleta" />
                        <!-- Botón para imprimir pdf -->
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-print'></i>"
                            OnClick="lbImprimirBoleta_Click" CommandArgument='<%# Eval("id") %>'
                            CssClass="btn btn-danger btn-sm" ToolTip="ImprimirBoleta" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
