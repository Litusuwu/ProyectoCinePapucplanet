using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Limpiar sesión
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            // Limpiar cookies de autenticación si las usas
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                HttpCookie cookie = new HttpCookie("ASP.NET_SessionId");
                cookie.Expires = DateTime.Now.AddDays(-1); // Expira inmediatamente
                Response.Cookies.Add(cookie);
            }

            // Redirigir al usuario a la página de login
            Response.Redirect("Login.aspx");
        }
    }
}