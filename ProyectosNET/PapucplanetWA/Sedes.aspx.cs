using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Sedes : System.Web.UI.Page
    {
        private SedeWSClient daoSede = new SedeWSClient();
        private int idSede;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSedes();
            }
        }

        private void CargarSedes()
        {
            sedes.DataSource = daoSede.listarTodosSede();
            sedes.DataBind();
        }

        protected void btnAddClienteClick(object sender, EventArgs e)
            {
            string script = "showModalFormSedeAdd();";
            ScriptManager.RegisterStartupScript(this,GetType(),"ShowModalFormSedeAdd",script,true);
        }

        protected void lbModificar_Click(object sender, EventArgs e)
        {

            int idenSede = Int32.Parse(((LinkButton)sender).CommandArgument);

            sede sede = daoSede.obtenerPorIdSede(idenSede);
            idSede = sede.idSede;
            Session["Id"] = idSede;
            if (sede != null)
            {
                txtNombreSedeMod.Text = sede.universidad;
                txtUbicacionSedeMod.Text = sede.ubicacion;
            }

            string script = "showModalFormSedeMod();";
            ScriptManager.RegisterStartupScript(this,GetType(), "showModalFormSedeMod", script, true);

        }

        protected void lbGuardar_Click(object sender, EventArgs e)
        {
            string script = "hideModalFormSedeAdd();";
            ScriptManager.RegisterStartupScript(this, GetType(), "hideModalFormSedeAdd", script, true);
            if (txtNombreSede.Text == "" && txtUbicacionSede.Text == "")
            {
                lblMensajeError.Text = "Nombre de sede y ubicacion vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtNombreSede.Text == "")
            {
                lblMensajeError.Text = "Nombre de sede vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtUbicacionSede.Text == "")
            {
                lblMensajeError.Text = "Ubicacion de sede vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNombreSede.Text, @"^[A-Za-z\s]+$"))
            {
                lblMensajeError.Text = "Nombre de la sede contiene números o caracteres especiales.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtUbicacionSede.Text, @"^(?=.*[A-Za-z])[A-Za-z0-9\s.]+$"))
            {
                lblMensajeError.Text = "Ubicacion de la sede contiene caracteres especiales no permitdos.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            sede sede = new sede();
            int resultado=0;
            sede.universidad = txtNombreSede.Text;
            sede.ubicacion = txtUbicacionSede.Text;
            resultado = daoSede.insertarSede(sede);
            if (resultado != 0)
            {
                Response.Redirect("Sedes.aspx");
            }
        }

        protected void lbGuardar_ClickMod(object sender, EventArgs e)
        {
            string script = "hideModalFormSedeMod();";
            ScriptManager.RegisterStartupScript(this, GetType(), "hideModalFormSedeMod", script, true);
            if (txtNombreSedeMod.Text == "" && txtUbicacionSedeMod.Text == "")
            {
                lblMensajeError.Text = "Nombre de sede y ubicacion vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtNombreSedeMod.Text == "")
            {
                lblMensajeError.Text = "Nombre de sede vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtUbicacionSedeMod.Text == "")
            {
                lblMensajeError.Text = "Ubicacion de sede vacio";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNombreSedeMod.Text, @"^[A-Za-z\s]+$"))
            {
                lblMensajeError.Text = "Nombre de la sede contiene números o caracteres especiales.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtUbicacionSedeMod.Text, @"^(?=.*[A-Za-z])[A-Za-z0-9\s.]+$"))
            {
                lblMensajeError.Text = "Ubicacion de la sede contiene caracteres especiales no permitdos.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            sede sede = new sede();
            int resultado = 0;
            sede.idSede = (int) Session["Id"];
            sede.universidad = txtNombreSedeMod.Text;
            sede.ubicacion = txtUbicacionSedeMod.Text;
            resultado = daoSede.modificarSede(sede);
            if (resultado != 0)
            {
                Response.Redirect("Sedes.aspx");
            }
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            int idSede = Int32.Parse(((LinkButton)sender).CommandArgument);
            int resultado=daoSede.eliminarSede(idSede);
            if(resultado!=0){
                Response.Redirect("Sedes.aspx");
            }
        }
        protected void lbSalasXSede_Click(object sender, EventArgs e)
        {
            int idSede = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("Salas.aspx?IdSele=" + idSede);
        }

    }
}