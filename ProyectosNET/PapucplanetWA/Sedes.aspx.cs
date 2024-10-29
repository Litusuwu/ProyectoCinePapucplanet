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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSedes();
            }
        }

        private void CargarSedes()
        {
            sedes.DataSource = daoSede.listarTodos();
            sedes.DataBind();
        }

        protected void btnAddClienteClick(object sender, EventArgs e)
        {
            string script = "window.onload = function() " + "{showModalFormSedeAdd()};";
            ClientScript.RegisterStartupScript(GetType(),"",script,true);
        }

        protected void lbGuardar_Click(object sender, EventArgs e)
        {
            sede sede = new sede();
            sede.universidad = txtNombreSede.Text;
            sede.ubicacion = txtUbicacionSede.Text;
            int resultado = daoSede.insertarSede(sede);
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
    }
}