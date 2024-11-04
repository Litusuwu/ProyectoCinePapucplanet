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
            daoAlimento = new AlimentoWSClient();
            daoBebiba = new BebidaWSClient();
            BindingList<consumible> ListadoConsumibles= new BindingList<consumible>();
            alimento[] arregloA = daoAlimento.listarTodosAlimentos();
            foreach (alimento a in arregloA)
            {
                ListadoConsumibles.Add(a);
            }
            bebida[] arregloB = daoBebiba.listarTodasBebidas();
            foreach (bebida b in arregloB)
            {
                ListadoConsumibles.Add(b);
            }
            gvConsumibles.DataSource = ListadoConsumibles;
            gvConsumibles.DataBind();
        }
        protected void lbRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarNuevoConsumible.aspx");
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