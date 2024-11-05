using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
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
        BindingList<funcion> listaFunciones = new BindingList<funcion>();
        private FuncionWSClient daoFuncion = new FuncionWSClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                var peliculas = daoPelicula.listarTodosPelicula();
                if (peliculas != null)
                {
                    // Filtrar duplicados por ID de película
                    listaPeliculas = new BindingList<pelicula>(
                        peliculas.GroupBy(p => p.idPelicula)
                                 .Select(g => g.First())
                                 .ToList()
                    );
                }

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
            if (daoPelicula.listarTodosPelicula() != null)
            {
                listaPeliculas = new BindingList<pelicula>(daoPelicula.listarTodosPelicula());
            }
            
            List<string> peliculas = new List<string> { "Elegir"};
            foreach(pelicula peli in listaPeliculas)
            {
                peliculas.Add(peli.titulo);
            }
            ddlMovie.DataSource = peliculas;
            ddlMovie.DataBind();
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

        protected void FiltrarPeliculas(object sender, EventArgs e)
        {
            // Obtén los valores seleccionados
            string peliculaSeleccionada = ddlMovie.SelectedValue;
            string sedeSeleccionada = ddlCine.SelectedValue;
            string fechaSeleccionada = ddlFecha.SelectedValue;

            // Obtén la lista completa de películas y funciones
            listaPeliculas = new BindingList<pelicula>(daoPelicula.listarTodosPelicula());
            listaFunciones = new BindingList<funcion>(daoFuncion.listarPeliculasConFuncionesActivasFuncion());

            // Lista para almacenar las películas con funciones filtradas
            List<pelicula> peliculasFiltradasFuncion = new List<pelicula>();
            HashSet<int> peliculasIds = new HashSet<int>(); // Para almacenar los IDs únicos de las películas

            // Determina la fecha de filtro según la selección
            DateTime? fechaFiltro = null;
            if (fechaSeleccionada == "Hoy")
            {
                fechaFiltro = DateTime.Today;
            }
            else if (fechaSeleccionada == "Mañana")
            {
                fechaFiltro = DateTime.Today.AddDays(1);
            }
            else if (fechaSeleccionada == "Pasado Mañana")
            {
                fechaFiltro = DateTime.Today.AddDays(2);
            }

            foreach (funcion peliFuncion in listaFunciones)
            {
                // Filtrar por título de la película
                if (peliculaSeleccionada != "Elegir" && peliFuncion.pelicula.titulo != peliculaSeleccionada)
                {
                    continue;
                }

                // Filtrar por sede
                if (sedeSeleccionada != "Elegir" && peliFuncion.sala.sede.universidad != sedeSeleccionada)
                {
                    continue;
                }

                // Filtrar por fecha (solo si se seleccionó una opción diferente de "Elegir")
                if (fechaFiltro.HasValue && peliFuncion.dia.Date != fechaFiltro.Value.Date)
                {
                    continue;
                }

                // Verificar si ya se ha agregado esta película (usando su ID)
                if (!peliculasIds.Contains(peliFuncion.pelicula.idPelicula))
                {
                    peliculasFiltradasFuncion.Add(peliFuncion.pelicula); // Agrega la película a la lista filtrada
                    peliculasIds.Add(peliFuncion.pelicula.idPelicula); // Agrega el ID al HashSet para evitar duplicados
                }
            }

            // Establecer el origen de datos del Repeater
            if (peliculaSeleccionada == "Elegir" && sedeSeleccionada == "Elegir" && fechaSeleccionada == "Elegir")
            {
                // Mostrar todas las películas sin aplicar filtros adicionales
                rptMovies.DataSource = listaPeliculas;
            }
            else
            {
                rptMovies.DataSource = peliculasFiltradasFuncion;
            }

            // Actualiza el Repeater con las películas que cumplen los filtros
            rptMovies.DataBind();
        }
    }
}