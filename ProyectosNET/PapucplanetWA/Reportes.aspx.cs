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
            Session["Excepcion"] = "No"; //No
        }
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void lbGenerarReporte_Click(object sender, EventArgs e)
        {
            Session["Excepcion"] = "No"; //No
            string script = "";
            if( !rbPelicula.Checked && !rbSede.Checked)
            {
                lblMensajeError.Text = "Debe seleccionar uno de los 2 filtros.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            if( !cbIngresos.Checked && !cbConsumibles.Checked && !cbButacas.Checked)
            {
                lblMensajeError.Text = "Debe seleccionar por lo menos un contenido";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }

            if (string.IsNullOrEmpty(dtpFechaInicio.Value) || string.IsNullOrEmpty(dtpFechaInicio.Value))
            {
                if (string.IsNullOrEmpty(dtpFechaInicio.Value) && string.IsNullOrEmpty(dtpFechaInicio.Value))
                {
                    txtExcepcionMsg.Text = "Se utilizara la fecha actual [" + DateTime.Now.Date.ToString() + "] como unico dia para su reporte";
                    script = "showModalFormConvencion();"; //Reemplazar en futuros paramtros fin e inicio
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                    if (Session["Excepcion"].ToString() == "No")
                        return;
                }else if (string.IsNullOrEmpty(dtpFechaFin.Value))
                {
                    if(DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date)
                    {
                        txtExcepcionMsg.Text = "La fecha de inicio debe ser previa a la fecha actual " + DateTime.Now.Date.ToString();
                        script = "showModalFormError();";
                        ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                        return;
                    }
                    else
                    {
                        txtExcepcionMsg.Text = "Se utilizara la fecha inicio [" + DateTime.Parse(dtpFechaInicio.Value).ToString()  + "] como unico dia para su reporte";
                        script = "showModalFormConvencion();"; //Reemplazar en futuro paramtro fin
                        ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                        if (Session["Excepcion"].ToString() == "No")
                            return;
                    }
                }
                else //Inicio esta vacio
                {
                    if (DateTime.Parse(dtpFechaFin.Value) > DateTime.Now.Date)
                    {
                        txtExcepcionMsg.Text = "La fecha de fin debe ser previa a la fecha actual " + DateTime.Now.Date.ToString();
                        script = "showModalFormError();";
                        ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                        return;
                    }
                    else
                    {
                        txtExcepcionMsg.Text = "Se utilizara la fecha fin [" + DateTime.Parse(dtpFechaFin.Value).ToString() + "] como unico dia para su reporte";
                        script = "showModalFormConvencion();"; //Reemplazar en futuro paramtro inicio
                        ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormConvencion", script, true);
                        if (Session["Excepcion"].ToString() == "No")
                            return;
                    }
                }
            }
            if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date || DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date)
            {
                lblMensajeError.Text = "Las fechas ingresadas deben ser previas a la fecha actual " + DateTime.Now.Date.ToString();
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            
        }
        protected void lbAceptar_Click(object sender, EventArgs e)
        {
            Session["Excepcion"] = "Si"; //Si
        }
    }
}