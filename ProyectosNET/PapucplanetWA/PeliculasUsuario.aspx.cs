using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class PeliculasUsuario : System.Web.UI.Page
    {
        private List<pelicula> listaPeliculas = new List<pelicula>();
        private List<sede> listaSedes = new List<sede>();
        private List<funcion> listaFunciones = new List<funcion>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || Request.QueryString["reload"] == "true")
            {
                CargarDatos();
                BindPeliculas();
                BindSedes();
                BindFechas();
            }
        }
        protected void ReloadPage(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsolutePath + "?reload=true");
        }
        private void CargarDatos()
        {
            var daoPelicula = new PeliculaWSClient();
            var daoSedes = new SedeWSClient();
            var daoFuncion = new FuncionWSClient();
            Debug.WriteLine($"gaaaaaaaaaaaaaaaaaaaaaaa");
            listaPeliculas = daoPelicula.listarTodosPelicula()?.ToList() ?? new List<pelicula>();
            listaSedes = daoSedes.listarTodosSede()?.ToList() ?? new List<sede>();
            listaFunciones = daoFuncion.listarPeliculasConFuncionesActivasFuncion()?.ToList() ?? new List<funcion>();
            ViewState["listaFunciones"] = listaFunciones;

            rptMovies.DataSource = listaPeliculas.GroupBy(p => p.idPelicula).Select(g => g.First()).ToList();
            rptMovies.DataBind();
        }

        private void BindPeliculas()
        {
            var peliculas = new List<string> { "Elegir" };
            peliculas.AddRange(listaPeliculas.Select(p => p.titulo).Distinct());
            ddlMovie.DataSource = peliculas;
            ddlMovie.DataBind();
        }

        private void BindSedes()
        {
            var sedes = new List<string> { "Elegir" };
            sedes.AddRange(listaSedes.Select(s => s.universidad).Distinct());
            ddlCine.DataSource = sedes;
            ddlCine.DataBind();
        }

        private void BindFechas()
        {
            var fechas = new List<string>
            {
                "Elegir",
                "Hoy - " + DateTime.Today.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture),
                "Mañana - " + DateTime.Today.AddDays(1).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture),
                "Pasado Mañana - " + DateTime.Today.AddDays(2).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)
            };
            ddlFecha.DataSource = fechas;
            ddlFecha.DataBind();
        }

        protected void FiltrarPeliculas(object sender, EventArgs e)
        {
            listaFunciones = ViewState["listaFunciones"] as List<funcion> ?? new List<funcion>();

            //foreach (var funcion in listaFunciones)
            //{
            //    Debug.WriteLine($"Función ID: {funcion.idFuncion}, Película: {funcion.pelicula.titulo}, Sede: {funcion.sala.sede.universidad}, Día: {funcion.dia}");
            //}
            //Debug.WriteLine("FiltrarPeliculas: Iniciando el filtro.");

            string peliculaSeleccionada = ddlMovie.SelectedValue;
            string sedeSeleccionada = ddlCine.SelectedValue;
            string fechaSeleccionada = ddlFecha.SelectedValue;

            //Debug.WriteLine($"Película seleccionada: {peliculaSeleccionada}");
            //Debug.WriteLine($"Sede seleccionada: {sedeSeleccionada}");
            //Debug.WriteLine($"Fecha seleccionada: {fechaSeleccionada}");

            DateTime? fechaFiltro = null;
            if (fechaSeleccionada.StartsWith("Hoy"))
                fechaFiltro = DateTime.Today;
            else if (fechaSeleccionada.StartsWith("Mañana"))
                fechaFiltro = DateTime.Today.AddDays(1);
            else if (fechaSeleccionada.StartsWith("Pasado Mañana"))
                fechaFiltro = DateTime.Today.AddDays(2);

            //Debug.WriteLine($"Fecha de filtro calculada: {fechaFiltro}");

            var funcionesFiltradas = listaFunciones.Where(f =>
                (peliculaSeleccionada == "Elegir" || f.pelicula.titulo == peliculaSeleccionada) &&
                (sedeSeleccionada == "Elegir" || f.sala.sede.universidad == sedeSeleccionada) &&
                (!fechaFiltro.HasValue || f.dia.Date == fechaFiltro.Value.Date)).ToList();

            //Debug.WriteLine($"Funciones filtradas: {funcionesFiltradas.Count}");

            // Filtrar películas únicas
            var peliculasFiltradas = funcionesFiltradas
                .Select(f => f.pelicula)
                .GroupBy(p => p.idPelicula)
                .Select(g => g.First())
                .ToList();

            //Debug.WriteLine($"Películas filtradas: {peliculasFiltradas.Count}");

            var resultado = (peliculaSeleccionada == "Elegir" && sedeSeleccionada == "Elegir" && !fechaFiltro.HasValue)
                ? listaPeliculas.GroupBy(p => p.idPelicula).Select(g => g.First()).ToList()
                : peliculasFiltradas;

            //Debug.WriteLine($"Películas en el resultado final: {resultado.Count}");

            rptMovies.DataSource = resultado;
            rptMovies.DataBind();
        }
    }
}
