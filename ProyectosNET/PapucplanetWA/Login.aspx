<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PapucplanetWA.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet" />
    <link href="Styles/Login.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <link href="//fonts.googleapis.com/css?family=Quattrocento+Sans:400,400i,700,700i" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet" />
    <title>Inicio de Sesión</title>
</head>
<body>

    <div id="loadingScreen" class="loading-screen">
        <div class="spinner-border text-light" role="status" style="width: 4rem; height: 4rem;">
            <span class="visually-hidden">Cargando...</span>
        </div>
        <p class="text-light mt-3">Cargando...</p>
    </div>

    <nav class="navbar fixed-top navBar-login">
        <div class="container-fluid">
            <a class="navBar-login d-flex align-items-center gap-2" href="PeliculasUsuario.aspx"
                style="text-decoration: none; font-size: 1.25rem; color: white;">
                <i class="fa fa-film me-2" style="font-size: 24px; color: white;"></i>
                <strong>PAPUCPLANET</strong>
            </a>
        </div>
    </nav>
    <section class="main-Login">
        <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="card p-4 login-layer login-font" style="width: 100%; max-width: 400px;">
                <h3 class="card-title text-center mb-4">
                    <i class="mdi mdi-popcorn cinema-icon"></i>
                </h3>
                <form id="formLogin" runat="server">
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="fa fa-user icon"></i>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control input-css" placeholder="Ingrese su usuario"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <div class="input-icon">
                            <i class="fa fa-lock icon"></i>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control input-css" placeholder="Ingrese su contraseña"></asp:TextBox>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-outline-dark w-100 boton-login" OnClick="btnLogin_Click" />
                    </div>
                </form>
                
            </div>
        </div>
    </section>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var loadingScreen = document.getElementById('loadingScreen');
            document.querySelectorAll("form").forEach(function (form) {
                form.addEventListener("submit", function () {
                    loadingScreen.style.display = "flex";
                });
            });

            window.addEventListener("beforeunload", function () {
                loadingScreen.style.display = "flex";
            });
            loadingScreen.style.display = "none";
        });
    </script>
</body>
</html>
