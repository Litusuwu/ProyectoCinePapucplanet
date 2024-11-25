using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Login : System.Web.UI.Page
    {
        private CuentaWSClient daoCuenta = new CuentaWSClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsername.Text;
            string contrasena = txtPassword.Text;
            var cuenta = new cuenta {correo = usuario, password = contrasena};
            usuario usuarioVerificado = daoCuenta.verificarCuenta(cuenta);
            Session["cuenta"] = (cuenta)cuenta;
            if (usuarioVerificado != null)
            {
                Session["Usuario"] = usuarioVerificado;
                if (usuarioVerificado.tipoUsuario == 'A')
                {
                    Response.Redirect("Home.aspx");
                }
                else if (usuarioVerificado.tipoUsuario == 'C')
                {
                    Session["Redireccion"] = "PeliculasUsuario.aspx";
                    Response.Redirect("PeliculasUsuario.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Usuario o contraseña incorrectos {id}');</script>");
            }
            
        }
            
            
        }
    }
