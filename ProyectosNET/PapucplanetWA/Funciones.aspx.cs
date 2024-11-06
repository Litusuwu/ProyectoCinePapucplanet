﻿using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Funciones : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        private SalaWSClient daoSala;
        private SedeWSClient daoSede;
        private FuncionWSClient daoFuncion = new FuncionWSClient();
        private pelicula pelicula;
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
            string idPelicula = Request.QueryString["idPelicula"];
            daoPelicula = new PeliculaWSClient();
            daoSala = new SalaWSClient();
            daoSede = new SedeWSClient();

            if (idPelicula != null)
            {
                if (!IsPostBack)
                {
                    if (string.IsNullOrEmpty(dtpFiltrarFecha.Value))
                    {
                        dtpFiltrarFecha.Value = DateTime.Now.ToString("yyyy-MM-dd");
                    }
                }
                pelicula = daoPelicula.obtenerPorIdPelicula(Int32.Parse(idPelicula));
                string imageUrl = pelicula.imagenPromocional;
                imgPosterPromocional.ImageUrl = imageUrl;
                lblSinopsis.Text = pelicula.sinopsis;
                lblTituloPelicula.Text = pelicula.titulo;

                gvFunciones.DataSource = daoFuncion.listarFuncionesPorFecha(DateTime.Parse(dtpFiltrarFecha.Value));
                gvFunciones.DataBind();
            }
        }

        private void CargarSalasPorSede(int sedeId)
        {
            ddlSala.DataSource = daoSala.salasXIdsede(sedeId);
            ddlSala.DataTextField = "numeroSala";
            ddlSala.DataValueField = "idSala";
            ddlSala.DataBind();
        }

        protected void ddlSede_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sedeId = Int32.Parse(ddlSede.SelectedValue);
            CargarSalasPorSede(sedeId);
        }

        protected void gvFunciones_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = ((sala)DataBinder.Eval(e.Row.DataItem, "sala")).sede.universidad;
                e.Row.Cells[1].Text = ((sala)DataBinder.Eval(e.Row.DataItem, "sala")).numeroSala.ToString();
                e.Row.Cells[2].Text = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "dia")).ToString("dd-MM-yyyy");
                e.Row.Cells[3].Text = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "horarioInicio")).ToString("HH:mm");
                e.Row.Cells[4].Text = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "horarioFin")).ToString("HH:mm");
            }
        }

        protected void lbButacas_Click(object sender, EventArgs e)
        {

        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            int idFuncion = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoFuncion.eliminarFuncion(idFuncion);
            Response.Redirect(Request.RawUrl);
        }

        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            ddlSede.DataSource = daoSede.listarTodosSede();
            ddlSede.DataTextField = "universidad";
            ddlSede.DataValueField = "idSede";
            ddlSede.DataBind();
            CargarSalasPorSede(Int32.Parse(ddlSede.SelectedValue));

            modalTitle.InnerText = "Agregar Nueva Función";
            estado = Estado.Nuevo;
            Session["Estado"] = estado;
            string script = "showModalFormAgregarNuevaFuncion();";
            ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormProducto", script, true);
        }
        protected void lbModificar_Click(object sender, EventArgs e)
        {
            int idFuncion = Int32.Parse(((LinkButton)sender).CommandArgument);
            funcion funcion = daoFuncion.obtenerPorIdFuncion(idFuncion);

            ddlSede.DataSource = daoSede.listarTodosSede();
            ddlSede.DataTextField = "universidad";
            ddlSede.DataValueField = "idSede";
            ddlSede.DataBind();
            ddlSede.SelectedValue = funcion.sala.sede.idSede.ToString();
            dtpFecha.Value = funcion.dia.ToString("yyyy-MM-dd");
            tmHoraInicio.Text = funcion.horarioInicio.ToString("HH:mm");
            txtHoraFin.Text = funcion.horarioFin.ToString("HH:mm");

            CargarSalasPorSede(Int32.Parse(ddlSede.SelectedValue));
            ddlSala.SelectedValue = funcion.sala.idSala.ToString();

            modalTitle.InnerText = "Modificar Función";
            estado = Estado.Modificar;
            Session["Funcion"] = funcion;
            Session["Estado"] = estado;
            string script = "showModalFormAgregarNuevaFuncion();";
            ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormProducto", script, true);
        }

        protected void lbConfirmar_Click(object sender, EventArgs e)
        {
            BindingList<butacaFuncion> butacasFuncion = new BindingList<butacaFuncion>();
            BindingList<butaca> butacas = new BindingList<butaca>();
            ButacaWSClient daoButaca = new ButacaWSClient();
            ButacaFuncionWSClient daoButacaFuncion = new ButacaFuncionWSClient();
            funcion funcion = new funcion();
            funcion funcionSession = new funcion();
            int resultado = 0;

            funcion.dia = DateTime.Parse(dtpFecha.Value);
            funcion.diaSpecified = true;
            if (TimeSpan.TryParse(tmHoraInicio.Text, out TimeSpan horaInicio))
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
            funcion.pelicula = new pelicula();
            funcion.pelicula.idPelicula = pelicula.idPelicula;

            estado = (Estado)Session["Estado"];
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
                funcionSession = ((funcion)Session["Funcion"]);
                funcion.idFuncion = funcionSession.idFuncion;
                if(funcionSession.sala.idSala == funcion.sala.idSala)
                    resultado = daoFuncion.modificarFuncion(funcion);
                else
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
                    resultado = daoFuncion.modificarFuncionConButacasFuncion(funcion);
                }
            }

            // Limpiar los valores del formulario
            ddlSede.SelectedIndex = 0;
            dtpFecha.Value = string.Empty;
            tmHoraInicio.Text = string.Empty;
            txtHoraFin.Text = string.Empty;

            upAgregarFuncion.Update();
            string script = "hideModalFormAgregarNuevaFuncion();";
            ScriptManager.RegisterStartupScript(this, GetType(), "HideModalFormAgregarNuevaFuncion", script, true);
        }

        protected void gvFunciones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFunciones.PageIndex = e.NewPageIndex;
            gvFunciones.DataBind();
        }

        protected void tmHoraInicio_TextChanged(object sender, EventArgs e)
        {
            if (TimeSpan.TryParse(tmHoraInicio.Text, out TimeSpan horaInicio))
            {
                TimeSpan horaFin = horaInicio.Add(new TimeSpan(0, 30, 0)).Add(TimeSpan.FromMinutes(pelicula.duracion));
                txtHoraFin.Text = horaFin.ToString(@"hh\:mm");
            }
            else
            {
                txtHoraFin.Text = string.Empty;
            }
        }

        protected void lbBuscar_Click(object sender, EventArgs e)
        {
            gvFunciones.DataSource = daoFuncion.listarFuncionesPorFecha(DateTime.Parse(dtpFiltrarFecha.Value));
            gvFunciones.DataBind();
        }
    }
}