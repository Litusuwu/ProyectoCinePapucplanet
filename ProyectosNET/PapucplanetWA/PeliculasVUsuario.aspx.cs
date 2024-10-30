using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class PeliculasVUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Sample data - replace with your data source
                var movies = new List<Movie>
                {
                    new Movie { MovieID = 1, Title = "Shrek 2", ImageUrl = "https://es.web.img3.acsta.net/img/c7/8f/c78f03f18bedb20a5bb8171012b053ff.jpg" },
                    new Movie { MovieID = 2, Title = "FNAF", ImageUrl = "https://es.web.img3.acsta.net/medias/nmedia/18/84/34/57/19816291.jpg" },
                    new Movie { MovieID = 3, Title = "Moana", ImageUrl = "https://es.web.img2.acsta.net/c_310_420/img/bf/f1/bff188201600766796335bdaa9cda59b.jpg" },
                    new Movie { MovieID = 4, Title = "Moana", ImageUrl = "https://es.web.img2.acsta.net/c_310_420/img/bf/f1/bff188201600766796335bdaa9cda59b.jpg" }
                    // Add more movies here
                };

                // Bind to repeater
                rptMovies.DataSource = movies;
                rptMovies.DataBind();
                BindPeliculas();
                BindSedes();
                BindFechas();
            }
        }


        // Movie class for demonstration purposes
        public class Movie
        {
            public int MovieID { get; set; }
            public string Title { get; set; }
            public string ImageUrl { get; set; }
        }
        private void BindPeliculas()
        {
            List<string> peliculas = new List<string> { "Elegir", "Película 1", "Película 2", "Película 3" };

            ddlPelicula.DataSource = peliculas;
            ddlPelicula.DataBind();
        }
        private void BindSedes()
        {
            List<string> sedes = new List<string> { "Elegir", "Sede 1", "Sede 2", "Sede 3" };
            ddlCine.DataSource = sedes;
            ddlCine.Items.Insert(0, new ListItem("Elegir", ""));

            ddlCine.DataBind();
        }
        private void BindFechas()
        {
            List<string> fechas = new List<string> { "Elegir", "Fecha 1", "Fecha 2", "Fecha 3" };
            ddlFecha.DataSource = fechas;
            ddlFecha.DataBind();
        }
    }
}