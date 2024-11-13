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
            if (!string.IsNullOrEmpty(idPeliculaStr) && int.TryParse(idPeliculaStr, out int idPeliculaParsed))
            {
                CargarDiasYHorarios(idPeliculaParsed);
                if (ViewState["diaSeleccionado"] != null)
                {
                    CargarHorariosPorDiaSeleccionado(ViewState["diaSeleccionado"].ToString());
                }

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(idPeliculaStr) && int.TryParse(idPeliculaStr, out int idPelicula))
                    {
                        CargarDetallesPelicula(idPelicula);
                    }
                    else
                    {
                        Response.Write("Error: Parámetro 'id_pelicula' no proporcionado o no válido.");
                        return;
                    }
                }
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
                LinkButton diaButton = new LinkButton
                {
                    CssClass = "btn btn-outline-secondary",
                    Text = dia.ToString("dd MMM"),
                    CommandArgument = dia.ToString("yyyy-MM-dd")
                };
                diaButton.Click += DiaButton_Click; // Solo manejamos el evento del servidor
                dayContainer.Controls.Add(diaButton);
            }
        }


        private void DiaButton_Click(object sender, EventArgs e)
        {
            LinkButton diaButton = (LinkButton)sender; // Cambiado a LinkButton
            string diaSeleccionado = diaButton.CommandArgument;

            // Almacena el día seleccionado en ViewState
            ViewState["diaSeleccionado"] = diaSeleccionado;

            // Llama al método para cargar los horarios correspondientes
            CargarHorariosPorDiaSeleccionado(diaSeleccionado);

            // Cambia el estilo del botón seleccionado
            foreach (Control control in dayContainer.Controls)
            {
                if (control is LinkButton button)
                {
                    // Remueve la clase seleccionada de todos los botones
                    button.CssClass = button.CssClass.Replace(" selected-button", "").Trim();

                    // Si este botón es el que se seleccionó, agrégale la clase
                    if (button == diaButton)
                    {
                        button.CssClass += " selected-button";
                    }
                }
            }

            System.Diagnostics.Debug.WriteLine($"Entro a dia button click.");
        }


        private void CargarHorariosPorDiaSeleccionado(string diaSeleccionado)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ConsoleLog", "console.log('Mensaje desde el servidor');", true);

            string idPeliculaStr = Request.QueryString["id_pelicula"];
            if (int.TryParse(idPeliculaStr, out int idPelicula))
            {
                BindingList<funcion> funciones = new BindingList<funcion>(daoFuncion.obtenerFuncionesPorPeliculaFuncion(idPelicula));

                // Convierte la cadena de día seleccionada a DateTime para comparación
                if (DateTime.TryParse(diaSeleccionado, out DateTime fechaSeleccionada))
                {
                    // Filtra las funciones para el día seleccionado
                    var funcionesFiltradas = funciones.Where(f => f.dia.Date == fechaSeleccionada.Date).ToList();
                    timeContainer.Controls.Clear(); // Limpia cualquier horario previo

                    if (funcionesFiltradas.Count > 0)
                    {
                        foreach (var funcion in funcionesFiltradas)
                        {
                            LinkButton horarioButton = new LinkButton
                            {
                                CssClass = "btn btn-outline-secondary",
                                Text = funcion.horarioInicio.ToString("HH:mm"),
                                CommandArgument = funcion.idFuncion.ToString()
                            };
                            horarioButton.Click += HorarioButton_Click;
                            timeContainer.Controls.Add(horarioButton);
                        }
                    }
                    else
                    {
                        // Mostrar mensaje si no hay horarios disponibles
                        Label noHorariosLabel = new Label
                        {
                            Text = "No hay horarios disponibles para el día seleccionado.",
                            CssClass = "text-center text-danger"
                        };
                        timeContainer.Controls.Add(noHorariosLabel);
                    }
                }
                else
                {
                    // Mensaje de depuración si la conversión de fecha falla
                    System.Diagnostics.Debug.WriteLine($"La conversión de la fecha '{diaSeleccionado}' falló.");
                }
            }
        }


        private void HorarioButton_Click(object sender, EventArgs e)
        {

            System.Diagnostics.Debug.WriteLine($"Entró a Horario Click.");
            LinkButton horarioButton = (LinkButton)sender;
            ViewState["horarioSeleccionado"] = horarioButton.CommandArgument;
            ViewState["idFuncionSeleccionada"] = horarioButton.CommandArgument;


            VerificarRedireccion();
        }
        private void VerificarRedireccion()
        {
            System.Diagnostics.Debug.WriteLine($"Entró a verificar.");

            if (ViewState["diaSeleccionado"] != null && ViewState["horarioSeleccionado"] != null)
            {
                string diaSeleccionado = ViewState["diaSeleccionado"].ToString();
                string horarioSeleccionado = ViewState["horarioSeleccionado"].ToString();

                string idFuncion = ViewState["idFuncionSeleccionada"].ToString();
                Response.Redirect($"Butacas.aspx?dia={diaSeleccionado}&horario={horarioSeleccionado}&idFuncion={idFuncion}");
            }
        }
    }
}