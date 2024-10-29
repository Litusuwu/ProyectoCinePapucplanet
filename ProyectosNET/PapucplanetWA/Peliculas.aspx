<%@ Page Title="" Language="C#" MasterPageFile="~/Papucplanet.Master" AutoEventWireup="true" CodeBehind="Peliculas.aspx.cs" Inherits="PapucplanetWA.Peliculas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Peliculas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    
    <div class="container">
        <div class="container row">
            <div class="row align-items-center">

                <div class="col-sm-4">
                    <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" placeholder="Ingrese el nombre de la película"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:LinkButton ID="lbBuscar" CssClass="btn btn-purple" runat="server" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" />
                </div>
                <div class="col text-end p-3">
                    <asp:LinkButton ID="lbRegistrar" CssClass="btn btn-purple" runat="server" OnClick="lbRegistrar_Click" Text="<i class='fa-regular fa-circle-plus'></i>  Agregar Nueva Película" />
                </div>
            </div>
        </div>
        <div class="container row">
            <asp:GridView ID="gvPeliculas" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" 
                ShowHeaderWhenEmpty="true" OnPageIndexChanging="gvPeliculas_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Poster">
                        <ItemTemplate>
                            <asp:Image ID="imgPoster" runat="server" CssClass="img-fluid img-thumbnail" ImageUrl='<%# Eval("imagenPromocional") %>' Height="150" Width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Titulo" DataField="titulo" />
                    <asp:BoundField HeaderText="Duracion" DataField="duracion" />
                    <asp:BoundField HeaderText="Género" DataField="genero" />

                    <asp:TemplateField HeaderText="Funciones">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Ver funciones" OnClick="lbFunciones_Click" CommandArgument='<%# Eval("idPelicula") %>' CssClass="text-purple"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <!-- Botón para Modificar -->
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-pencil'></i>"
                                OnClick="lbModificar_Click" CommandArgument='<%# Eval("idPelicula") %>'
                                CssClass="btn btn-primary btn-sm" ToolTip="Modificar" />
                            <!-- Botón para Eliminar -->
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>"
                                OnClick="lbEliminar_Click" CommandArgument='<%# Eval("idPelicula") %>'
                                CssClass="btn btn-danger btn-sm" ToolTip="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
