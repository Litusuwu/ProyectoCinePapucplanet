<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePelicula.aspx.cs" Inherits="PapucplanetWA.DetallePelicula" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PAPUCPLANET - Detalles</title>
    <!-- Ruta local del archivo CSS de Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
    <!-- Estilos personalizados -->
    <link href="Styles/DetallePelicula.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- Formulario de servidor para la página maestra -->
        <!--En el caso de seleccionar hora y fecha se debe recargar solo esa parte y no toda la pagina-->
        <asp:ScriptManager runat="server" />
        <!--Para realizar la barra de navegación responsive-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow-sm fixed-top navBar-Peliculas">
            <div class="container position-relative">
                <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                    style="text-decoration: none; font-size: 1.25rem; color: white;">
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

        <!--Le agrego margen al contenedor para separarlo de arriba-->
        <div class="container mt-4">
            <h2 class="mb-4 text-center" style="font-size: 40px; color: black;">DETALLES DE LA PELICULA</h2>
            <div class="movie-details text-center">
                <h3 id="movieTitle" runat="server" class="mb-3">Titulo de la Película</h3>

                <div class="d-flex justify-content-center">
                    <asp:Image ID="movieImage_Link" runat="server" CssClass="img-fluid rounded mb-3" AlternateText="Imagen de la Pelicula" Style="width: 100%; max-width: 600px;" />
                </div>

                <asp:Label ID="lblMovieDuration" runat="server" CssClass="text-center"></asp:Label>
                <div class="mb-3"></div>
                <asp:Label ID="lblMovieGenre" runat="server" CssClass="text-center"></asp:Label>
                <div class="mb-3"></div>
                <div class="d-flex justify-content-center mb-3">
                    <div class="sinopsis-box">SINOPSIS</div>
                </div>

                <asp:Label ID="lblMovieDescription" runat="server" CssClass="text-center"></asp:Label>
                <div class="mb-5"></div>
            </div>

            <!--Agregar UpdatePanel para actualizar los botones de dia y hora sin recargar toda la pagina-->
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <!--define un contenedor con estilos específicos-->
                    <div class="showtime-section my-4">
                        <h3 class="text-center py-2" style="background-color: darkred; color: white;">Seleccionar Día</h3>
                        <div id="dayContainer" class="d-flex flex-wrap justify-content-center gap-2 py-3" runat="server">
                            <!-- Botones de día generados dinámicamente aparecerán aquí -->
                        </div>
                    </div>

                    <div class="showtime-section my-4">
                        <h3 class="text-center py-2" style="background-color: darkred; color: white;">Seleccionar Horario</h3>
                        <div id="timeContainer" class="d-flex flex-wrap justify-content-center gap-2 py-3" runat="server">
                            <!-- Botones de horario generados dinámicamente aparecerán aquí -->
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>

    <script src="Scripts/bootstrap.bundle.min.js"></script>

    <script>
        // JavaScript para gestionar el estado sin recargar la página
        function selectDay(button, day) {
            document.querySelectorAll("#dayContainer .btn").forEach(btn => btn.classList.remove("selected"));
            button.classList.add("selected");
            sessionStorage.setItem("selectedDay", day);
            checkSelectionAndRedirect();
        }
        function selectTime(button, time) {
            document.querySelectorAll("#timeContainer .btn").forEach(btn => btn.classList.remove("selected"));
            button.classList.add("selected");
            sessionStorage.setItem("selectedTime", time);
            checkSelectionAndRedirect();
        }
        function selectTime(button, time, idFuncion) {
            document.querySelectorAll("#timeContainer .btn").forEach(btn => btn.classList.remove("selected"));
            button.classList.add("selected");
            sessionStorage.setItem("selectedTime", time);
            sessionStorage.setItem("selectedFuncion", idFuncion); // Guarda el idFuncion seleccionado
            checkSelectionAndRedirect();
        }
        function checkSelectionAndRedirect() {
            const selectedDay = sessionStorage.getItem("selectedDay");
            const selectedTime = sessionStorage.getItem("selectedTime");
            const selectedFuncion = sessionStorage.getItem("selectedFuncion"); // Obtiene el idFuncion seleccionado
            if (selectedDay && selectedTime && selectedFuncion) {
                console.log("Day:", selectedDay, "Time:", selectedTime, "Funcion:", selectedFuncion);
                window.location.href = `Butacas.aspx?dia=${selectedDay}&horario=${selectedTime}&idFuncion=${selectedFuncion}`;
            }
        }

        window.onload = function () {
            const selectedDay = sessionStorage.getItem("selectedDay");
            const selectedTime = sessionStorage.getItem("selectedTime");

            if (selectedDay) {
                document.querySelectorAll("#dayContainer .btn").forEach(button => {
                    if (button.textContent === selectedDay) {
                        button.classList.add("selected");
                    }
                });
            }

            if (selectedTime) {
                document.querySelectorAll("#timeContainer .btn").forEach(button => {
                    if (button.textContent === selectedTime) {
                        button.classList.add("selected");
                    }
                });
            }
        }
    </script>

</body>
</html>
