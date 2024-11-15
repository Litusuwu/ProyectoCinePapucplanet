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
            Response.Write("<script>alert('Pago con tarjeta procesado exitosamente');</script>");
        }

        protected void btnConfirmarYape_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pago con Yape
            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();
            daoBoleta.insertarBoleta(bol);
            Response.Write("<script>alert('Pago con Yape confirmado');</script>");
        }

        protected void btnConfirmarPlin_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pago con Plin
            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();
            daoBoleta.insertarBoleta(bol);
            Response.Write("<script>alert('Pago con Plin confirmado');</script>");
        }

        protected void btnConfirmarTransferencia_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pago por transferencia bancaria
            string numeroOperacion = txtNumeroOperacion.Text;
            // Aquí se puede agregar la lógica de procesamiento de la transferencia
            Response.Write("<script>alert('Pago por transferencia confirmado');</script>");
        }
    }
}