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
        }
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void lbGenerarReporte_Click(object sender, EventArgs e)
        {
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
            if ()
            {

            }
            string a = "";
            a = lblFechaFin.Text;
            a = lblFechaInicio.Text;
            
        }
    }
}