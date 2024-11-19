using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Reportes : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        private BindingList<pelicula> peliculas;
        
        private SedeWSClient daoSede;
        private BindingList<sede> sedes;
        
        protected void Page_Init(object sender, EventArgs e)
        {
            daoPelicula = new PeliculaWSClient();
            daoSede = new SedeWSClient();

            peliculas = new BindingList<pelicula>();
            sedes = new BindingList<sede>();
            //BindingList<string> titulosPeliculas = new BindingList<string>();
            //BindingList<string> nombresSedes = new BindingList<string>();
            //titulosPeliculas.Add("None");
            //nombresSedes.Add("None");
            pelicula nulap = new pelicula();
            nulap.idPelicula = 0;
            nulap.titulo = "None";
            peliculas.Add(nulap);
            pelicula[] arrP = daoPelicula.listarTodosPelicula();
            foreach (pelicula p in arrP)
            {
                peliculas.Add(p);
            }
            sede nulas = new sede();
            nulas.idSede = 0;
            nulas.universidad = "None";
            sedes.Add(nulas);
            sede[] arrS = daoSede.listarTodosSede();
            foreach (sede s in arrS)
            {
                sedes.Add(s);
            }
            if (!IsPostBack)
            {
                ddlTituloPelicula.DataSource = peliculas;
                ddlTituloPelicula.DataTextField = "titulo";
                ddlTituloPelicula.DataValueField = "idPelicula";
                ddlTituloPelicula.DataBind();

                ddlNombreSede.DataSource = sedes;
                ddlNombreSede.DataTextField = "universidad";
                ddlNombreSede.DataValueField = "idSede";
                ddlNombreSede.DataBind();
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
            if (!IsPostBack)
            {
                ddlNombreSede.SelectedValue = "None";
                ddlTituloPelicula.SelectedValue = "None";
                if (string.IsNullOrEmpty(dtpFechaFin.Value))
                {
                    dtpFechaFin.Value = DateTime.Now.ToString("yyyy-MM-dd");
                }
                if (string.IsNullOrEmpty(dtpFechaInicio.Value))
                {
                    dtpFechaInicio.Value = DateTime.Now.ToString("yyyy-MM-dd");
                }
                Papucplanet masterPage = (Papucplanet)Master;
                if (masterPage != null)
                {
                    masterPage.SetTituloPagina("Seleccionar reporte");
                }
            }
            
            Session["Excepcion"] = "No"; //No
        }
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void lbGenerarReporte_Click(object sender, EventArgs e)
        {
            //Session["Excepcion"] = "No"; //No
            string script = "";
            if (!rbPelicula.Checked && !rbSede.Checked)
            {
                lblMensajeError.Text = "Debe seleccionar uno de los 2 filtros.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            if (rbPelicula.Checked) //Pelicula
            {
                if(ddlTituloPelicula.SelectedValue == "0")
                {
                    lblMensajeError.Text = "Debe seleccionar una pelicula.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
            }
            else //Sede
            {
                if (ddlNombreSede.SelectedValue == "0")
                {
                    lblMensajeError.Text = "Debe seleccionar una sede.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (string.IsNullOrEmpty(dtpFechaInicio.Value))
                {
                    lblMensajeError.Text = "No debe dejar la fecha de inicio vacia";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (string.IsNullOrEmpty(dtpFechaFin.Value))
                {
                    lblMensajeError.Text = "No debe dejar la fecha de fin vacia";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }

                if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date || DateTime.Parse(dtpFechaInicio.Value) > DateTime.Now.Date)
                {
                    lblMensajeError.Text = "Las fechas ingresadas deben ser previas a la fecha actual " + DateTime.Now.Date.ToString("yyyy-MM-dd");
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (DateTime.Parse(dtpFechaInicio.Value) > DateTime.Parse(dtpFechaFin.Value))
                {
                    lblMensajeError.Text = "Las fecha de inicio debe ser menor a la fecha fin";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
            }
            //if (Session["Excepcion"].ToString() == "No"){}
            //Si estaba en Si, sacar de Session todas las variables guardadas
            System.Console.WriteLine("Imprime Reporte...");
            
        }
        protected void lbAceptar_Click(object sender, EventArgs e)
        {
            Session["Excepcion"] = "Si"; //Si
            lbGenerarReporte_Click( sender, e);
        }
        protected void ddlSeleccion_Pelicula(object sender, EventArgs e)
        {
            if(ddlTituloPelicula.SelectedValue != "0")
            {
                ddlNombreSede.SelectedValue = "0";
                dtpFechaInicio.Value = DateTime.Now.ToString("yyyy-MM-dd");
                dtpFechaFin.Value = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
        protected void ddlSeleccion_Sede(object sender, EventArgs e)
        {
            if (ddlNombreSede.SelectedValue != "0")
            {
                ddlTituloPelicula.SelectedValue = "0";
            }
        }

        
    }
}