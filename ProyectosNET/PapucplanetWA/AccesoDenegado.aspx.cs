using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class AccesoDenegado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string errorAcceso = Session["Redireccion"] as string;

                if (errorAcceso == "PeliculasUsuario.aspx")
                {
                    btnRedirect.HRef = "PeliculasUsuario.aspx";
                }
                else 
                {
                    btnRedirect.HRef = "Login.aspx";
                }
                Session.Remove("ErrorAcceso");
            }
        }
    }
}