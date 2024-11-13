using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Salas : System.Web.UI.Page
    {
        private SalaWSClient daoSala = new SalaWSClient();
        private SedeWSClient daoSede = new SedeWSClient();
        private int idSede;
        protected void Page_Init(object sender, EventArgs e)
        {

            string id= Request.QueryString["IdSele"];
            idSede = Int32.Parse(id);
            if(id!= null)
            {
                sede sede= new sede();
                sede=daoSede.obtenerPorIdSede(idSede);
                lblSedeNombre.Text = sede.universidad;
                lblUbicacion.Text = sede.ubicacion;

                gvSalas.DataSource = daoSala.salasXIdsede(idSede);
                gvSalas.DataBind();

                if (!IsPostBack)
                {
                    Papucplanet masterPage = (Papucplanet)Master;
                    if (masterPage != null)
                    {
                        masterPage.SetTituloPagina("Todas las sedes / Sede " + sede.universidad);
                    }
                }
            }
        }

        protected void btnAddSala_Click(object sender, EventArgs e)
        {
            string script = "showModalFormSalaAdd();";
            ScriptManager.RegisterStartupScript(this,GetType(),"showModalFormSalaAdd", script, true);
        }

        protected void lbGuardar_ClickAdd(object sender, EventArgs e)
        {
            string script = "hideModalFormSedeAdd();";
            ScriptManager.RegisterStartupScript(this, GetType(), "hideModalFormSedeAdd", script, true);
            if (txtNumSala.Text == "" && txtNumCol.Text == "" && txtNumSala.Text=="" && txtCapacidad.Text=="")
            {
                lblMensajeError.Text = "Todos los campos estan vacios";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNumSala.Text, @"^\d+$"))
            {
                lblMensajeError.Text = "El numero de sala no contiene caracteres numericos";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNumCol.Text, @"^\d+$"))
            {
                lblMensajeError.Text = "El numero de columnas no contiene caracteres numericos";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNumFilas.Text, @"^\d+$"))
            {
                lblMensajeError.Text = "El numero de filas no contiene caracteres numericos";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtCapacidad.Text, @"^\d+$"))
            {
                lblMensajeError.Text = "La capacidad no contiene caracteres numericos";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            sala sala = new sala();
            sala.numeroSala = Int32.Parse(txtNumSala.Text);
            sala.capacidad = Int32.Parse(txtCapacidad.Text);
            sala.numCol= Int32.Parse(txtNumCol.Text);
            sala.numFila = Int32.Parse(txtNumFilas.Text);
            sede sede = new sede();
            sede.idSede = idSede;
            sala.sede = sede;
            int resultado= daoSala.insertarSala(sala);
            if(resultado != 0)
            {
                Response.Redirect("Salas.aspx?IdSele=" + idSede.ToString());
            }

        }

        protected void gvSalas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalas.PageIndex = e.NewPageIndex;
            gvSalas.DataBind();
        }

        protected void gvSalas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = DataBinder.Eval(e.Row.DataItem, "numeroSala").ToString();
                e.Row.Cells[1].Text = DataBinder.Eval(e.Row.DataItem, "numCol").ToString();
                e.Row.Cells[2].Text = DataBinder.Eval(e.Row.DataItem, "numFila").ToString();
                e.Row.Cells[3].Text = DataBinder.Eval(e.Row.DataItem, "capacidad").ToString();
            }
        }

        protected void btnDeleteSala_Click(object sender, EventArgs e)
        {
            int idSala = Int32.Parse(((LinkButton)sender).CommandArgument);
            int resultado=daoSala.eliminarSala(idSala);
            if(resultado != 0)
            {
                Response.Redirect("Salas.aspx?IdSele=" + idSede.ToString());
            }
            
        }
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
        }
    }
}