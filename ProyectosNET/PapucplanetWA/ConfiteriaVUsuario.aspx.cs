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
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
            if (Session["CantidadProductos"] == null)
            {
                Session["CantidadProductos"] = new Dictionary<int, int>();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
                ActualizarContadorCarrito();
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

            // Verificar si el resultado de listarTodasBebidas() es null y asignar una lista vacía si es necesario
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

            // Verificar si el resultado de listarTodosAlimentos() es null y asignar una lista vacía si es necesario
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
            var todosLosProductos = new List<Producto>
            {
                new Producto { Id = 1, Nombre = "Popcorn Grande", Descripcion = "Deliciosa popcorn con mantequilla.", Precio = 10.00, UrlImagen = "https://plazavea.vteximg.com.br/arquivos/ids/19260798-1000-1000/imageUrl_2.jpg" },
                new Producto { Id = 2, Nombre = "Coca Cola", Descripcion = "Refrescante bebida gaseosa.", Precio = 7.00, UrlImagen = "https://www.coca-cola.com/content/dam/onexp/gt/es/brands/coca-cola/es_coca-cola_prod_orginal-bottle-600mL_750x750_v1.jpg/width2674.jpg" },
                new Producto { Id = 3, Nombre = "Nachos", Descripcion = "Nachos con queso.", Precio = 12.00, UrlImagen = "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipesmedia/recipes/foodservice/desktop%20images/2021/feb/2021_com_take-out-nachos_900x600.jpg?ext=.jpg" }
            };
            var aliment = new List<Producto>();
            var bebid = new List<Producto>();

            foreach (alimento ali in alimentos)
            {
                Producto prod = new Producto
                {
                    Id = ali.id,
                    Nombre = ali.nombre,
                    Precio = ali.precio,
                    UrlImagen = "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipesmedia/recipes/foodservice/desktop%20images/2021/feb/2021_com_take-out-nachos_900x600.jpg?ext=.jpg",
                    Descripcion = "HOLA MUNDO"
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
                    UrlImagen = "https://stordfkenticomedia.blob.core.windows.net/df-us/rms/media/recipesmedia/recipes/foodservice/desktop%20images/2021/feb/2021_com_take-out-nachos_900x600.jpg?ext=.jpg",
                    Descripcion = "HOLA MUNDO"
                };
                bebid.Add(prod);
                todosLosProductos.Add(prod);
            }
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
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            if (cantidades.ContainsKey(productoId))
            {
                cantidades[productoId]++;
            }
            else
            {
                cantidades[productoId] = 1;
            }
            Session["CantidadProductos"] = cantidades;
        }

        private void DecrementarCantidad(int productoId)
        {
            var cantidades = (Dictionary<int, int>)Session["CantidadProductos"];
            if (cantidades.ContainsKey(productoId) && cantidades[productoId] > 0)
            {
                cantidades[productoId]--;
            }
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