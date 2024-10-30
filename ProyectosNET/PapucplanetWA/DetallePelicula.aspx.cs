using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PapucplanetWA.Servicio;

namespace PapucplanetWA
{
    public partial class DetallePelicula : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula = new PeliculaWSClient();
        private FuncionWSClient daoFuncion = new FuncionWSClient();
        // Variables para almacenar el día y el horario seleccionados
        protected void Page_Load(object sender, EventArgs e)
        {
            string idPeliculaStr = Request.QueryString["id_pelicula"];
            if (!IsPostBack)
            {
                // Verificar que idPeliculaStr no sea null o vacío
                if (!string.IsNullOrEmpty(idPeliculaStr) && int.TryParse(idPeliculaStr, out int idPelicula))
                {
                    CargarDetallesPelicula(idPelicula);
                }
                else
                {
                    // Muestra un mensaje de error o redirige a otra página si el id_pelicula es inválido
                    Response.Write("Error: Parámetro 'id_pelicula' no proporcionado o no válido.");
                    return;
                }
            }

            // Cargar los botones de días y horarios en cada carga de página
            if (!string.IsNullOrEmpty(idPeliculaStr) && int.TryParse(idPeliculaStr, out int idPeliculaParsed))
            {
                CargarDiasYHorarios(idPeliculaParsed);
            }
        }

        private void CargarDetallesPelicula(int idPelicula)
        {
            pelicula pelicula = daoPelicula.obtenerPorIdPelicula(idPelicula);

            if (pelicula != null)
            {
                // Asignar datos al HTML de la página
                movieTitle.InnerText = pelicula.titulo;
                movieImage_Link.ImageUrl = pelicula.imagenPromocional;
                lblMovieDescription.Text = pelicula.sinopsis;
                lblMovieDuration.Text = $"Duración: {pelicula.duracion} horas";
                lblMovieGenre.Text = $"Género: {pelicula.genero}";
            }
        }

        protected void CargarDiasYHorarios(int idPelicula)
        {
            BindingList<funcion> funciones = new BindingList<funcion>(daoFuncion.obtenerFuncionesPorPeliculaFuncion(idPelicula));
                

            // Filtrar días únicos
            var diasUnicos = funciones.Select(f => f.dia.Date).Distinct();
            foreach (var dia in diasUnicos)
            {
                Button diaButton = new Button
                {
                    CssClass = "btn btn-outline-secondary",
                    Text = dia.ToString("dd MMM"),
                    CommandArgument = dia.ToString("yyyy-MM-dd"),
                    OnClientClick = $"selectDay(this, '{dia.ToString("yyyy-MM-dd")}'); return false;" // Agregar llamada a JavaScript
                };
                dayContainer.Controls.Add(diaButton);
            }

            // Filtrar horarios únicos
            var horariosUnicos = funciones.Select(f => f.horarioInicio).Distinct();
            foreach (var horario in horariosUnicos)
            {
                Button horarioButton = new Button
                {
                    CssClass = "btn btn-outline-secondary",
                    Text = horario.ToString(), // Esto usará el formato predeterminado de LocalTime
                    CommandArgument = horario.ToString(),
                    OnClientClick = $"selectTime(this, '{horario.ToString()}'); return false;" // Agregar llamada a JavaScript
                };
                timeContainer.Controls.Add(horarioButton);
            }
        }
        private void DiaButton_Click(object sender, EventArgs e)
        {
            Button diaButton = (Button)sender;
            ViewState["diaSeleccionado"] = diaButton.CommandArgument;

            VerificarRedireccion();
        }

        private void HorarioButton_Click(object sender, EventArgs e)
        {
            Button horarioButton = (Button)sender;
            ViewState["horarioSeleccionado"] = horarioButton.CommandArgument;

            VerificarRedireccion();
        }

        private void VerificarRedireccion()
        {
            if (ViewState["diaSeleccionado"] != null)
            {
                string diaSeleccionado = ViewState["diaSeleccionado"].ToString();
                if (ViewState["horarioSeleccionado"] != null)
                {
                    string horarioSeleccionado = ViewState["horarioSeleccionado"].ToString();
                    // Redirigir a Butacas.aspx con los parámetros seleccionados
                    Response.Redirect("Butacas.aspx?dia=" + diaSeleccionado + "&horario=" + horarioSeleccionado);
                }

            }
        }
    }
}