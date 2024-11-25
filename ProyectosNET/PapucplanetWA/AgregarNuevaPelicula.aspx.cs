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
            Papucplanet masterPage = (Papucplanet)Master;

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
                txtDuracion.Text = pelicula.duracion.ToString();
                txtNombrePelicula.Text = pelicula.titulo;
                txtSinopsis.Value = pelicula.sinopsis;
                ddlGenero.SelectedValue = pelicula.genero.ToString();
                estado = Estado.Modificar;
                if (masterPage != null)
                {
                    masterPage.SetTituloPagina("Todas las películas / Modificar Película");
                }
            }
            else if(accion == null)
            {
                pelicula = new pelicula();
                estado = Estado.Nuevo;
                Cargar_Foto(sender, e);
                if (masterPage != null)
                {
                    masterPage.SetTituloPagina("Todas las películas / Agregar Nueva Película");
                }
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
            if (txtNombrePelicula.Text.Length > 80)
            {
                lblMensajeError.Text = "El nombre de la película no puede tener más de 80 caracteres.";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtNombrePelicula.Text, @"^(?=.*[A-Za-zÁÉÍÓÚáéíóúÑñ])[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s.,;:'""!?¿()\-…/¡]+$"))
            {
                lblMensajeError.Text = "El nombre de la película contiene caracteres no permitidos.";
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
                lblMensajeError.Text = "La duracion de la pelicula debe ser un número entero";
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
            if (txtSinopsis.Value.Length > 1500)
            {
                lblMensajeError.Text = "La sinopsis no puede tener más de 1500 caracteres.";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (!Regex.IsMatch(txtSinopsis.Value, @"^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s.,;:'""!?¿()\-…\[\]{}¡]+(\r?\n)*$"))
            {
                lblMensajeError.Text = "La sinopsis contiene caracteres no permitidos. Solo se aceptan letras (con tildes), números, espacios, y signos de puntuación comunes.";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            if (imgImagenPromocional.ImageUrl.Equals("/Images/placeholder.jpg"))
            {
                lblMensajeError.Text = "Debe subir una imagen promocional";
                string script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalFormError", script, true);
                return;
            }
            pelicula.titulo = txtNombrePelicula.Text;
            pelicula.duracion = Int32.Parse(txtDuracion.Text);
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