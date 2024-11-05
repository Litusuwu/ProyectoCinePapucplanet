using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class Consumibles : System.Web.UI.Page
    {
        private AlimentoWSClient daoAlimento;
        private BebidaWSClient daoBebiba;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario usuarioDatos = (usuario)Session["Usuario"];
            if (usuarioDatos == null || !usuarioDatos.tipoUsuario.Equals("A"))
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
            daoAlimento = new AlimentoWSClient();
            daoBebiba = new BebidaWSClient();
            BindingList<consumible> ListadoConsumibles= new BindingList<consumible>();
            alimento[] arregloA = daoAlimento.listarAlimentosPorNombre(txtNombre.Text);
            if(arregloA != null)
            {
                foreach (alimento a in arregloA)
                {
                    ListadoConsumibles.Add(a);
                }
            }
            
            bebida[] arregloB = daoBebiba.listarBebidasPorNombre(txtNombre.Text);
            if (arregloB != null)
            {
                foreach (bebida b in arregloB)
                {
                    ListadoConsumibles.Add(b);
                }
            }
            
            //consumible c = new consumible();
            //c.
  
            gvConsumibles.DataSource = ListadoConsumibles;
            gvConsumibles.DataBind();
        }
        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarNuevoConsumible.aspx");
        }
        protected void lbModificar_Click(object sender, EventArgs e)
        {
            int idConsumible = Int32.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("AgregarNuevoConsumible.aspx?accion=modificar&idConsumible=" + idConsumible);
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            int idConsumible = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoAlimento.eliminarAlimento(idConsumible);
            daoBebiba.eliminarBebida(idConsumible);
            Response.Redirect("Consumibles.aspx");
        }
        protected void lbDetalle_Click(object sender, EventArgs e)
        {
            int idConsumible = Int32.Parse(((LinkButton)sender).CommandArgument);
            string script = "";
            alimento a = daoAlimento.obtenerPorIdAlimento(idConsumible);
            bebida b = daoBebiba.obtenerPorIdBebida(idConsumible);
            if(a.id != 0)
            {
                txtPesoPromedio.Text = a.pesoPromedio.ToString(); //Double
                txtTipoAlimento.Text = a.tipoAlimento.ToString(); //Enum
                script = "window.onload = function() " + "{showModalFormAlimentoDetalle()};"; //Modal para ver descripcion de un alimento
            }else if(b.id != 0)
            {
                txtOnzas.Text = b.onzas.ToString(); //Int
                txtTieneHielo.Text = b.tieneHielo ? "Si" : "No";
                script = "window.onload = function() " + "{showModalFormBebidaDetalle()};"; //Modal para ver descripcion de una bebida
            }            

            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }
        protected void gvConsumibles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvConsumibles.PageIndex = e.NewPageIndex;
            gvConsumibles.DataBind();
        }

        protected void gvConsumibles_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = DataBinder.Eval(e.Row.DataItem, "nombre").ToString();
                e.Row.Cells[2].Text = DataBinder.Eval(e.Row.DataItem, "precio").ToString();
            }
        }
    }
}