using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;

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

        protected void SendEmailWithJasperPDF()
        {
            try
            {
                string tempFilePath = @"C:\Users\Patricia\Downloads\1INF40-2024-2-Entregable3-v3.pdf";


                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("cliente8042819@gmail.com", "vvlj tkqe fzui gcni"),
                    EnableSsl = true
                };


                MailMessage mail = new MailMessage
                {
                    From = new MailAddress("cliente8042819@gmail.com", "PAPUS PRIME"),
                    Subject = "OJO PAPUS FUNCIONA??",
                    Body = "Attached is the PDF generated by JasperReports.",
                    IsBodyHtml = true
                };
                mail.To.Add("a20210800@pucp.edu.pe");


                using (Attachment attachment = new Attachment(tempFilePath))
                {
                    attachment.ContentDisposition.FileName = "Report.pdf";
                    mail.Attachments.Add(attachment);
                    smtpClient.Send(mail);
                }

                Response.Write("Email sent successfully.");
            }
            catch (SmtpException ex)
            {
                Response.Write($"SMTP Error: {ex.Message} - {ex.InnerException?.Message}");

            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
        }
    }
}