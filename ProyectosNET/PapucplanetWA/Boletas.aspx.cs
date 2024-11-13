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
    public partial class Boletas : System.Web.UI.Page
    {
        private BoletaWSClient daoBoleta;
        private BindingList<boleta> listadoBoletas;
        protected void Page_Init(object sender, EventArgs e)
        {
            daoBoleta = new BoletaWSClient();
            listadoBoletas = new BindingList<boleta>();
            boleta[] arreglob = daoBoleta.listarTodasBoletas();
            arreglob = null;
            if (arreglob != null)
            {
                foreach (boleta b in arreglob)
                {
                    //b.idBoleta;
                    listadoBoletas.Add(b);
                }
            }
            //gvBoletas.DataSource = listadoBoletas;
            //gvBoletas.DataBind();
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
            BindingList<boleta> listadoBoletasParcial = new BindingList<boleta>();
            foreach (var item in listadoBoletas)
            {
                listadoBoletasParcial.Add(item);
            } 
            gvBoletas.DataSource = listadoBoletasParcial;
            gvBoletas.DataBind();
        }
        protected void lbLineasBoleta_Click(object sender, EventArgs e)
        {
            int idBoleta= Int32.Parse(((LinkButton)sender).CommandArgument);
        }
        protected void lbImprimirBoleta_Click(Object sender, EventArgs e)
        {
            int idBoleta = Int32.Parse(((LinkButton)sender).CommandArgument);
            boleta boleta = daoBoleta.obtenerBoletaPorId(idBoleta);
            if(boleta.idBoleta == 0)
            {

            }
            //script modal
        }
        protected void gvBoletas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBoletas.PageIndex = e.NewPageIndex;
            gvBoletas.DataBind();
        }

        protected void gvBoletas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem,"fechaCompra")).ToString("yyyy-MM-dd");
                string nombreCliente = DataBinder.Eval(e.Row.DataItem, "nombre").ToString();
                nombreCliente += " " + DataBinder.Eval(e.Row.DataItem, "primerApellido").ToString();
                nombreCliente += " " + DataBinder.Eval(e.Row.DataItem, "segundoApellido").ToString();
                e.Row.Cells[2].Text = nombreCliente;
                e.Row.Cells[3].Text = ((metodoPago)DataBinder.Eval(e.Row.DataItem, "metodoPago")).ToString();
                e.Row.Cells[4].Text = DataBinder.Eval(e.Row.DataItem, "total").ToString();
            }
        }
    }
}