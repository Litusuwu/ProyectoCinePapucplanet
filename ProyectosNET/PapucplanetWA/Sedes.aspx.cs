using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
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
            string script = "window.onload = function() " + "{showModalFormSedeAdd()};";
            ClientScript.RegisterStartupScript(GetType(),"",script,true);
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

            string script = "window.onload = function() " + "{showModalFormSedeMod()};";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);

        }

        protected void lbGuardar_Click(object sender, EventArgs e)
        {
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
            daoSede.eliminarSede(idSede);
            Response.Redirect("Sedes.aspx");
        }

        protected void lbSalasXSede_Click(object sender, EventArgs e)
        {
            int idSede = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("Salas.aspx?IdSele=" + idSede);
        }

    }
}