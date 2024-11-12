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
            Session["tipo"] = "Nuevo";
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
                Session["idConsumible"] = c.id;
                Session["tipo"] = c.tipo.Equals('A')?"Alimento":"Bebida";
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
            string script;
            bool letras;
            if (rbAlimento.Checked)
            {
                c = new alimento();
                c.tipo = 'A';
                if (Session["tipo"].ToString() != "Alimento" && Session["tipo"].ToString() != "Nuevo")
                {
                    lblMensajeError.Text = "No debe cambiar el tipo de consumible Alimento";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (txtPesoPromedio.Text.Trim().Equals("")) //Validaciones Peso Promedio
                {
                    lblMensajeError.Text = "Debe ingresar Peso Promedio.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                letras = poseeCaracteresAlfabeticos(txtPesoPromedio.Text);
                if (letras)
                {
                    lblMensajeError.Text = "Debe ingresar solo numeros en Peso Promedio.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                ((alimento)c).pesoPromedio = Double.Parse(txtPesoPromedio.Text);
                ((alimento)c).tipoAlimento = (tipoAlimento)Enum.Parse(typeof(tipoAlimento),ddlTipoAlimento.SelectedValue.ToString());
                ((alimento)c).tipoAlimentoSpecified = true;
            }
            else
            {
                c = new bebida();
                c.tipo = 'B';
                if (Session["tipo"].ToString() != "Bebida" && Session["tipo"].ToString() != "Nuevo")
                {
                    lblMensajeError.Text = "No debe cambiar el tipo de consumible Bebida";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                if (txtOnzas.Text.Trim().Equals("")) //Validaciones Onzas
                {
                    lblMensajeError.Text = "Debe ingresar Onzas.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                
                letras = poseeCaracteresAlfabeticos(txtOnzas.Text);
                if (letras)
                {
                    lblMensajeError.Text = "Debe ingresar solo numeros en Onzas.";
                    script = "showModalFormError();";
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                    return;
                }
                ((bebida)c).onzas = Int32.Parse(txtOnzas.Text);
                ((bebida)c).tieneHielo = rbTieneHielo.Checked;
            }
            //Session["c"] = c;
            if (Session["idConsumible"] != null)
            {
                c.id = Int32.Parse(Session["idConsumible"].ToString());
            }
            if (imgImagenConsumible.ImageUrl.Trim().Equals("/Images/placeholder.jpg")) //Validacion Imagen
            {
                lblMensajeError.Text = "Debe ingresar una imagen de su consumible.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            c.imagenURL = imgImagenConsumible.ImageUrl;
            if (txtNombreConsumible.Text.Trim().Equals("")) //Validacion Nombre
            {
                lblMensajeError.Text = "Debe ingresar un nombre de consumible.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            c.nombre = txtNombreConsumible.Text;
            //Validaciones Precio
            if (txtPrecio.Text.Trim().Equals(""))
            {
                lblMensajeError.Text = "Debe ingresar Onzas.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
            letras = poseeCaracteresAlfabeticos(txtPrecio.Text);
            if (letras)
            {
                lblMensajeError.Text = "Debe ingresar solo numeros en Onzas.";
                script = "showModalFormError();";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalFormError", script, true);
                return;
            }
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
                    string filePath = Server.MapPath("~/Images/Confiteria/") + filename;
                    fileUploadImagenConsumible.SaveAs(Server.MapPath("~/Images/Confiteria/") + filename);

                    imgImagenConsumible.ImageUrl = "~/Images/Confiteria/" + filename;
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
        private bool poseeCaracteresAlfabeticos(string palabra)
        {
            bool verificar = false;
            int tamanio = palabra.Length;
            for (int i = 0; i < tamanio; i++)
            {
                char car = txtPrecio.Text[i];
                if ((car >= 'a' && car <= 'z') || (car >= 'A' && car <= 'Z'))
                {
                    verificar = true;
                    break;
                }
            }
            return verificar;
        }
        protected void rbHabilitarAlimentoNoBebida()
        {
            txtPesoPromedio.ReadOnly = false;
            ddlTipoAlimento.EnableViewState = false;
            txtOnzas.ReadOnly = true;
            rbTieneHielo.EnableViewState = true;
        }
        protected void rbHabilitarBebidaNoAlimento()
        {
            txtPesoPromedio.ReadOnly = true;
            ddlTipoAlimento.EnableViewState = true;
            txtOnzas.ReadOnly = false;
            rbTieneHielo.EnableViewState = false;
        }

    }
}