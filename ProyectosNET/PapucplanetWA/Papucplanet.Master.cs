using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Papucplanet : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //cargamos el nombre arriba a la derecha
                usuario usuarioDatos = (usuario)Session["Usuario"];
                string usuario = usuarioDatos.nombre + " " + usuarioDatos.primerApellido;
                lblUserName.Text = usuario;
                // Detecta la página actual
                string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

                // Asigna la clase `active` al enlace correspondiente
                switch (currentPage)
                {
                    case "Sedes.aspx":
                        sedesLink.Attributes["class"] += " active";
                        break;
                    case "Salas.aspx":
                        sedesLink.Attributes["class"] += " active";
                        break;
                    case "Peliculas.aspx":
                        peliculasLink.Attributes["class"] += " active";
                        break;
                    case "AgregarNuevaPelicula.aspx":
                        peliculasLink.Attributes["class"] += " active";
                        break;
                    case "Consumibles.aspx":
                        consumiblesLink.Attributes["class"] += " active";
                        break;
                    case "AgregarNuevoConsumible.aspx":
                        consumiblesLink.Attributes["class"] += " active";
                        break;
                    case "Boletas.aspx":
                        boletasLink.Attributes["class"] += " active";
                        break;
                    case "Reportes.aspx":
                        reportesLink.Attributes["class"] += " active";
                        break;
                    case "Funciones.aspx":
                        funcionesLink.Attributes["class"] += " active";
                        break;
                }
            }
        }

        public void SetTituloPagina(string titulo)
        {
            lblPagina.Text = titulo;
        }
    }
}