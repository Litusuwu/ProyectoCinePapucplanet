using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Peliculas : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoPelicula = new PeliculaWSClient();
            gvPeliculas.DataSource = daoPelicula.listarPorNombre(txtNombre.Text);
            gvPeliculas.DataBind();
        }

        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarNuevaPelicula.aspx");
        }

        protected void lbFunciones_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("Funciones.aspx?accion=ver&idPelicula=" + idPelicula);
        }

        protected void lbModificar_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("AgregarNuevaPelicula.aspx?accion=modificar&idPelicula=" + idPelicula);
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoPelicula.eliminar(idPelicula);
            Response.Redirect("Peliculas.aspx");
        }

        protected void gvPeliculas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPeliculas.PageIndex = e.NewPageIndex;
            gvPeliculas.DataBind();
        }
    }
}