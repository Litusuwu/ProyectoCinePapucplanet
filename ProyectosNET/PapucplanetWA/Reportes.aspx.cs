using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario usuarioDatos = (usuario)Session["Usuario"];
            if (usuarioDatos == null || usuarioDatos.tipoUsuario == 'C')
            {
                if (usuarioDatos == null)
                {
                    Session["Redireccion"] = "Login.aspx";
                }
                else if (usuarioDatos.tipoUsuario.Equals("C"))
                {
                    Session["Redireccion"] = "PeliculasUsuario.aspx";
                }
                Response.Redirect("AccesoDenegado.aspx");
            }
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(dtpFechaFin.Value))
                {
                    dtpFechaFin.Value = DateTime.Now.ToString("yyyy-MM-dd");
                }
                if (string.IsNullOrEmpty(dtpFechaInicio.Value))
                {
                    dtpFechaInicio.Value = DateTime.Now.ToString("yyyy-MM-dd");
                }
            }
            Session["Excepcion"] = "No"; //No
        }
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void lbGenerarReporte_Click(object sender, EventArgs e)
        {
            //Session["Excepcion"] = "No"; //No
            string script = "";
            if(Session["Excepcion"].ToString() == "No")
            {
                if (!rbPelicula.Checked && !rbSede.Checked)
                {
                    lblMensajeError.Text = "Debe seleccionar uno de los 2 filtros.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (!cbIngresos.Checked && !cbConsumibles.Checked && !cbButacas.Checked)
                {
                    lblMensajeError.Text = "Debe seleccionar por lo menos un contenido";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (string.IsNullOrEmpty(dtpFechaInicio.Value)){
                    lblMensajeError.Text = "No debe dejar la fecha de inicio vacia";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (string.IsNullOrEmpty(dtpFechaFin.Value))
                {
                    lblMensajeError.Text = "No debe dejar la fecha de fin vacia";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                //if ((string.IsNullOrEmpty(dtpFechaInicio.Value)) || (string.IsNullOrEmpty(dtpFechaFin.Value))
                //{
                //    if (string.IsNullOrEmpty(dtpFechaInicio.Value) && string.IsNullOrEmpty(dtpFechaFin.Value))
                //    {
                //        txtExcepcionMsg.Value = "Se utilizara la fecha actual [" + DateTime.Now.Date.ToString() + "] como unico dia para su reporte";
                //        script = "showModalFormConvencion();"; //Reemplazar en futuros paramtros fin e inicio
                //        ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                //        return;
                //    }
                //    else if (string.IsNullOrEmpty(dtpFechaFin.Value))
                //    {
                //        if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date)
                //        {
                //            txtExcepcionMsg.Value = "La fecha de inicio debe ser previa a la fecha actual " + DateTime.Now.Date.ToString();
                //            script = "showModalFormError();";
                //            ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                //            return;
                //        }
                //        else
                //        {
                //            txtExcepcionMsg.Value = "Se utilizara la fecha inicio [" + DateTime.Parse(dtpFechaInicio.Value).ToString() + "] como unico dia para su reporte";
                //            script = "showModalFormConvencion();"; //Reemplazar en futuro paramtro fin
                //            ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                //            return;
                //        }
                //    }
                //    else //Inicio esta vacio
                //    {
                //        if (DateTime.Parse(dtpFechaFin.Value) > DateTime.Now.Date)
                //        {
                //            txtExcepcionMsg.Value = "La fecha de fin debe ser previa a la fecha actual " + DateTime.Now.Date.ToString();
                //            script = "showModalFormError();";
                //            ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                //            return;
                //        }
                //        else
                //        {
                //            txtExcepcionMsg.Value = "Se utilizara la fecha fin [" + DateTime.Parse(dtpFechaFin.Value).ToString() + "] como unico dia para su reporte";
                //            script = "showModalFormConvencion();"; //Reemplazar en futuro paramtro inicio
                //            ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                //            return;
                //        }
                //    }
                //}
                if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date || DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date)
                {
                    lblMensajeError.Text = "Las fechas ingresadas deben ser previas a la fecha actual " + DateTime.Now.Date.ToString("yyyy-MM-dd");
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Parse(dtpFechaFin.Value))
                {
                    lblMensajeError.Text = "Las fecha de inicio debe ser menor a la fecha fin";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
            }
            //Si estaba en Si, sacar de Session todas las variables guardadas
            System.Console.WriteLine("Imprime Reporte...");
            
        }
        protected void lbAceptar_Click(object sender, EventArgs e)
        {
            Session["Excepcion"] = "Si"; //Si
            lbGenerarReporte_Click( sender, e);
        }
    }
}