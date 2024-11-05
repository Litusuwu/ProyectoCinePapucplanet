using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Funciones : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        private pelicula pelicula;
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
            string idPelicula = Request.QueryString["idPelicula"];

            daoPelicula = new PeliculaWSClient();

            if (idPelicula != null)
            {
                pelicula = daoPelicula.obtenerPorIdPelicula(Int32.Parse(idPelicula));
                string imageUrl = pelicula.imagenPromocional;
                imgPosterPromocional.ImageUrl = imageUrl;
                lblSinopsis.Text = pelicula.sinopsis;
                lblTituloPelicula.Text = pelicula.titulo;
            }
        }
    }
}