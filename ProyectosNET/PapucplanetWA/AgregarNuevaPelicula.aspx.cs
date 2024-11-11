using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class AgregarNuevaPelicula : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        private pelicula pelicula;
        BindingList<genero> generos;
        private Estado estado;
        protected void Page_Init(object sender, EventArgs e)
        {
            string idPelicula = Request.QueryString["idPelicula"];
            string accion = Request.QueryString["accion"];

            daoPelicula = new PeliculaWSClient();

            if (!IsPostBack)
            {   
                generos = new BindingList<genero>(daoPelicula.listarGeneros());
                ddlGenero.DataSource = generos;
                ddlGenero.DataBind();
            }
      
            if (accion != null && accion == "modificar" && idPelicula != null)
            {
                pelicula = daoPelicula.obtenerPorIdPelicula(Int32.Parse(idPelicula));
                string imageUrl = pelicula.imagenPromocional;
                imgImagenPromocional.ImageUrl = imageUrl;
                txtDuracion.Text = pelicula.duracion.ToString("N2");
                txtNombrePelicula.Text = pelicula.titulo;
                txtSinopsis.Value = pelicula.sinopsis;
                ddlGenero.SelectedValue = pelicula.genero.ToString();
                estado = Estado.Modificar;
            }
            else if(accion == null)
            {
                pelicula = new pelicula();
                estado = Estado.Nuevo;
                Cargar_Foto(sender, e);
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
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Peliculas.aspx");
        }

        protected void lbGuardar_Click(object sender, EventArgs e)
        {
            if (txtNombrePelicula.Text == "")
            {
                lblMensajeError.Text = "No tiene titulo la pelicula";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNombrePelicula.Text, @"^(?=.*[A-Za-z])[A-Za-z0-9\s.]+$"))
            {
                lblMensajeError.Text = "Nombre de la pelicula contiene caracteres especiales no permitdos.";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtDuracion.Text == "")
            {
                lblMensajeError.Text = "La duración de la película es obligatoria";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtDuracion.Text, @"^\d+$"))
            {
                lblMensajeError.Text = "La duracion de la pelicula no contiene caracteres numericos";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (txtSinopsis.Value == "")
            {
                lblMensajeError.Text = "La sinopsis de la película es obligatoria";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtSinopsis.Value, @"^[A-Za-z0-9\s.,;]+$"))
            {
                lblMensajeError.Text = "La sinopsis solo puede contener caracteres alfanuméricos, espacios, '.' , ',' y ';'";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!fileUploadImagenPromocional.HasFile)
            {
                lblMensajeError.Text = "Debe subir una imagen promocional";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            pelicula.titulo = txtNombrePelicula.Text;
            pelicula.duracion = Double.Parse(txtDuracion.Text);
            pelicula.sinopsis = txtSinopsis.Value;
            pelicula.genero = (genero)Enum.Parse(typeof(genero), ddlGenero.SelectedValue.ToString());
            pelicula.generoSpecified = true;
            pelicula.imagenPromocional = imgImagenPromocional.ImageUrl;

            int resultado = 0;
          
            if (estado == Estado.Nuevo)
                resultado = daoPelicula.insertarPelicula(pelicula);
            else if (estado == Estado.Modificar)
                resultado = daoPelicula.modificarPelicula(pelicula);

            if (resultado != 0)
                Response.Redirect("Peliculas.aspx");

        }

        protected void Cargar_Foto(object sender, EventArgs e)
        {
            if (IsPostBack && fileUploadImagenPromocional.PostedFile != null && fileUploadImagenPromocional.HasFile)
            {
                string extension = System.IO.Path.GetExtension(fileUploadImagenPromocional.FileName);
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Images/Peliculas/") + filename;
                    fileUploadImagenPromocional.SaveAs(Server.MapPath("~/Images/Peliculas/") + filename);

                    imgImagenPromocional.ImageUrl = "~/Images/Peliculas/" + filename;
                    imgImagenPromocional.Visible = true;
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["foto"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
        }
    }
}