using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace PapucplanetWA
{
    public partial class Funciones : System.Web.UI.Page
    {
        Stopwatch stopwatch = new Stopwatch();

        private PeliculaWSClient daoPelicula;
        private SalaWSClient daoSala;
        private SedeWSClient daoSede;
        private FuncionWSClient daoFuncion = new FuncionWSClient();

        private BindingList<pelicula> peliculas;
        private BindingList<funcion> funciones;
        private BindingList<sede> sedes;

        private pelicula pelicula = new pelicula();
        protected TextBox tmHoraInicio;

        private Estado estado;
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

            daoPelicula = new PeliculaWSClient();
            daoSala = new SalaWSClient();
            daoSede = new SedeWSClient();

            if (!IsPostBack)
            {
                Papucplanet masterPage = (Papucplanet)Master;
                if (string.IsNullOrEmpty(dtpFechaFiltro.Value))
                {
                    dtpFechaFiltro.Value = DateTime.Now.ToString("yyyy-MM-dd");
                }
                if (masterPage != null)
                {
                    masterPage.SetTituloPagina("Ver Funciones");
                }
                cargarInformacionDeFunciones();
                cargarFiltroSede();
                cargarFiltroSala();
                LlenarDropDownListHoras();
                //stopwatch.Start();
                //stopwatch.Stop();
                //lblFechaFiltro.Text = stopwatch.ElapsedMilliseconds.ToString() + "ms";

                GenerarHoras();
                lbBuscar_Click(sender, new EventArgs());
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                if (target == lbModificar.ClientID)
                {
                    ProcesarEventoModificar();
                }
            }
        }

        protected void cargarInformacionDeFunciones()
        {
            peliculas = new BindingList<pelicula>(daoPelicula.listarTodosPelicula());
            sedes = new BindingList<sede>(daoSede.listarTodosSede());
            ViewState["Peliculas"] = peliculas;
            ViewState["Sedes"] = sedes;
        }

        private void LlenarDropDownListHoras()
        {
            DateTime startTime = DateTime.Today.AddHours(11);
            DateTime endTime = DateTime.Today.AddHours(22);  
            TimeSpan interval = TimeSpan.FromMinutes(15);

            ddlHoraInicio.Items.Clear();
            ddlHoraInicio.Items.Add(new ListItem("Seleccione un valor", ""));

            for (DateTime time = startTime; time <= endTime; time += interval)
            {
                string timeText = time.ToString("HH:mm");
                ddlHoraInicio.Items.Add(new ListItem(timeText, timeText));
            }
        }
        private void cargarFiltroSede()
        {
            ddlSede.DataSource = ViewState["Sedes"] as BindingList<sede>;
            ddlSede.DataTextField = "universidad";
            ddlSede.DataValueField = "idSede";
            ddlSede.DataBind();
        }

        private void cargarFiltroSala()
        {
            int idSede = Int32.Parse(ddlSede.SelectedValue);
            ddlSala.DataSource = daoSala.salasXIdsede(idSede);
            ddlSala.DataTextField = "numeroSala";
            ddlSala.DataValueField = "idSala";
            ddlSala.DataBind();
        }

        protected void ddlSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarFiltroSala();
        }
        protected void ddlPelicula_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarDropDownListHoras();
            txtHoraFin.Text = string.Empty;
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            funciones = ViewState["Funciones"] as BindingList<funcion>;
            funcion funcion = ViewState["Funcion"] as funcion;
            int idFuncion = (funciones.SingleOrDefault(f=> f.horarioInicio.TimeOfDay == funcion.horarioInicio.TimeOfDay)).idFuncion;

            daoFuncion.eliminarFuncion(idFuncion);
            Response.Redirect(Request.RawUrl);
        }

        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            cargarPeliculas();
            lbEliminar.Visible = false;
            lbConfirmar.Text = "Confirmar";
            lbConfirmar.CssClass = "btn btn-purple";
            modalTitle.InnerText = "Agregar Nueva Función";
            estado = Estado.Nuevo;
            Session["Estado"] = estado;
            string script = "showModalFormAgregarNuevaFuncion();";
            ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormProducto", script, true);
        }
        protected void ProcesarEventoModificar()
        {
            string argument = Request["__EVENTARGUMENT"]; // Captura el argumento (hora de inicio)
            DateTime horarioInicioFuncion;

            if (DateTime.TryParse(argument, out horarioInicioFuncion))
            {
                funciones = ViewState["Funciones"] as BindingList<funcion>;
                var funcion = funciones.SingleOrDefault(f => f.horarioInicio == horarioInicioFuncion);

                if (funcion != null)
                {
                    lbEliminar.Visible = true;
                    lbConfirmar.Text = "Modificar";
                    lbConfirmar.CssClass = "btn btn-warning";
                    cargarPeliculas();
                    ddlPelicula.SelectedValue = funcion.pelicula.idPelicula.ToString();
                    ddlHoraInicio.SelectedValue = funcion.horarioInicio.ToString("HH:mm");
                    txtHoraFin.Text = funcion.horarioFin.ToString("HH:mm");

                    modalTitle.InnerText = "Modificar Función";
                    estado = Estado.Modificar;
                    ViewState["Funcion"] = funcion;
                    Session["Estado"] = estado;

                    string script = "showModalFormAgregarNuevaFuncion();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormProducto", script, true);
                }
            }
        }

        private void cargarPeliculas()
        {
            ddlPelicula.DataSource = ViewState["Peliculas"] as BindingList<pelicula>;
            ddlPelicula.DataTextField = "titulo";
            ddlPelicula.DataValueField = "idPelicula";
            ddlPelicula.DataBind();
        }

        protected void lbConfirmar_Click(object sender, EventArgs e)
        {
            BindingList<butacaFuncion> butacasFuncion = new BindingList<butacaFuncion>();
            ButacaWSClient daoButaca = new ButacaWSClient();
            BindingList<butaca> butacas;
            funcion funcion = new funcion();
            int resultado = 0;

            estado = (Estado)Session["Estado"];

            funcion.dia = DateTime.Parse(dtpFechaFiltro.Value);
            funcion.diaSpecified = true;
            if (TimeSpan.TryParse(ddlHoraInicio.SelectedValue, out TimeSpan horaInicio))
            {
                funcion.horarioInicio = funcion.dia.Date.Add(horaInicio);
                funcion.horarioInicioSpecified = true;
            }

            if (TimeSpan.TryParse(txtHoraFin.Text, out TimeSpan horaFin))
            {
                funcion.horarioFin = funcion.dia.Date.Add(horaFin);
                funcion.horarioFinSpecified = true;
            }

            funcion.sala = new sala();
            funcion.sala.idSala = Int32.Parse(ddlSala.SelectedValue);

            if (!validacionesFuncion(funcion))
            {
                return;
            }

            funcion.pelicula = new pelicula();
            funcion.pelicula.idPelicula = Int32.Parse(ddlPelicula.SelectedValue);
            if (estado == Estado.Nuevo)
            {
                butacas = new BindingList<butaca>(daoButaca.listarButacasXSala(funcion.sala.idSala));
                foreach (butaca butaca in butacas)
                {
                    butacaFuncion butacaFuncion = new butacaFuncion();
                    butacaFuncion.idButaca = butaca.idButaca;
                    butacaFuncion.estado = estadoButaca.DISPONIBLE;
                    butacaFuncion.estadoSpecified = true;
                    butacaFuncion.precio = 20;
                    butacasFuncion.Add(butacaFuncion);
                }
                funcion.butacasFuncion = new BindingList<butacaFuncion>(butacasFuncion).ToArray();
                resultado = daoFuncion.insertarFuncion(funcion);
            }
            else if (estado == Estado.Modificar)
            {
                resultado = daoFuncion.modificarFuncion(funcion);
            }

            if (resultado > 0)
            {
                lbBuscar_Click(sender, e);

                ddlPelicula.SelectedIndex = 0;
                ddlHoraInicio.SelectedIndex=0;
                txtHoraFin.Text = string.Empty;

                cerrarFormAgregar();
            }
        }

        private bool validacionesFuncion(funcion funcion)
        {
            funciones = ViewState["Funciones"] as BindingList<funcion>;
            string script;

            if (string.IsNullOrEmpty(dtpFechaFiltro.Value))
            {
                cerrarFormAgregar();
                lblMensajeError.Text = "Debe ingresar una fecha";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return false;
            }

            if (string.IsNullOrEmpty(ddlHoraInicio.SelectedValue))
            {
                cerrarFormAgregar();
                lblMensajeError.Text = "Debe seleccionar una hora de inicio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return false;
            }

            if (DateTime.Parse(dtpFechaFiltro.Value) < DateTime.Now.Date)
            {
                cerrarFormAgregar();
                lblMensajeError.Text = "No puede agregar una función a días anteriores a hoy";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return false;
            }

            if (estado == Estado.Nuevo)
            {
                funcion fDisponibilidad = funciones.FirstOrDefault(f => funcion.horarioInicio.TimeOfDay < f.horarioFin.TimeOfDay &&
                                                        funcion.horarioFin.TimeOfDay > f.horarioInicio.TimeOfDay);
                if (fDisponibilidad != null)
                {
                    cerrarFormAgregar();
                    lblMensajeError.Text = "El horario de la funcion no está disponible, inserte otro";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                    return false;
                }
            }else if (estado == Estado.Modificar)
            {
                funcion.idFuncion = (ViewState["Funcion"] as funcion).idFuncion;
                funcion fDisponibilidad = funciones.FirstOrDefault(f => funcion.horarioInicio.TimeOfDay < f.horarioFin.TimeOfDay &&
                                                        funcion.horarioFin.TimeOfDay > f.horarioInicio.TimeOfDay && funcion.idFuncion != f.idFuncion);

                if (fDisponibilidad != null)
                {
                    cerrarFormAgregar();
                    lblMensajeError.Text = "El horario de la funcion no está disponible, inserte otro";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                    return false;
                }   
            }

            return true;
        }

        private void cerrarFormAgregar()
        {
            upAgregarFuncion.Update();
            string scriptCerrar = "hideModalFormAgregarNuevaFuncion();";
            ScriptManager.RegisterStartupScript(this, GetType(), "HideModalFormAgregarNuevaFuncion", scriptCerrar, true);
        }

        protected void ddlHoraInicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            peliculas = ViewState["Peliculas"] as BindingList<pelicula>;
            pelicula = peliculas.SingleOrDefault(p => p.idPelicula == Int32.Parse(ddlPelicula.SelectedValue));

            if (TimeSpan.TryParse(ddlHoraInicio.SelectedValue, out TimeSpan horaInicio) && pelicula != null)
            {
                int tiempoPelicula = pelicula.duracion;
                int residuo = tiempoPelicula % 15;
                if (residuo != 0)
                {
                    tiempoPelicula = tiempoPelicula - residuo + 15;
                }
                TimeSpan horaFin = horaInicio.Add(new TimeSpan(0, 30, 0)).Add(TimeSpan.FromMinutes(tiempoPelicula)); ;
                txtHoraFin.Text = horaFin.ToString(@"hh\:mm");
            }
            else
            {
                txtHoraFin.Text = string.Empty;
            }
        }

        protected void lbBuscar_Click(object sender, EventArgs e)
        {

            DateTime fechaFiltro = DateTime.Parse(dtpFechaFiltro.Value);
            int idSala = Int32.Parse(ddlSala.SelectedValue);
            GenerarReservas(fechaFiltro, idSala);
        }

        protected void GenerarReservas(DateTime fechaFiltro, int idSala)
        {
            var listaFunciones = daoFuncion.listarFuncionesPorFechaPorSala(fechaFiltro, idSala)?.ToList();
            if (listaFunciones == null)
            {
                listaFunciones = new List<funcion>();
            }
            ViewState["Funciones"] = new BindingList<funcion>(listaFunciones);
            funciones = new BindingList<funcion>(listaFunciones);
            string htmlContent = "";

            DateTime startTime = DateTime.Today.AddHours(11);
            DateTime endTime = DateTime.Today.AddHours(24);
            DateTime currentTime = startTime;

            int bloquesSinFuncion = 0;
            List<string> bloquesHtml = new List<string>();

            while (currentTime < endTime)
            {
                var funcionActual = funciones.FirstOrDefault(f =>
                    (f.horarioInicio.TimeOfDay <= currentTime.TimeOfDay && f.horarioFin.TimeOfDay > currentTime.TimeOfDay) ||
                    (f.horarioInicio.TimeOfDay <= currentTime.TimeOfDay && f.horarioFin.TimeOfDay < f.horarioInicio.TimeOfDay) ||
                    (f.horarioInicio.TimeOfDay > currentTime.TimeOfDay && f.horarioFin.TimeOfDay < f.horarioInicio.TimeOfDay && currentTime.TimeOfDay < f.horarioFin.TimeOfDay)
                );

                if (funcionActual != null)
                {
                    if (bloquesSinFuncion > 0)
                    {
                        int heightSinFuncion = bloquesSinFuncion * 20;
                        bloquesHtml.Add($"<div class='sin-reserva centered-text' style='height:{heightSinFuncion}px;'>Sin funciones</div>");
                        bloquesSinFuncion = 0;
                    }

                    // Calcular la duración de la función en minutos
                    int duracionFuncionMinutos;
                    if (funcionActual.horarioFin.TimeOfDay > funcionActual.horarioInicio.TimeOfDay)
                    {
                        // Caso normal (sin cruce de medianoche)
                        duracionFuncionMinutos = (int)(funcionActual.horarioFin.TimeOfDay - currentTime.TimeOfDay).TotalMinutes;
                    }
                    else
                    {
                        // Caso en el que la función cruza la medianoche
                        duracionFuncionMinutos = 1440-(int)(currentTime.TimeOfDay).TotalMinutes;
                    }

                    // Convertir la duración en bloques de 15 minutos
                    int bloquesFuncion = (int)Math.Ceiling(duracionFuncionMinutos / 15.0);
                    int heightFuncion = bloquesFuncion * 20;

                    string funcionDateTime = funcionActual.horarioInicio.ToString("yyyy-MM-dd HH:mm");
                    string postBackScript = $"javascript:__doPostBack('{lbModificar.ClientID}', '{funcionDateTime}')";

                    bloquesHtml.Add($@"
                        <div class='reservation-bar centered-text' style='height:{heightFuncion}px; cursor:pointer;' onclick=""{postBackScript}"">
                            {funcionActual.pelicula.titulo} : {funcionActual.horarioInicio:HH:mm} - {funcionActual.horarioFin:HH:mm}
                        </div>");

                    // Avanzar `currentTime` hasta el final del bloque de función
                    currentTime = currentTime.AddMinutes(bloquesFuncion * 15);
                }
                else
                {
                    bloquesSinFuncion++;
                    currentTime = currentTime.AddMinutes(15);
                }
            }

            if (bloquesSinFuncion > 0)
            {
                int heightSinFuncion = bloquesSinFuncion * 20;
                bloquesHtml.Add($"<div class='sin-reserva centered-text' style='height:{heightSinFuncion}px;'>Sin reservas</div>");
            }

            htmlContent = string.Join("", bloquesHtml);
            tblReservasBody.InnerHtml = $"<tr><td class='reservation-cell'>{htmlContent}</td></tr>";
        }


        private void GenerarHoras()
        {
            DateTime startTime = DateTime.Today.AddHours(11);
            DateTime endTime = DateTime.Today.AddHours(24);

            string htmlContent = "";

            for (DateTime time = startTime; time < endTime; time = time.AddHours(1))
            {
                string horaTexto = $"{time:HH:mm} - {time.AddHours(1):HH:mm}";
                htmlContent += $"<tr><td class='hora-column'>{horaTexto}</td></tr>";
            }

            tblHorasBody.InnerHtml = htmlContent;
        }
    }
}
