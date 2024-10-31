﻿using PapucplanetWA;
using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWAS
{
    public partial class Butacas : System.Web.UI.Page
    {
        protected BindingList<BindingList<butacaFuncion>> matrizButacas;
        protected boleta bol;
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ButacaFuncionWSClient daoButacaFuncion = new ButacaFuncionWSClient();

                BindingList<butacaFuncion> listaButacas = new BindingList<butacaFuncion>(daoButacaFuncion.obtenerButacasPorFuncionButacaFuncion(2));
                matrizButacas = ConvertirListaEnMatriz(listaButacas);
                Session["MatrizButacas"] = matrizButacas;
                SeatRepeater.DataSource = matrizButacas;
                SeatRepeater.DataBind();
                BindSummaryGrid();
                bol=new boleta();
                bol.lineasBoleta=new BindingList<lineaBoleta>().ToArray();
                Session["Boleta"] = bol;
                Session["ContDisc"]= 0;
                Session["ContEst"] = 0;
                Session["Total"] = 0.00;
            }
            else
            {
                bol = (boleta)Session["Boleta"];
                GridViewSummary.DataSource = Session["Summary"];
                GridViewSummary.DataBind();
            }

        }


        private void BindSummaryGrid()
        {
            DataTable summaryData = new DataTable();
            summaryData.Columns.Add("Tipo");
            summaryData.Columns.Add("Precio");
            summaryData.Columns.Add("Cantidad");

            // Agregar filas al DataTable
            summaryData.Rows.Add("Estandar", "S/. 15", "0");
            summaryData.Rows.Add("Discapacitado", "S/. 10", "0");

            // Enlazar el DataTable al GridView
            GridViewSummary.DataSource = summaryData;
            GridViewSummary.DataBind();
            Session["Summary"] = summaryData;
        }
        /*
        protected BindingList<ButacaFuncion> ObtenerButacasDesdeBaseDeDatos()
        {
            return new BindingList<ButacaFuncion>
            {
                new ButacaFuncion { IdButacaFuncion=1, Fila= 'A', Columna = 1, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false , Precio=15},
                new ButacaFuncion { IdButacaFuncion=2, Fila = 'A', Columna = 2, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false, Precio=15},
                new ButacaFuncion { IdButacaFuncion=3, Fila = 'A', Columna = 3, Estado = EstadoButaca.OCUPADA, Discapacitado = false, Precio=15 },
                new ButacaFuncion { IdButacaFuncion=4, Fila = 'A', Columna = 4, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false,Precio=15 },
                new ButacaFuncion { IdButacaFuncion=5, Fila = 'B', Columna = 1, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false,Precio=15 },
                new ButacaFuncion { IdButacaFuncion=6, Fila = 'B', Columna = 2, Estado = EstadoButaca.DISPONIBLE, Discapacitado = true,Precio=10 }, // Ejemplo de asiento discapacitado
                new ButacaFuncion { IdButacaFuncion=7, Fila = 'B', Columna = 3, Estado = EstadoButaca.OCUPADA, Discapacitado = false , Precio = 15},
                new ButacaFuncion { IdButacaFuncion=8, Fila = 'B', Columna = 4, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false ,Precio=15},
                new ButacaFuncion { IdButacaFuncion=9, Fila = 'C', Columna = 1, Estado = EstadoButaca.MANTENIMIENTO, Discapacitado = false , Precio = 15},
                new ButacaFuncion { IdButacaFuncion=10, Fila = 'C', Columna = 2, Estado = EstadoButaca.DISPONIBLE, Discapacitado = true, Precio=10 }, // Ejemplo de asiento discapacitado
                new ButacaFuncion { IdButacaFuncion=11, Fila = 'C', Columna = 3, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false,Precio=15  },
                new ButacaFuncion { IdButacaFuncion=12, Fila = 'C', Columna = 4, Estado = EstadoButaca.DISPONIBLE, Discapacitado = false, Precio=15 }

            };
        }
        */

        private BindingList<BindingList<butacaFuncion>> ConvertirListaEnMatriz(BindingList<butacaFuncion> lista)
        {
            var agrupadasPorFila = new Dictionary<char, BindingList<butacaFuncion>>();

            foreach (butacaFuncion butaca in lista)
            {
                if (!agrupadasPorFila.ContainsKey((char)butaca.fila))
                {
                    agrupadasPorFila[(char)butaca.fila] = new BindingList<butacaFuncion>();
                }

                agrupadasPorFila[(char)butaca.fila].Add(butaca);
            }

            return new BindingList<BindingList<butacaFuncion>>(agrupadasPorFila.Values.ToList());
        }

        protected void GridViewSummary_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Asignar valores a las celdas utilizando DataBinder.Eval
                e.Row.Cells[0].Text = DataBinder.Eval(e.Row.DataItem, "Tipo").ToString();
                e.Row.Cells[1].Text = DataBinder.Eval(e.Row.DataItem, "Precio").ToString();
                e.Row.Cells[2].Text = DataBinder.Eval(e.Row.DataItem, "Cantidad").ToString();
            }
        }
        public string GetSeatClass(string est, string val)
        {
            estadoButaca estado = (estadoButaca)Enum.Parse(typeof(estadoButaca), est);
            Boolean valor = Boolean.Parse(val);


            if (estado == estadoButaca.DISPONIBLE)
            {
                if (valor) return "available-disc"; // discapacitado
                else return "available-est"; // estándar
            }
            else if (estado == estadoButaca.OCUPADA)
            {
                return "occupied";
            }
            else if (estado == estadoButaca.RESERVADA)
            {
                if (valor) return "reserved-disc"; // discapacitado
                else return "reserved-est"; // estándar
            }
            else if (estado == estadoButaca.MANTENIMIENTO)
            {
                return "maintenance-seat"; // mantenimiento
            }
            else
            {
                return "disabled-seat"; // no disponible
            }
        }

        protected void SeatRepeater_ItemCommand(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            if (btn.CommandName == "ToggleSeat")
            {
                int seatId = int.Parse(btn.CommandArgument.ToString());
                matrizButacas = Session["MatrizButacas"] as BindingList<BindingList<butacaFuncion>>;
                foreach (var fila in matrizButacas)
                {
                    foreach (butacaFuncion butaca in fila)
                    {
                        if (butaca.idButacaFuncion == seatId)
                        {
                            if (butaca.estado == estadoButaca.DISPONIBLE)
                            {
                                ChangeGrid(1, butaca);
                                butaca.estado = estadoButaca.RESERVADA;
                            }
                            else if (butaca.estado == estadoButaca.RESERVADA)
                            {
                                ChangeGrid(0, butaca);
                                butaca.estado = estadoButaca.DISPONIBLE;
                            }
                            // Salir del bucle una vez que se cambia el estado
                            break;
                        }
                    }
                }
                Session["MatrizButacas"] = matrizButacas;
                // Actualizar el Repeater
                SeatRepeater.DataSource = matrizButacas;
                SeatRepeater.DataBind();
                
            }
        }
        private void ChangeGrid(int val, butacaFuncion but)
        {
            DataTable summaryData = (DataTable)Session["Summary"]; // Asegúrate de tener el DataTable disponible
            int contadorDisc = (Int32)Session["ContDisc"];
            int contadorEst = (Int32)Session["ContEst"];
            double total = (double)Session["Total"];
            if (val==1)
            {
                //se añade a la boleta
                lineaBoleta linea=new lineaBoleta();
                linea.butacaFuncion= but;
                /*
                BindingList<lineaBoleta> listaLineas = new BindingList<lineaBoleta>(bol.lineasBoleta);
                listaLineas.Add(linea);
                
                

                // Convertir de nuevo a arreglo y actualizar bol.lineasBoleta
                bol.lineasBoleta = listaLineas.ToArray();
                */

                bol.lineasBoleta.Append(linea);
                if (!but.discapacitado)
                {
                    foreach (DataRow row in summaryData.Rows)
                    {
                        
                        if (row["Tipo"].ToString() == "Estandar")
                        {
                            contadorEst++;
                            row["Cantidad"] = contadorEst.ToString(); // Cambiar la cantidad a 5
                            Session["ContEst"] = contadorEst;
                            total += but.precio;
                            break; // Salir del bucle
                        }
                    }
                }
                else
                {
                    foreach (DataRow row in summaryData.Rows)
                    {
                        if (row["Tipo"].ToString() == "Discapacitado")
                        {
                            contadorDisc++;
                            row["Cantidad"] = contadorDisc.ToString(); // Cambiar la cantidad a 5
                            Session["ContDisc"] = contadorDisc;
                            total += but.precio;
                            break; // Salir del bucle
                        }
                    }
                }

            }
            else{
                //se elimina de la boleta
                lineaBoleta linea = new lineaBoleta();
                linea.butacaFuncion = but;

                List<lineaBoleta> tempList = new List<lineaBoleta>(bol.lineasBoleta);

                // Eliminar el elemento deseado
                tempList.Remove(linea); // Aquí se elimina la línea

                // Asignar de nuevo a bol.lineasBoleta como un arreglo
                bol.lineasBoleta = tempList.ToArray(); // Actualizar el arreglo

                if (!but.discapacitado)
                {
                    foreach (DataRow row in summaryData.Rows)
                    {

                        if (row["Tipo"].ToString() == "Estandar")
                        {
                            contadorEst--;
                            row["Cantidad"] = contadorEst.ToString(); // Cambiar la cantidad a 5
                            Session["ContEst"] = contadorEst;
                            total -= but.precio;
                            break; // Salir del bucle
                        }
                    }
                }
                else
                {
                    foreach (DataRow row in summaryData.Rows)
                    {
                        if (row["Tipo"].ToString() == "Discapacitado")
                        {
                            contadorDisc--;
                            
                            row["Cantidad"] = contadorDisc.ToString(); // Cambiar la cantidad a 5
                            Session["ContDisc"] = contadorDisc;
                            total -= but.precio;
                            break; // Salir del bucle
                        }
                    }
                }

            }

            LabelCantidadTotal.Text = (contadorDisc + contadorEst).ToString();
            LabelTotal.Text = ("S/. " + total.ToString("0.00"));
            Session["Total"] = total;
            Session["Boleta"] = bol;
            GridViewSummary.DataSource = summaryData;
            GridViewSummary.DataBind();
            Session["Summary"] = summaryData;
        }
        protected void SeatRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var rowButacas = (BindingList<butacaFuncion>)e.Item.DataItem;
                var rowRepeater = (Repeater)e.Item.FindControl("RowRepeater");
                rowRepeater.DataSource = rowButacas;
                rowRepeater.DataBind();
            }
        }

      
    }
}