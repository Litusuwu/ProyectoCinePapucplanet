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
    public partial class PeliculasUsuario : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula = new PeliculaWSClient();
        private SedeWSClient daoSedes = new SedeWSClient();
        BindingList<pelicula> listaPeliculas = new BindingList<pelicula>();
        BindingList<sede>listaSedes = new BindingList<sede>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listaPeliculas = new BindingList<pelicula>(daoPelicula.listarTodosPelicula());
                

                // Bind to repeater
                rptMovies.DataSource = listaPeliculas;
                rptMovies.DataBind();
                BindPeliculas();
                BindSedes();
                BindFechas();
            }
        }

        private void BindPeliculas()
        {
            listaPeliculas = new BindingList<pelicula>(daoPelicula.listarTodosPelicula());
            List<string> peliculas = new List<string> { "Elegir"};
            foreach(pelicula peli in listaPeliculas)
            {
                peliculas.Add(peli.titulo);
            }
            ddlPelicula.DataSource = peliculas;
            ddlPelicula.DataBind();
        }
        private void BindSedes()
        {
            listaSedes = new BindingList<sede>(daoSedes.listarTodosSede());
            List<string> sedes = new List<string> { "Elegir" };
            foreach (sede sed in listaSedes)
            {
                sedes.Add(sed.universidad);
            }
            ddlCine.DataSource = sedes;

            ddlCine.DataBind();
        }
        private void BindFechas()
        {
            List<string> fechas = new List<string> { "Elegir", "Hoy", "Mañana", "Pasado Mañana" };
            ddlFecha.DataSource = fechas;
            ddlFecha.DataBind();
        }
    }
}