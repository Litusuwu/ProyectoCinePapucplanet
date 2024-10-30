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
        private PeliculaDAO daoPelicula;
        private FuncionDAO daoFuncion;
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
            daoPelicula = new PeliculaMySQL();
            Pelicula pelicula = daoPelicula.obtenerPorId(idPelicula);

            if (pelicula != null)
            {
                // Asignar datos al HTML de la página
                movieTitle.InnerText = pelicula.Titulo;
                movieImage_Link.ImageUrl = pelicula.Imagen_link;
                lblMovieDescription.Text = pelicula.Sinopsis;
                lblMovieDuration.Text = $"Duración: {pelicula.Duracion} horas";
                lblMovieGenre.Text = $"Género: {pelicula.Genero}";
            }
        }

        protected void CargarDiasYHorarios(int idPelicula)
        {
            daoFuncion = new FuncionMySQL();
            BindingList<Funcion> funciones = daoFuncion.obtenerFuncionesPorPelicula(idPelicula);

            // Filtrar días únicos
            var diasUnicos = funciones.Select(f => f.Dia.Date).Distinct();
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
            var horariosUnicos = funciones.Select(f => f.HorarioInicio).Distinct();
            foreach (var horario in horariosUnicos)
            {
                Button horarioButton = new Button
                {
                    CssClass = "btn btn-outline-secondary",
                    Text = horario.ToString(@"hh\:mm"),
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