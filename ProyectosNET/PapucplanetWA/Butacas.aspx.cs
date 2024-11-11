using PapucplanetWA;
using PapucplanetWA.Servicio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PapucplanetWAS
{
    public partial class Butacas : System.Web.UI.Page
    {
        protected BindingList<BindingList<butacaFuncion>> matrizButacas;
        protected BindingList<lineaBoleta> lineas;
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ButacaFuncionWSClient daoButacaFuncion = new ButacaFuncionWSClient();
                
                string valor=Request.QueryString["idFuncion"];
                int val=Int32.Parse(valor);
                showDate(val);
                BindingList<butacaFuncion> listaButacas = new BindingList<butacaFuncion>(daoButacaFuncion.obtenerButacasPorFuncionButacaFuncion(val));
                matrizButacas = ConvertirListaEnMatriz(listaButacas);
                Session["MatrizButacas"] = matrizButacas;
                SeatRepeater.DataSource = matrizButacas;
                SeatRepeater.DataBind();
                BindSummaryGrid(listaButacas);
                lineas = new BindingList<lineaBoleta>();
                Session["LineasBoleta"] = lineas;
                Session["ContDisc"]= 0;
                Session["ContEst"] = 0;
                Session["Total"] = 0.00;
            }
            else
            {
                lineas = (BindingList<lineaBoleta>)Session["LineasBoleta"];
                GridViewSummary.DataSource = Session["Summary"];
                GridViewSummary.DataBind();
            }

        }


        private void BindSummaryGrid(BindingList<butacaFuncion> listaButacas)
        {
            DataTable summaryData = new DataTable();
            summaryData.Columns.Add("Tipo");
            summaryData.Columns.Add("Precio");
            summaryData.Columns.Add("Cantidad");
            butacaFuncion butEst = listaButacas.FirstOrDefault(lb=>(lb.discapacitado==false && lb.estado==estadoButaca.DISPONIBLE));
            butacaFuncion butDis = listaButacas.FirstOrDefault(lb=>(lb.discapacitado==true && lb.estado==estadoButaca.DISPONIBLE));
            if (butEst != null)
            {
                summaryData.Rows.Add("Estandar", "S/. " + butEst.precio.ToString(), "0");
            }
            else
            {
                summaryData.Rows.Add("Estandar", "S/. - ", "0");
            }

            if (butDis != null)
            {
                summaryData.Rows.Add("Discapacitado", "S/. "+ butDis.precio.ToString(), "0");
            }
            else
            {
                summaryData.Rows.Add("Discapacitado", "S/. - ", "0");
            }
            // Enlazar el DataTable al GridView
            GridViewSummary.DataSource = summaryData;
            GridViewSummary.DataBind();
            Session["Summary"] = summaryData;
        }

        protected void showDate( int val)
        {
            FuncionWSClient daoFuncion = new FuncionWSClient();
            funcion fun=daoFuncion.obtenerPorIdFuncion(val);
            DateTime date = fun.dia;
            DateTime horaInicio = fun.horarioInicio;  // Suponiendo que puedes convertirlo
            DateTime horaFin = fun.horarioFin;
            lblDate.Text = "Fecha de la función: " + date.ToString("dd/MM/yyyy") +
                           "<br>Hora de la función:  " + horaInicio.ToString("HH:mm") + " - "  +  horaFin.ToString("HH:mm");
        } 
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
                linea.cantidad = 1;
                linea.subtotal = but.precio;
                linea.activo = true;
                lineas.Append(linea);
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
                foreach(lineaBoleta lin in lineas)
                {
                    if (lin.butacaFuncion.idButacaFuncion == but.idButacaFuncion)
                    {
                        lineas.Remove(lin);
                        break;
                    }
                }
                
                Session["LineasBoleta"] = lineas;

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
            Session["LineasBoleta"] = lineas;
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

        protected void LbtnSiguiente_OnClick(object sender, EventArgs e)
        {
            int cantBut = (Int32)Session["ContDisc"] + (Int32)Session["ContEst"];
            if (cantBut > 0)
            {
                Response.Redirect("ConfiteriaVUsuario.aspx");
            }
            else
            {
                Response.Write("<script>alert('Debe seleccionar por lo menos una butaca');</script>");
            }
            
        }

    }
}
