using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Salas : System.Web.UI.Page
    {
        private SalaWSClient daoSala = new SalaWSClient();
        private SedeWSClient daoSede = new SedeWSClient();
        protected void Page_Init(object sender, EventArgs e)
        {
            string id= Request.QueryString["IdSele"];
            if(id!= null)
            {
                sede sede= new sede();
                sede=daoSede.obtenerPorIdSede(Int32.Parse(id));
                lblSedeNombre.Text = sede.universidad;
                lblUbicacion.Text = sede.ubicacion;
            }
        }
    }
}