<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccesoDenegado.aspx.cs" Inherits="PapucplanetWA.AccesoDenegado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acceso Denegado</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Fonts/css/all.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet"/>
    <link href="Styles/Login.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/jquery-3.7.1.js"></script>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: 'Mukta', sans-serif;
        }
        .modal-header, .modal-footer {
            background-color: darkred;
            color: white;
        }
        .modal-content {
            background-color: #222;
            border: 1px solid darkred;
        }
        .btn-dark-red {
            background-color: darkred;
            color: white;
            border: none;
        }
        .btn-dark-red:hover {
            background-color: #a80000;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center my-5">
            <h1>PAPUCPLANET</h1>
            <p>No tienes permisos para acceder a esta página.</p>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="accessDeniedModal" tabindex="-1" aria-labelledby="accessDeniedModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="accessDeniedModalLabel">Acceso Denegado</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body text-center">
                        <i class="mdi mdi-alert-circle-outline" style="font-size: 48px; color: darkred;"></i>
                        <p class="mt-3">No tienes permisos para acceder a esta página.</p>
                        <p>Por favor, regresa a la página principal.</p>
                    </div>
                    <div class="modal-footer">
                        <a id="btnRedirect" runat="server" class="btn btn-dark-red w-100">Volver</a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#accessDeniedModal').modal('show');
        });
    </script>
</body>
</html>
