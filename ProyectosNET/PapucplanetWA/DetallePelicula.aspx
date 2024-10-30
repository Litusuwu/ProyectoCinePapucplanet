<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePelicula.aspx.cs" Inherits="PapucplanetWA.DetallePelicula" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PAPUCPLANET - Detalles</title>
    <!-- Ruta local del archivo CSS de Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Estilos personalizados -->
    <link href="Content/Styles/DetallePelicula.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server"> <!-- Formulario de servidor para la página maestra -->
        <!--En el caso de seleccionar hora y fecha se debe recargar solo esa parte y no toda la pagina-->
        <asp:ScriptManager runat="server"/> 
        <!--Para realizar la barra de navegación responsive-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">   
            <div class =" container">   
                <a class ="navbar-brand" href="#">
                    <asp:Image ID="Image1" runat="server" ImageUrl="https://i.pinimg.com/enabled/236x/3c/3c/ef/3c3cef1af2ff7a3fdeef606fcaa63ce7.jpg" alt="Logo" Width="30" CssClass="d-inline-block align-text-top" />
                    <strong>PAPUCPLANET</strong>
                </a>

                <!--Boton de colapso?!?!?-->

                <div class="collapse navbar-collapse" id="navbarNav">
                    <!--Agrego lista no ordenada-->
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Peliculas.aspx">Peliculas</a></li>
                        <li class="nav-item"><a class="nav-link" href="Confiteria.aspx">Confiteria</a></li>
                        <li class="nav-item">
                            <div class="user-icon bg-secondary rounded-circle text-white d-flex justify-content-center align-items-center" style="width: 30px; height: 30px;">
                                H
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Le agrego margen al contenedor para separarlo de arriba-->
        <div class="container mt-4">
            <h2 class="mb-4 text-center">Detalles de la Película</h2>
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
                        <h3 class="text-center py-2" style="background-color: #6f42c1; color: white;">Seleccionar Día</h3>
                        <div id="dayContainer" class="d-flex flex-wrap justify-content-center gap-2 py-3" runat="server">
                            <!-- Botones de día generados dinámicamente aparecerán aquí -->
                        </div>
                    </div>

                    <div class="showtime-section my-4">
                        <h3 class="text-center py-2" style="background-color: #6f42c1; color: white;">Seleccionar Horario</h3>
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

        function checkSelectionAndRedirect() {
            const selectedDay = sessionStorage.getItem("selectedDay");
            const selectedTime = sessionStorage.getItem("selectedTime");
            if (selectedDay && selectedTime) {
                window.location.href = `Butacas.aspx?dia=${selectedDay}&horario=${selectedTime}`;
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

