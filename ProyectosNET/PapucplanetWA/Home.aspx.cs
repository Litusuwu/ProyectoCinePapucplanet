using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PapucplanetWA.Servicio;
namespace PapucplanetWA
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario usuarioDatos = (usuario)Session["Usuario"];
            if (usuarioDatos == null || usuarioDatos.tipoUsuario=='C')
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
            Papucplanet masterPage = (Papucplanet)Master;
            if (masterPage != null)
            {
                masterPage.SetTituloPagina("Inicio");
            }
        }
    }
}