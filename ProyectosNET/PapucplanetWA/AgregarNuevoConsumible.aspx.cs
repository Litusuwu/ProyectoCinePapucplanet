using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class AgregarNuevoConsumible : System.Web.UI.Page
    {
        private AlimentoWSClient daoAlimento;
        private BebidaWSClient daoBebida;
        private consumible c;
        //private char tipo;
        private Estado estado;
        protected void Page_Init(object sender, EventArgs e)
        {
            string idConsumible = Request.QueryString["idConsumible"];
            string accion = Request.QueryString["accion"];
            daoAlimento = new AlimentoWSClient();
            daoBebida = new BebidaWSClient();
            BindingList<tipoAlimento> tiposAlimientos = new BindingList<tipoAlimento>();
            if (!IsPostBack)
            {
                tiposAlimientos.Add(tipoAlimento.SNACK);
                tiposAlimientos.Add(tipoAlimento.POSTRE);
                tiposAlimientos.Add(tipoAlimento.CANCHA);
                ddlTipoAlimento.DataSource = tiposAlimientos;
                ddlTipoAlimento.DataBind();
            }
            if (accion == null)
            {
                lblTitulo.Text = "Ingrese datos del Consumible";
                c = null;
                estado = Estado.Nuevo;
                //if (!IsPostBack) Session["c"] = null;
                Cargar_Foto(sender, e);
            }
            else if (accion == "modificar" && idConsumible != null)
            {
                lblTitulo.Text = "Modifique datos del Consumible";
                c = daoAlimento.obtenerPorIdAlimento(Int32.Parse(idConsumible));
                if(c.id == 0)
                    c = daoBebida.obtenerPorIdBebida(Int32.Parse(idConsumible));
                string imageUrl = c.imagenURL;
                imgImagenConsumible.ImageUrl = imageUrl;
                txtNombreConsumible.Text = c.nombre;
                txtPrecio.Text = c.precio.ToString();
                if (c.tipo.Equals('A')) //Tipo
                {
                    rbAlimento.Checked = true;
                    //rbHabilitarAlimentoNoBebida();
                    ddlTipoAlimento.SelectedValue = ((alimento)c).tipoAlimento.ToString();
                    txtPesoPromedio.Text = ((alimento)c).pesoPromedio.ToString();
                    rbBedida.Checked = false;
                    txtOnzas.Text = "";
                    rbTieneHielo.Checked = false;
                }
                else
                {
                    rbBedida.Checked = true;
                    //rbHabilitarBebidaNoAlimento();
                    txtOnzas.Text = ((bebida)c).onzas.ToString();
                    rbTieneHielo.Checked = ((bebida)c).tieneHielo;
                    
                    rbAlimento.Checked = false;
                    txtPesoPromedio.Text = "";
                    ddlTipoAlimento.SelectedValue = default;
                }
                estado = Estado.Modificar;
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
            Response.Redirect("Consumibles.aspx");
        }
        protected void lbGuardar_Click(object sender, EventArgs e)
        {
            if (rbAlimento.Checked)
            {
                c = new alimento();
                c.tipo = 'A';
                ((alimento)c).pesoPromedio = Double.Parse(txtPesoPromedio.Text);
                ((alimento)c).tipoAlimento = (tipoAlimento)Enum.Parse(typeof(tipoAlimento),ddlTipoAlimento.SelectedValue.ToString());
                ((alimento)c).tipoAlimentoSpecified = true;
            }
            else
            {
                c = new bebida();
                c.tipo = 'B';
                ((bebida)c).onzas = Int32.Parse(txtOnzas.Text);
                ((bebida)c).tieneHielo = rbTieneHielo.Checked;
            }
            //Session["c"] = c;
            c.imagenURL = imgImagenConsumible.ImageUrl;
            c.nombre = txtNombreConsumible.Text;
            c.precio = Double.Parse(txtPrecio.Text);
            c.activo = true;

            int resultado = 0;

            if (c.tipo.Equals('A'))
            {
                if (estado == Estado.Nuevo)
                {
                    resultado = daoAlimento.insertarAlimento((alimento)c);
                }
                else if (estado == Estado.Modificar)
                {
                    resultado = daoAlimento.actualizarAlimento((alimento)c);
                }
            }
            else
            {
                if (estado == Estado.Nuevo)
                {
                    resultado = daoBebida.insertarBebida((bebida)c);
                }
                else if (estado == Estado.Modificar)
                {
                    resultado = daoBebida.actualizarBebida((bebida)c);
                }
            }
            if (resultado != 0)
                Response.Redirect("Consumibles.aspx");
        }

        protected void Cargar_Foto(object sender, EventArgs e)
        {
            if (IsPostBack && fileUploadImagenConsumible.PostedFile != null && fileUploadImagenConsumible.HasFile)
            {
                string extension = System.IO.Path.GetExtension(fileUploadImagenConsumible.FileName);
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadImagenConsumible.SaveAs(Server.MapPath("~/Uploads/") + filename);

                    imgImagenConsumible.ImageUrl = "~/Uploads/" + filename;
                    imgImagenConsumible.Visible = true;
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
        protected void rbHabilitarAlimentoNoBebida()
        {
            txtPesoPromedio.Enabled = true;
            ddlTipoAlimento.Enabled = true;
            txtOnzas.Enabled = false;
            rbTieneHielo.Disabled = true;
        }
        protected void rbHabilitarBebidaNoAlimento()
        {
            txtPesoPromedio.Enabled = false;
            ddlTipoAlimento.Enabled = false;
            txtOnzas.Enabled = true;
            rbTieneHielo.Disabled = false;
        }

    }
}