using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Inicializar algo si es necesario
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
            Response.Write("<script>alert('Pago con Yape confirmado');</script>");
        }

        protected void btnConfirmarPlin_Click(object sender, EventArgs e)
        {
            // Lógica para confirmar el pago con Plin
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