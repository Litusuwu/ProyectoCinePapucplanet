<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Butacas.aspx.cs" Inherits="PapucplanetWAS.Butacas" %>

<!DOCTYPE html>
<html lang="es">
<head>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <script src="Scripts/Papucplanet/Butacas.js"></script>
    <link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet">
    <link href="Styles/Butacas.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAPUCPLANET - Selección de Asientos</title>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top navBar-Butacas">
            <div class="container d-flex justify-content-between align-items-center">
                <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                    style="text-decoration: none; font-size: 1.25rem; color: white;">
                    <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                    <strong>PAPUCPLANET</strong>
                </a>

                <div class="mx-auto text-center flex-grow-2">
                    <span class="navbar-text text-white">1. Asientos</span>
                </div>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkPerfil" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/MiPerfil.aspx">
                            <span class="d-inline d-lg-none">Mi Perfil</span>
                            <i class="fas fa-user d-none d-lg-inline"></i>
                            </asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="pantalla-container">
            <div class="pantalla">Pantalla</div>
        </div>

        <div class="container mt-4 main-content">
            <div class="seat-selection text-center">
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">--%>
                <contenttemplate>
                    <asp:Repeater ID="SeatRepeater" runat="server" OnItemDataBound="SeatRepeater_ItemDataBound">
                        <ItemTemplate>
                            <div class="row g-2 justify-content-center mb-4">
                                <asp:Repeater ID="RowRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="col-1">
                                            <asp:LinkButton ID="SeatButton" runat="server"
                                                CssClass='<%# "seat btn " + GetSeatClass((Container.DataItem as PapucplanetWA.Servicio.butacaFuncion).estado.ToString(), (Container.DataItem as  PapucplanetWA.Servicio.butacaFuncion).discapacitado.ToString()) %>'
                                                Text='<%# (char)((Container.DataItem as  PapucplanetWA.Servicio.butacaFuncion).fila) + (Container.DataItem as PapucplanetWA.Servicio.butacaFuncion).columna.ToString() %>'
                                                CommandName="ToggleSeat"
                                                CommandArgument='<%# (Container.DataItem as PapucplanetWA.Servicio.butacaFuncion).idButacaFuncion.ToString() %>' OnClick="SeatRepeater_ItemCommand" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </contenttemplate>
                <%--</asp:UpdatePanel>--%>
            </div>
        </div>
        <div class="container justify-content-center" style="max-width: 750px; position: relative; left: 30px; margin-top: 60px;">
            <div class="row justify-content-center">
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: #ffffff; border: 1px solid darkred; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>Estandar Disponible</span>
                    </div>
                </div>
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: #ffffff; border: 1px solid black; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>Discapacitado Disponible</span>
                    </div>
                </div>
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: #dc3545; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>Ocupado</span>
                    </div>
                </div>
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: darkred; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>Estandar Seleccionado</span>
                    </div>
                </div>
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: black; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>Discapacitado Seleccionado</span>
                    </div>
                </div>
                <div class="col-4 mb-3 d-flex justify-content-center">
                    <div style="width: 350px; display: flex; align-items: center; gap: 8px;">
                        <span class="badge" style="background-color: gray; width: 20px; height: 20px; display: inline-block;"></span>
                        <span>En Mantenimiento</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="summary-container">

            <asp:GridView ID="GridViewSummary" runat="server" AutoGenerateColumns="False" CssClass="summary-grid" OnRowDataBound="GridViewSummary_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                </Columns>
            </asp:GridView>

            <div class="summary-total">
                <div>Total</div>
                <div>
                    <asp:Label ID="LabelTotal" runat="server" Text="S/. 0.00"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="LabelCantidadTotal" runat="server" Text="0"></asp:Label>
                </div>
            </div>
            <div class="text-start" style="margin-top: 20px;">
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </div>
            <div class="text-end" style="margin-top: 20px;">
                <asp:LinkButton ID="LabelContinuarConfiteria" CssClass="btn btn-dark" runat="server" Text="Siguiente" OnClick="LbtnSiguiente_OnClick"></asp:LinkButton>
            </div>
        </div>
        <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="errorModalLabel">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>Error
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
        <footer class="bg-dark text-white text-center py-3">
            <p>&copy; 2024 PAPUCPLANET - Butacas de la Función del Cine. Todos los derechos reservados.</p>
        </footer>
    </form>
</body>
</html>
