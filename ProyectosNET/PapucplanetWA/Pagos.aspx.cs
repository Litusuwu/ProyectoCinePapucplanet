using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected boleta bol;
        
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usuario usuarioDatos = (usuario)Session["Usuario"];
                lnkPrfCompra.Text = usuarioDatos.nombre + " " + usuarioDatos.primerApellido;
                bol = new boleta();
                bol.cliente=new cliente();
                bol.cliente.id = ((usuario)Session["Usuario"]).id;
                bol.lineasBoleta = ((BindingList<lineaBoleta>)Session["LineasBoleta"]).ToArray();
                bol.total = sumaBoleta((BindingList<lineaBoleta>)Session["LineasBoleta"]);
                bol.fechaCompra = DateTime.Now.Date;
                bol.fechaCompraSpecified = true;
                bol.activo = true;
                Session["Boleta"] = bol;
            }
            else
            {
                bol = (boleta)Session["Boleta"];
            }
        }

        protected double sumaBoleta(BindingList<lineaBoleta>lineas)
        {
           double tot=0.0;
           foreach (lineaBoleta lin in lineas)
           {
                tot+=lin.subtotal;
           }
           return tot;
        }
        protected void btnPagarTarjeta_Click(object sender, EventArgs e)
        {
            // Lógica para procesar el pago con tarjeta
            string numeroTarjeta = txtNumeroTarjeta.Text;
            string fechaExpiracion = txtFechaExpiracion.Text;
            string cvv = txtCvv.Text;
            string nombreTarjeta = txtNombreTarjeta.Text;

            // Aquí se puede agregar la lógica de procesamiento de tarjeta de crédito
            BoletaWSClient daoBoleta = new BoletaWSClient();
            if (daoBoleta.insertarBoleta(bol) != 0)
            {
                // Mostrar mensaje y redirigir después de un pequeño retardo
                string script = "alert('Pago con tarjeta procesado exitosamente'); window.location='PeliculasUsuario.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessRedirect", script, true);

                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
        }

        protected void btnConfirmarYape_Click(object sender, EventArgs e)
        {
            
            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();

            if (daoBoleta.insertarBoleta(bol) != 0)
            {
                
                string script = "alert('Pago con Yape confirmado'); window.location='PeliculasUsuario.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessRedirect", script, true);

                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
        }

        protected void btnConfirmarPlin_Click(object sender, EventArgs e)
        {

            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();
            if (daoBoleta.insertarBoleta(bol) != 0)
            {
                // Mostrar mensaje y redirigir después de un pequeño retardo
                string script = "alert('Pago con Plin confirmado'); window.location='PeliculasUsuario.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessRedirect", script, true);

                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
        }

        protected void btnConfirmarTransferencia_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pago por transferencia bancaria
            string numeroOperacion = txtNumeroOperacion.Text;
            // Aquí se puede agregar la lógica de procesamiento de la transferencia
            BoletaWSClient daoBoleta = new BoletaWSClient();
            if (daoBoleta.insertarBoleta(bol) != 0)
            {
                // Mostrar mensaje y redirigir después de un pequeño retardo
                string script = "alert('Pago por transferencia confirmado'); window.location='PeliculasUsuario.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessRedirect", script, true);

                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfiteriaVUsuario.aspx");
        }
    }
}