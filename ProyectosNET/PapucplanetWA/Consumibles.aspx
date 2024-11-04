<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Consumibles.aspx.cs" Inherits="PapucplanetWA.Consumibles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Consumibles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">
                <div class="col-sm-4">
                    <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" placeholder="Ingrese el nombre del consumible"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:LinkButton ID="lbBuscar" CssClass="btn btn-purple" runat="server" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" />
                </div>
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lbRegistrar" CssClass="btn btn-purple" runat="server" OnClick="lbRegistrar_Click" Text="<i class='fa-regular fa-circle-plus'></i>  Agregar Nuevo Consumible" />
                </div>
            </div>
        </div>

        <div class="container row">
            <asp:GridView ID ="gvConsumibles" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="false"
                CssClass="table table-hover table-responsive table-striped text-center gridview-pagination" ShowHeaderWhenEmpty="true"
                PagerStyle-CssClass="pagination-container" OnPageIndexChanging="gvConsumibles_PageIndexChanging" OnRowDataBound="gvConsumibles_RowDataBound">

            </asp:GridView>
        </div>
    </div>
</asp:Content>
