<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Butacas.aspx.cs" Inherits="PapucplanetWAS.Butacas" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAPUCPLANET - Selección de Asientos</title>
    <link href="Styles/Butacas.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet"/>
    <style>
            .seat.available-est {
                border-color: #8a4baf;
                color: #8a4baf;
                background-color: #ffffff;
            }
            .seat.occupied {
                background-color: #dc3545;
                color: #ffffff;
            }
            .seat.reserved-est{
                background-color: #8a4baf;
                color: #ffffff;
            }
            .seat.disabled-seat {
                background-color: #000000;
                color: #ffffff;
            }
            .seat.available-est:hover {
                background-color: #8a4baf;
                color: #ffffff;
            }
            .seat.available-disc {
                border-color: black; /* Outline negro para asientos discapacitados disponibles */
                color: black;
                background-color: #ffffff;
            }

            .seat.reserved-disc {
                background-color: black; /* Color negro para asientos discapacitados reservados */
                color: #ffffff;
            }

            .seat.available-disc:hover {
                background-color: black; /* Hover para asientos discapacitados disponibles */
                color: #ffffff;
            }


            .seat.maintenance-seat {
                background-color: gray; /* Color gris para asientos en mantenimiento */
                color: #ffffff;
            }

            .seat.disabled-seat {
                background-color: #000000; /* Color negro para asientos no disponibles */
                color: #ffffff;
            }

            .summary-container {
                margin-top: 30px;
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 8px;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            .summary-title {
                font-size: 1.5rem;
                text-align: center;
                margin-bottom: 20px;
                color: #8a4baf;
            }

            .summary-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .summary-label {
                font-weight: bold;
                width: 30%;
                text-align: left;
            }

            .summary-textbox {
                width: 65%;
                border: 1px solid #ddd;
                padding: 5px;
                border-radius: 4px;
            }

            .summary-grid {
                width: 100%;
                border-collapse: collapse;
                background-color: #9d7be9;
                color: #ffffff;
                margin-top: 20px;
                border-radius: 12px;
                overflow: hidden;
            }

            .summary-grid th, .summary-grid td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ffffff;
            }

            .summary-grid th {
                background-color: #8a4baf;
                color: #ffffff;
            }

            .summary-grid tr:nth-child(even) {
                background-color: #7a3da0;
            }

            .summary-total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                background-color: #8a4baf; /* Fondo púrpura */
                color: #ffffff; /* Texto blanco */
                font-size: 1.25rem;
                font-weight: bold;
                border-radius: 8px;
                margin-top: 20px;
                text-align: center;
            }

            .summary-total div {
                width: 30%;
            }

            .summary-total .total-label {
                text-align: left;
                font-size: 1.5rem;
                font-weight: bold;
            }

            .summary-total .total-value {
                text-align: right;
                font-size: 1.5rem;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!--Para realizar la barra de navegación responsive-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top navBar-Peliculas">
            <div class="container position-relative">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                    <strong>PAPUCPLANET</strong>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars" style="color: white; font-size: 24px;"></i>
                </button>
                <div class="collapse navbar-collapse navBar-Expandido" id="navbarNav">
                    <ul class="navbar-nav ms-auto navBar-Expandido">
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkPeliculas" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/PeliculasUsuario.aspx">Películas</asp:LinkButton>
                        </li>
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkConfiteria" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/ConfiteriaVUsuario.aspx">Confitería</asp:LinkButton>
                        </li>
                        <li class="nav-item me-3">
                            <asp:LinkButton ID="lnkCines" runat="server" CssClass="nav-link navBar-Expandido" PostBackUrl="~/Cines.aspx">Cines</asp:LinkButton>
                        </li>
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
        <div style="margin-bottom: 100px;"></div>

         <%--<asp:ScriptManager ID="ScriptManager1" runat="server" /> --%>
        <div class="container mt-4">
            <h2 class="mb-4 text-center">Escoge tus asientos</h2>
            <div class="seat-selection text-center">
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">--%>
                    <ContentTemplate>
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
                    </ContentTemplate>
                 <%--</asp:UpdatePanel>--%>
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
                    <asp:Label ID="LabelTotal" runat="server" Text="S/. 0.00"></asp:Label></div>
                <div>
                    <asp:Label ID="LabelCantidadTotal" runat="server" Text="0"></asp:Label></div>
            </div>
        </div>


    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
