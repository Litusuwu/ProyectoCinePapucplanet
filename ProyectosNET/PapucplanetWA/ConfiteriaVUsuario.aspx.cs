using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Adapters;

namespace PapucplanetWA
{
    public partial class ConfiteriaVUsuario : System.Web.UI.Page
    {
        private AlimentoWSClient alimentoDAO = new AlimentoWSClient();
        private BebidaWSClient bebidaDAO = new BebidaWSClient();
        private BindingList<lineaBoleta> lineas;
        protected void Page_Init(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                string valor = Request.QueryString["visible"];
                
                if (Session["CantidadProductos"] != null)
                {
                    Session["CantidadProductos"] = new Dictionary<int, int>();
                }
                usuario usuarioDatos = (usuario)Session["Usuario"];
                lnkPerfilOutside.Text = usuarioDatos.nombre + " " + usuarioDatos.primerApellido;
                lnkPrfCompra.Text= usuarioDatos.nombre + " " + usuarioDatos.primerApellido;
                CargarProductos();
                ActualizarContadorCarrito();
                if (valor != null) Visibility(true);
                else Visibility(false);
               
            }
            if (Session["CantidadProductos"] == null)
            {
                Session["CantidadProductos"] = new Dictionary<int, int>();
            }
        }

        protected void Visibility(bool visible)
        {
            cart.Visible = visible;
            panelConfiteria.Visible = visible;
            panelPeliculas.Visible = !visible;

            foreach (RepeaterItem item in rptAllItems.Items)
            {
                Button btnIncrease = (Button)item.FindControl("btnIncrease");
                Button btnDecrease = (Button)item.FindControl("btnDecrease");
                Label lblQuantity = (Label)item.FindControl("lblQuantity");

                if (btnIncrease != null) btnIncrease.Visible = visible;
                if (btnDecrease != null) btnDecrease.Visible = visible;
                if (lblQuantity != null) lblQuantity.Visible = visible;
            }

            foreach (RepeaterItem item in rptAlimentos.Items)
            {
                Button btnIncrease = (Button)item.FindControl("btnIncrease");
                Button btnDecrease = (Button)item.FindControl("btnDecrease");
                Label lblQuantity = (Label)item.FindControl("lblQuantity");

                if (btnIncrease != null) btnIncrease.Visible = visible;
                if (btnDecrease != null) btnDecrease.Visible = visible;
                if (lblQuantity != null) lblQuantity.Visible = visible;
            }

            foreach (RepeaterItem item in rptBebidas.Items)
            {
                Button btnIncrease = (Button)item.FindControl("btnIncrease");
                Button btnDecrease = (Button)item.FindControl("btnDecrease");
                Label lblQuantity = (Label)item.FindControl("lblQuantity");

                if (btnIncrease != null) btnIncrease.Visible = visible;
                if (btnDecrease != null) btnDecrease.Visible = visible;
                if (lblQuantity != null) lblQuantity.Visible = visible;
            }
        }
        private void ActualizarContadorCarrito()
        {
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            int totalItems = cantidades.Values.Sum();
            cartCount.Text = totalItems.ToString();
        }

        protected void IncrementarCantidad_Click(object sender, EventArgs e)
        {
            var boton = (Button)sender;
            var args = boton.CommandArgument.ToString().Split(',');
            int id = int.Parse(args[0]);
            char tipo = (char)int.Parse(args[1]);
            IncrementarCantidad(id, tipo);
            EnlazarDatos();
            ActualizarContadorCarrito();
        }

        protected void DecrementarCantidad_Click(object sender, EventArgs e)
        {
            var boton = (Button)sender;
            var args = boton.CommandArgument.ToString().Split(',');
            int id = int.Parse(args[0]);
            char tipo = (char)int.Parse(args[1]);
            DecrementarCantidad(id, tipo);
            EnlazarDatos();
            ActualizarContadorCarrito();
        }
        private void CargarProductos()
        {
            BindingList<consumible> bebidas;
            var resultadoBebidas = bebidaDAO.listarTodasBebidas();
            if (resultadoBebidas != null)
            {
                bebidas = new BindingList<consumible>(resultadoBebidas);
            }
            else
            {
                bebidas = new BindingList<consumible>();
            }
            BindingList<consumible> alimentos;
            var resultadoAlimentos = alimentoDAO.listarTodosAlimentos();
            
            if (resultadoAlimentos != null)
            {
                alimentos = new BindingList<consumible>(resultadoAlimentos);
            }
            else
            {
                alimentos = new BindingList<consumible>();
            }

            Session["Alimentos"] = alimentos; //las que tienen todos los datos
            Session["Bebidas"] = bebidas;
            if (Session["CantidadProductos"] == null)
            {
                Session["CantidadProductos"] = new Dictionary<int, int>();
            }
            EnlazarDatos();
        }

        private void EnlazarDatos()
        {
            
            var aliment = (BindingList<consumible>)Session["Alimentos"];
            var bebid = (BindingList<consumible>)Session["Bebidas"];
            var todosLosProductos = new BindingList<consumible>(aliment.Concat(bebid).ToList());
            rptAllItems.DataSource = todosLosProductos;
            rptAllItems.DataBind();
            rptAlimentos.DataSource = aliment;
            rptAlimentos.DataBind();
            rptBebidas.DataSource = bebid;
            rptBebidas.DataBind();
        }

        private void ActualizarEtiquetaCantidad(RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var productoId = (int)DataBinder.Eval(e.Item.DataItem, "Id");
                var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
                int cantidad = cantidades.ContainsKey(productoId) ? cantidades[productoId] : 0;

                Label lblCantidad = (Label)e.Item.FindControl("lblQuantity");
                lblCantidad.Text = cantidad.ToString();
            }
        }

        protected void MostrarPanel(object sender, EventArgs e)
        {
            var boton = (LinkButton)sender;
            var panelAMostrar = boton.CommandArgument;

            panelAll.Visible = (panelAMostrar == "all");
            panelAlimentos.Visible = (panelAMostrar == "alimentos");
            panelBebidas.Visible = (panelAMostrar == "bebidas");
        }

        protected void rptAllItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ActualizarEtiquetaCantidad(e);
        }

        protected void rptAlimentos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ActualizarEtiquetaCantidad(e);
        }

        protected void rptBebidas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ActualizarEtiquetaCantidad(e);
        }



        private void IncrementarCantidad(int productoId, char tipo)
        {
            lineas = (BindingList<lineaBoleta>)Session["LineasBoleta"];
            BindingList<consumible> listaA=(BindingList<consumible>)Session["Alimentos"];
            BindingList<consumible> listaB=(BindingList<consumible>)Session["Bebidas"];
            
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            // Verifica si la línea de boleta ya contiene el producto
            lineaBoleta lineaExistente = lineas.FirstOrDefault(lb => lb.consumible != null && lb.consumible.id == productoId);
            consumible cons;
            if (tipo == 'B') cons = listaB.FirstOrDefault(consumible => consumible.id == productoId);
            else cons = listaA.FirstOrDefault(consumible => consumible.id == productoId);

            if (cantidades.ContainsKey(productoId))
            {
                cantidades[productoId]++;
                if (lineaExistente != null)
                {
                    // Si el producto ya está en la línea de boleta, incrementa su cantidad
                    lineaExistente.cantidad += 1;
                    lineaExistente.subtotal += cons.precio;
                }
                else
                {
                    // si no está en la línea de boleta, agrega una nueva línea con cantidad 1
                    lineaBoleta lin=new lineaBoleta();
                    lin.cantidad = 1;
                    //busco el consumble y lleno los datos
                    lin.consumible = cons;
                    lin.activo = true;
                    lin.subtotal = cons.precio;
                    lineas.Add(lin);
                }
            }
            else
            {
                cantidades[productoId] = 1;
                lineaBoleta lin = new lineaBoleta();
                lin.cantidad = 1;
                lin.consumible = cons;
                lin.activo = true;
                lin.subtotal = cons.precio;
                lineas.Add(lin);
            }
            Session["CantidadProductos"] = cantidades;

        }

        private void DecrementarCantidad(int productoId, char tipo)
        {
            lineas = (BindingList<lineaBoleta>)Session["LineasBoleta"];
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            BindingList<consumible> listaA = (BindingList<consumible>)Session["Alimentos"];
            BindingList<consumible> listaB = (BindingList<consumible>)Session["Bebidas"];
            consumible cons;
            if (tipo == 'B') cons = listaB.FirstOrDefault(consumible => consumible.id == productoId);
            else cons = listaA.FirstOrDefault(consumible => consumible.id == productoId);
            lineaBoleta lineaExistente = lineas.FirstOrDefault(lb => lb.consumible.id == productoId);
            if (cantidades.ContainsKey(productoId) && cantidades[productoId] > 0 && lineaExistente!=null)
            {
                cantidades[productoId]--;

               if (cantidades[productoId]==0)
               {
                    lineas.Remove(lineaExistente);
               }
               else
               {
                   lineaExistente.cantidad -= 1;
                   lineaExistente.subtotal -= cons.precio;
               }
            }
            
            Session["LineasBoleta"] = lineas;
            Session["CantidadProductos"] = cantidades;
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pagos.aspx");
        }
    
    }
}