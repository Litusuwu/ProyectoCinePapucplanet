using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class HistorialUsuario : System.Web.UI.Page
    {
        private BoletaWSClient daoBoleta = new BoletaWSClient();
        private LineaBoletaWSClient daoLineaBoleta = new LineaBoletaWSClient();
        private lineaBoleta[] lineasBoleta;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario usuarioDatos = (usuario)Session["Usuario"];
            if (usuarioDatos == null)
            {
                Session["Redireccion"] = "Login.aspx";
                Response.Redirect("AccesoDenegado.aspx");
            }
            if (!IsPostBack)
            {
                lnkPerfil.Text = usuarioDatos.nombre + " " + usuarioDatos.primerApellido;
                cargarLineas();
                CargarBoletas();
                ActualizarTotalBoletas();
            }
        }

        private void cargarLineas()
        {
            lineasBoleta = daoLineaBoleta.listarTodosLineaBoleta();
        }
        private void ActualizarTotalBoletas()
        {
            int usuarioId = 2;

            var boletas = daoBoleta.listarTodasBoletas();
            if (boletas == null) return;

            var totalBoletas = boletas.Count(b => b.cliente.id == usuarioId);

            // Actualizar el valor del badge dinámicamente
            ClientScript.RegisterStartupScript(this.GetType(), "UpdateBoletasTotal", $@"
                                                    document.getElementById('boletasTotal').innerText = '{totalBoletas}';
                                                ", true);
        }
        private void CargarBoletas()
        {
            Debug.WriteLine($"Entrando a CargarBoletas.");
            var usuario1 = (usuario)Session["Usuario"];
            int usuarioId = usuario1.id;
            var boletas = daoBoleta.listarTodasBoletas();
            if (boletas == null)
            {
                Debug.WriteLine($"No hay boletas disponibles.");
                return;
            }
            var boletasUsuario = boletas.Where(b => b.cliente.id == usuarioId).ToList();
            int totalBoletas = boletasUsuario.Count; // Total de boletas para el usuario

            // Generar el encabezado con el número total y el ícono
            StringBuilder html = new StringBuilder();
            
            html.Append("<div class='accordion' id='accordionBoletas'>");

            foreach (var boleta in boletasUsuario)
            {
                Debug.WriteLine($"Generando HTML para la boleta #{boleta.idBoleta}.");
                StringBuilder detallesHtml = new StringBuilder();
                foreach (var linea in lineasBoleta.Where(l => l.idBoleta == boleta.idBoleta))
                {
                    if (linea.butacaFuncion != null)
                    {
                        detallesHtml.Append($@"
                    <li class='list-group-item'>
                        <i class='fas fa-film'></i> <!-- Ícono de película -->
                        <strong>Película:</strong> {linea.butacaFuncion.funcion.pelicula.titulo}<br>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;Butaca:</strong> Fila {linea.butacaFuncion.fila}, Columna {linea.butacaFuncion.columna}<br>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;Cantidad:</strong> {linea.cantidad}<br>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;Subtotal:</strong> S/.{linea.subtotal:F2}
                    </li>");
                    }
                    else if (linea.consumible != null)
                    {
                        detallesHtml.Append($@"
                    <li class='list-group-item'>
                        <i class='fas fa-utensils'></i>
                        <strong>Consumible:</strong> {linea.consumible.nombre}<br>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;Cantidad:</strong> {linea.cantidad}<br>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;Subtotal:</strong> S/.{linea.subtotal:F2}
                    </li>");
                    }
                }
                html.Append($@"
            <div class='accordion-item'>
                <h2 class='accordion-header' id='heading{boleta.idBoleta}'>
                    <button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#collapse{boleta.idBoleta}' aria-expanded='false' aria-controls='collapse{boleta.idBoleta}'>
                        <strong>Boleta #{boleta.idBoleta}</strong> - Fecha: {boleta.fechaCompra:dd/MM/yyyy} - Total: S/.{boleta.total:F2}
                    </button>
                </h2>
                <div id='collapse{boleta.idBoleta}' class='accordion-collapse collapse' aria-labelledby='heading{boleta.idBoleta}'>
                    <div class='accordion-body'>
                        <h5 class='monserrat'>Detalles:</h5>
                        <ul class='list-group'>
                            {detallesHtml}
                        </ul>
                    </div>
                </div>
            </div>");
            }
            //int totalBoletas = boletasUsuario.Count; // Total de boletas para el usuario

            html.Append("</div>");
            pnlBoletas.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}