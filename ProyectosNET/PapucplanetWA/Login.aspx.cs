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
            if (usuarioVerificado != null)
            {
                // Imprime el tipo de clase que estás recibiendo
                Response.Write($"<script>console.log('Tipo de usuarioVerificado: {usuarioVerificado.GetType()}');</script>");

                Session["Usuario"] = usuarioVerificado;

                // Verifica el tipo de usuario
                if (usuarioVerificado.tipoUsuario == 'A')
                {
                    Response.Write("<script>console.log('Usuario es administrador');</script>");
                    Response.Redirect("Home.aspx");
                }
                else if (usuarioVerificado.tipoUsuario == 'C')
                {
                    Response.Write("<script>console.log('Usuario es cliente');</script>");
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
