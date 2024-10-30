using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class AgregarNuevaPelicula : System.Web.UI.Page
    {
        private PeliculaWSClient daoPelicula;
        private pelicula pelicula;
        private Estado estado;
        protected void Page_Init(object sender, EventArgs e)
        {
            lblTitulo.Text = "Datos de la Película";
            string idPelicula = Request.QueryString["idPelicula"];
            string accion = Request.QueryString["accion"];

            daoPelicula = new PeliculaWSClient();
            BindingList<genero> generos;
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
        protected void lbRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Peliculas.aspx");
        }

        protected void lbGuardar_Click(object sender, EventArgs e)
        {

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
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadImagenPromocional.SaveAs(Server.MapPath("~/Uploads/") + filename);

                    imgImagenPromocional.ImageUrl = "~/Uploads/" + filename;
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