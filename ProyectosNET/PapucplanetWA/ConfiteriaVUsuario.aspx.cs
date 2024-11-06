using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWA
{
    public partial class ConfiteriaVUsuario : System.Web.UI.Page
    {
        private AlimentoWSClient alimentoDAO = new AlimentoWSClient();
        private BebidaWSClient bebidaDAO = new BebidaWSClient();
        private boleta bol;
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["CantidadProductos"] != null)
                {
                    Session["CantidadProductos"] = new Dictionary<int, int>();
                }
                CargarProductos();
                ActualizarContadorCarrito();
            }
            if (Session["CantidadProductos"] == null)
            {
                Session["CantidadProductos"] = new Dictionary<int, int>();
            }
        }

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        CargarProductos();
        //        ActualizarContadorCarrito();
        //    }
        //}
        private void ActualizarContadorCarrito()
        {
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            int totalItems = cantidades.Values.Sum();
            cartCount.Text = totalItems.ToString();
        }

        protected void IncrementarCantidad_Click(object sender, EventArgs e)
        {
            var boton = (Button)sender;
            var productoId = int.Parse(boton.CommandArgument);
            IncrementarCantidad(productoId);
            EnlazarDatos();
            ActualizarContadorCarrito();
        }

        protected void DecrementarCantidad_Click(object sender, EventArgs e)
        {
            var boton = (Button)sender;
            var productoId = int.Parse(boton.CommandArgument);
            DecrementarCantidad(productoId);
            EnlazarDatos();
            ActualizarContadorCarrito();
        }
        private void CargarProductos()
        {
            List<bebida> bebidas;
            var resultadoBebidas = bebidaDAO.listarTodasBebidas();
            if (resultadoBebidas != null)
            {
                bebidas = new List<bebida>(resultadoBebidas);
            }
            else
            {
                bebidas = new List<bebida>();
            }
            List<alimento> alimentos;
            var resultadoAlimentos = alimentoDAO.listarTodosAlimentos();
            
            if (resultadoAlimentos != null)
            {
                alimentos = new List<alimento>(resultadoAlimentos);
            }
            else
            {
                alimentos = new List<alimento>();
            }
            var todosLosProductos = new List<Producto>();
            var aliment = new List<Producto>();
            var bebid = new List<Producto>();

            foreach (alimento ali in alimentos)
            {
                Producto prod = new Producto
                {
                    Id = ali.id,
                    Nombre = ali.nombre,
                    Precio = ali.precio,
                    UrlImagen = ali.imagenURL,
                    Descripcion = ali.tipoAlimento.ToString() + " - " + ali.pesoPromedio.ToString() +" gr.",
                };
                aliment.Add( prod );
                todosLosProductos.Add(prod);
            }
            foreach (bebida be in bebidas)
            {
                Producto prod = new Producto
                {
                    Id = be.id,
                    Nombre = be.nombre,
                    Precio = be.precio,
                    UrlImagen = be.imagenURL,
                    Descripcion = be.onzas.ToString() + "oz."
                };
                bebid.Add(prod);
                todosLosProductos.Add(prod);
            }
            Session["Alimentos"] = alimentos; //las que tienen todos los datos
            Session["Bebidas"] = bebidas;
            Session["TodosLosProductos"] = todosLosProductos;
            Session["ProductosAlimentos"] = aliment;
            Session["ProductosBebidas"] = bebid;
            
            if (Session["CantidadProductos"] == null)
            {
                Session["CantidadProductos"] = new Dictionary<int, int>();
            }
            EnlazarDatos();
        }

        private void EnlazarDatos()
        {
            var todosLosProductos = (List<Producto>)Session["TodosLosProductos"];
            var aliment = (List<Producto>)Session["ProductosAlimentos"];
            var bebid = (List<Producto>)Session["ProductosBebidas"];
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



        private void IncrementarCantidad(int productoId)
        {
            bol = (boleta)Session["Boleta"];
            List<alimento> listaA=(List<alimento>)Session["Alimentos"];
            List<bebida>listaB=(List<bebida>)Session["Bebidas"];
            List<lineaBoleta>lineasBoleta=new List<lineaBoleta> (bol.lineasBoleta);
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            // Verifica si la línea de boleta ya contiene el producto
            var lineaExistente = lineasBoleta.FirstOrDefault(lb => lb.consumible.id == productoId);
            consumible cons;
            cons = listaA.FirstOrDefault(consumible => consumible.id == productoId);
            if(cons==null) cons = listaB.FirstOrDefault(consumible => consumible.id == productoId);

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
                    lin.subtotal = cons.precio;
                    lineasBoleta.Add(lin);
                }
            }
            else
            {
                cantidades[productoId] = 1;
                lineaBoleta lin = new lineaBoleta();
                lin.cantidad = 1;
                lin.consumible = cons;
                lin.subtotal = cons.precio;
                lineasBoleta.Add(lin);
            }
            bol.total += cons.precio;
            Session["CantidadProductos"] = cantidades;

        }

        private void DecrementarCantidad(int productoId)
        {
            bol= (boleta)Session["Boleta"];
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            List<alimento> listaA = (List<alimento>)Session["Alimentos"];
            List<bebida> listaB = (List<bebida>)Session["Bebidas"];
            List<lineaBoleta> lineasBoleta = new List<lineaBoleta>(bol.lineasBoleta);
            consumible cons;
            cons = listaA.FirstOrDefault(consumible => consumible.id == productoId);
            if (cons == null) cons = listaB.FirstOrDefault(consumible => consumible.id == productoId);
            var lineaExistente = lineasBoleta.FirstOrDefault(lb => lb.consumible.id == productoId);
            if (cantidades.ContainsKey(productoId) && cantidades[productoId] > 0)
            {
                cantidades[productoId]--;
                if (cantidades[productoId] == 0)
                {
                    lineasBoleta.Remove(lineaExistente);
                }
                else
                {
                    lineaExistente.cantidad -= 1;
                    lineaExistente.subtotal -= cons.precio;
                    
                }
                bol.total -= cons.precio;
            }
            bol.lineasBoleta = lineasBoleta.ToArray();
            Session["Boleta"] = bol;
            Session["CantidadProductos"] = cantidades;
        }

        public class Producto
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
            public string Descripcion { get; set; }
            public double Precio { get; set; }
            public string UrlImagen { get; set; }
        }
    }
}