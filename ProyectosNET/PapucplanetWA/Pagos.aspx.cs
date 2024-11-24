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
using System.Diagnostics;

namespace PapucplanetWA
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected boleta bol;
        protected ReporteWSClient daoReporte;


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

            string mensajeError;

            // Validar los campos del formulario
            if (!ValidarCamposPago(txtNombreCompleto.Text, txtDni.Text, out mensajeError))
            {
                lblErrorModal.Text = mensajeError;

                // Mostrar modal de error (Bootstrap 5)
                // Mostrar modal de error y mantener visible la sección de tarjeta
                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();
                    document.getElementById('credit-card').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
                return;
            }

            // Validar los campos específicos de la tarjeta
            if (!ValidarCamposTarjeta(txtNumeroTarjeta.Text, txtFechaExpiracion.Text, txtCvv.Text, txtNombreTarjeta.Text, out mensajeError))
            {
                lblErrorModal.Text = mensajeError;

                // Mostrar modal de error (Bootstrap 5)
                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();  
                    document.getElementById('credit-card').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
                return;
            }


            // Lógica de procesamiento de tarjeta (simulación)
            string numeroTarjeta = txtNumeroTarjeta.Text;
            string fechaExpiracion = txtFechaExpiracion.Text;
            string cvv = txtCvv.Text;
            string nombreTarjeta = txtNombreTarjeta.Text;

            bol.metodoPago = metodoPago.TARJETA_DEBITO;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();

            if ((bol.idBoleta=daoBoleta.insertarBoleta(bol)) != 0)
            {
                // Mostrar modal de éxito (Bootstrap 5)
                string script = "var successModal = new bootstrap.Modal(document.getElementById('successModal')); successModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal", script, true);
                SendEmailWithJasperPDF();
                // Limpiar variables de sesión
                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
            else
            {
                // Si el pago falla, mostrar modal de error
                lblErrorModal.Text = "Hubo un problema al procesar el pago. Por favor, inténtelo nuevamente.";
                string script = "var errorModal = new bootstrap.Modal(document.getElementById('errorModal')); errorModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
            }
            
        }

        protected void btnConfirmarYape_Click(object sender, EventArgs e)
        {
            string mensajeError;
            // Validar los campos del formulario
            if (!ValidarCamposPago(txtNombreCompleto.Text, txtDni.Text, out mensajeError))
            {
                lblErrorModal.Text = mensajeError;

                // Mostrar modal de error (Bootstrap 5)
                // Mostrar modal de error y mantener visible la sección de tarjeta
                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();
                    document.getElementById('yape').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
                return;
            }

            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();

            if ((bol.idBoleta = daoBoleta.insertarBoleta(bol)) != 0)
            {
                // Mostrar modal de éxito (Bootstrap 5)
                string script = "var successModal = new bootstrap.Modal(document.getElementById('successModal')); successModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal", script, true);
                SendEmailWithJasperPDF();
                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
            
        }

        protected void btnConfirmarPlin_Click(object sender, EventArgs e)
        {
            string mensajeError;
            // Validar los campos del formulario
            if (!ValidarCamposPago(txtNombreCompleto.Text, txtDni.Text, out mensajeError))
            {
                lblErrorModal.Text = mensajeError;

                // Mostrar modal de error (Bootstrap 5)
                // Mostrar modal de error y mantener visible la sección de tarjeta
                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();
                    document.getElementById('plin').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
                return;
            }

            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;
            BoletaWSClient daoBoleta = new BoletaWSClient();
            if ((bol.idBoleta = daoBoleta.insertarBoleta(bol)) != 0)
            {
                // Mostrar mensaje y redirigir después de un pequeño retardo
                // Mostrar modal de éxito (Bootstrap 5)
                string script = "var successModal = new bootstrap.Modal(document.getElementById('successModal')); successModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal", script, true);
                SendEmailWithJasperPDF();
                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
        }

        protected void btnConfirmarTransferencia_Click(object sender, EventArgs e)
        {
            string mensajeError;
            // Validar los campos del formulario
            if (!ValidarCamposPago(txtNombreCompleto.Text, txtDni.Text, out mensajeError))
            {
                lblErrorModal.Text = mensajeError;

                // Mostrar modal de error (Bootstrap 5)
                // Mostrar modal de error y mantener visible la sección de tarjeta
                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();
                    document.getElementById('bank-transfer').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
                return;
            }
            // Define los números de operación válidos
            string[] numerosValidos = { "123456789012", "234567890123", "345678901234" };

            // Obtén el número de operación ingresado
            string numeroOperacion = txtNumeroOperacion.Text.Trim();

            // Comprueba si el número ingresado está en la lista de válidos
            if (!numerosValidos.Contains(numeroOperacion))
            {
                // Mostrar modal de error si el número no es válido
                lblErrorModal.Text = "El número de operación ingresado no es válido. Por favor, verifica el número.";

                string script = @"
                    var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                    errorModal.show();  
                    document.getElementById('bank-transfer').classList.add('active-payment');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);


                return;
            }

            bol.metodoPago = metodoPago.BILLETERA_ELECTRONICA;
            bol.metodoPagoSpecified = true;

            // Lógica para confirmar el pago por transferencia bancaria
            BoletaWSClient daoBoleta = new BoletaWSClient();
            if ((bol.idBoleta = daoBoleta.insertarBoleta(bol)) != 0)
            {
                // Mostrar modal de éxito (Bootstrap 5)
                string script = "var successModal = new bootstrap.Modal(document.getElementById('successModal')); successModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal", script, true);
                SendEmailWithJasperPDF();
                // Limpiar variables de sesión
                Session["LineasBoleta"] = null;
                Session["CantidadProductos"] = null;
                Session["Visible"] = 0;
            }
            else
            {
                // Mostrar modal de error si el pago falla
                lblErrorModal.Text = "Hubo un problema al procesar el pago. Por favor, inténtelo nuevamente.";

                string script = "var errorModal = new bootstrap.Modal(document.getElementById('errorModal')); errorModal.show();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowErrorModal", script, true);
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfiteriaVUsuario.aspx");
        }

        private bool ValidarCamposPago(string nombreCompleto, string numeroTelefono, out string mensajeError)
        {
            if (string.IsNullOrWhiteSpace(nombreCompleto))
            {
                mensajeError = "El campo 'Nombre Completo' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(nombreCompleto, @"^[A-Za-z\s]{3,50}$"))
            {
                mensajeError = "El campo ''Nombre Completo' solo puede contener letras y espacios (3-50 caracteres)";
                //"El campo ''Nombre Completo' solo puede contener letras y espacios, y debe tener entre 3 y 50 caracteres.'";
                return false;
            }
            if (string.IsNullOrWhiteSpace(numeroTelefono))
            {
                mensajeError = "El campo 'DNI' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(numeroTelefono, @"^\d{8}$"))
            {
                mensajeError = "El campo 'DNI' debe ser un número válido de 7 dígitos.";
                return false;
            }

            mensajeError = string.Empty;
            return true;
        }

        private bool ValidarCamposTarjeta(string numeroTarjeta, string fechaExpiracion, string cvv, string nombreTarjeta, out string mensajeError)
        {
            if (string.IsNullOrWhiteSpace(numeroTarjeta))
            {
                mensajeError = "El campo 'Número de Tarjeta' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(numeroTarjeta, @"^\d{16}$"))
            {
                mensajeError = "El campo 'Número de Tarjeta' debe contener exactamente 16 dígitos.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(fechaExpiracion))
            {
                mensajeError = "El campo 'Fecha de Expiración' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(fechaExpiracion, @"^(0[1-9]|1[0-2])\/\d{2}$"))
            {
                mensajeError = "El campo 'Fecha de Expiración' debe estar en el formato MM/AA.";
                return false;
            }
            else
            {
                // Validar si la tarjeta está vencida
                try
                {
                    string[] partes = fechaExpiracion.Split('/');
                    int mes = int.Parse(partes[0]);
                    int anio = int.Parse("20" + partes[1]); // Convertir AA a formato completo (ejemplo: 23 -> 2023)

                    DateTime fechaExpiracionParsed = new DateTime(anio, mes, DateTime.DaysInMonth(anio, mes));
                    if (fechaExpiracionParsed < DateTime.Now)
                    {
                        mensajeError = "La tarjeta ingresada está vencida.";
                        return false;
                    }
                }
                catch (Exception)
                {
                    mensajeError = "El campo 'Fecha de Expiración' tiene un formato inválido.";
                    return false;
                }
            }

            if (string.IsNullOrWhiteSpace(cvv))
            {
                mensajeError = "El campo 'CVV' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(cvv, @"^\d{3}$"))
            {
                mensajeError = "El campo 'CVV' debe contener exactamente 3 dígitos.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(nombreTarjeta))
            {
                mensajeError = "El campo 'Nombre en la Tarjeta' es obligatorio.";
                return false;
            }
            if (!Regex.IsMatch(nombreTarjeta, @"^[A-Za-z\s]{3,50}$"))
            {
                mensajeError = "El campo 'Nombre en la Tarjeta' solo puede contener letras y espacios (3-50 caracteres).";
                return false;
            }

            mensajeError = string.Empty;
            return true;
        }

        protected void SendEmailWithJasperPDF()
        {
            try
            {

                daoReporte = new ReporteWSClient();
                byte[] reporte = daoReporte.reporteBoleta(bol.idBoleta);

               
                if (reporte == null || reporte.Length == 0)
                {
                    Response.Write("El PDF está vacío. No se enviará el correo.");
                    return;
                }

                // configurar cliente SMTP
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("cliente8042819@gmail.com", "vvlj tkqe fzui gcni"),
                    EnableSsl = true
                };

                
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress("cliente8042819@gmail.com", "PAPUCPLANET"),
                    Subject = "BOLETA DE COMPRA",
                    Body = "Debajo se adjunta su boleta de compra. ¡Disfrute su película!",
                    IsBodyHtml = true
                };
                mail.To.Add("a20210907@pucp.edu.pe");

                
                using (MemoryStream ms = new MemoryStream(reporte, 0, reporte.Length, false, true))
                {
                    Attachment attachment = new Attachment(ms, "BoletaCompra.pdf", "application/pdf");
                    mail.Attachments.Add(attachment);

                    // Enviar el correo
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