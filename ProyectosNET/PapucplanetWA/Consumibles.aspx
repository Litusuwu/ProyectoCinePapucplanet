<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Consumibles.aspx.cs" Inherits="PapucplanetWA.Consumibles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Consumibles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="Scripts/Papucplanet/Consumible.js"></script>
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
                <RowStyle CssClass="centered-row" />
                <Columns>
                    <asp:TemplateField HeaderText="Imagen" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Image ID="imgConsumible" runat="server" CssClass="img-fluid img-thumbnail" ImageUrl='<%# Eval("imagenURL") %>' Height="150" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Nombre" ItemStyle-CssClass="text-center" />
                    <asp:BoundField HeaderText="Precio (S/.)" ItemStyle-CssClass="text-center" />
                    <asp:TemplateField HeaderText="Detalle" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Ver Detalle" OnClick="lbDetalle_Click" CommandArgument='<%# Eval("id") %>' CssClass="text-purple" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <!-- Botón para Modificar -->
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-pencil'></i>"
                                OnClick="lbModificar_Click" CommandArgument='<%# Eval("id") %>'
                                CssClass="btn btn-purple btn-sm" ToolTip="Modificar" />
                            <!-- Botón para Eliminar -->
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>"
                                OnClick="lbEliminar_Click" CommandArgument='<%# Eval("id") %>'
                                CssClass="btn btn-danger btn-sm" ToolTip="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <!-- Detalle de alimento -->
    <div class="modal" id="form-modal-alimento-detalle">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle Alimento</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbPesoPromedio" CssClass="form-label mb-2" runat="server" Text="Peso Promedio(g):"></asp:Label>
                    <asp:TextBox ID="txtPesoPromedio" CssClass="form-control mb-3" runat="server" Enabled ="false"></asp:TextBox>
                    <asp:Label ID="lbTipoAlimento" CssClass="form-label mb-2" runat="server" Text="Tipo Alimento:" ></asp:Label>
                    <asp:TextBox ID="txtTipoAlimento" CssClass="form-control mb-3" runat="server" Enabled ="false"></asp:TextBox>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!-- Detalle de bebida -->
    <div class="modal" id="form-modal-bebida-detalle">
        <div class="modal-dialog modal-sm">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title">Detalle Bebida</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   <asp:Label ID="lbOnzas" CssClass="form-label mb-2" runat="server" Text="Onzas(oz):"></asp:Label>
                   <asp:TextBox ID="txtOnzas" CssClass="form-control mb-3" runat="server" Enabled ="false"></asp:TextBox>
                   <asp:Label ID="lbTieneHielo" CssClass="form-label mb-2" runat="server" Text="Tiene Hielo?"></asp:Label>
                   <asp:TextBox ID="txtTieneHielo" CssClass="form-control mb-3" runat="server" Enabled ="false"></asp:TextBox>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
</asp:Content>
