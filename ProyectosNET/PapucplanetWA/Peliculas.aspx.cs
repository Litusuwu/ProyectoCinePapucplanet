﻿ using PapucplanetWA.Servicio;
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
                Papucplanet masterPage = (Papucplanet)Master;
                if (masterPage != null)
                {
                    masterPage.SetTituloPagina("Todas las películas");
                }
            }

            daoPelicula = new PeliculaWSClient();
            gvPeliculas.DataSource = daoPelicula.listarPorNombrePelicula(txtNombre.Text);
            gvPeliculas.DataBind();
        }

        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarNuevaPelicula.aspx");
        }

        protected void lbFunciones_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("Funciones.aspx?idPelicula=" + idPelicula);
        }

        protected void lbModificar_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("AgregarNuevaPelicula.aspx?accion=modificar&idPelicula=" + idPelicula);
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            int idPelicula = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoPelicula.eliminarPelicula(idPelicula);
            Response.Redirect("Peliculas.aspx");
        }

        protected void gvPeliculas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPeliculas.PageIndex = e.NewPageIndex;
            gvPeliculas.DataBind();
        }

        protected void gvPeliculas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = DataBinder.Eval(e.Row.DataItem, "titulo").ToString();
                e.Row.Cells[2].Text = DataBinder.Eval(e.Row.DataItem, "duracion").ToString() + " minutos";
                e.Row.Cells[3].Text = DataBinder.Eval(e.Row.DataItem, "genero").ToString();
            }
        }
    }
}