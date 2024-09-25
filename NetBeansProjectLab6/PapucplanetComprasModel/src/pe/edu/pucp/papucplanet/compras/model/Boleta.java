package pe.edu.pucp.papucplanet.compras.model;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.confiteria.model.Consumible;
import java.util.Date;
import java.util.ArrayList;

public class Boleta{
    private Date fechaCompra;
    private MetodoPago metodoPago;
    private double total;
    private boolean activo;
    //posee array de consumible y entradas
    private ArrayList<Consumible> consumibles;
    private ArrayList<ButacaFuncion> butacasFunciones;
	
	// Constructor con parámetros
    public Boleta(Date fechaCompra, MetodoPago metodoPago, double total) {
        this.fechaCompra = fechaCompra;
        this.metodoPago = metodoPago;
        this.total = total;
    }

    // Getter para fechaCompra
    public Date getFechaCompra() {
        return fechaCompra;
    }

    // Setter para fechaCompra
    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    // Getter para metodoPago
    public MetodoPago getMetodoPago() {
        return metodoPago;
    }

    // Setter para metodoPago
    public void setMetodoPago(MetodoPago metodoPago) {
        this.metodoPago = metodoPago;
    }

    // Getter para total
    public double getTotal() {
        return total;
    }

    // Setter para total
    public void setTotal(double total) {
        this.total = total;
    }

    public ArrayList<Consumible> getConsumibles(){
        return new ArrayList<>(consumibles);
    }

    public void setConsumibles(ArrayList<Consumible> consumibles){
        this.consumibles = consumibles;
    }

    public ArrayList<ButacaFuncion> getButacasFunciones(){
        return new ArrayList<>(butacasFunciones);
    }

    public void setEntradas(ArrayList<ButacaFuncion> butacasFunciones){
        this.butacasFunciones = butacasFunciones;
    }

    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////

    // Método para agregar un consumible
    public void agregarConsumible(Consumible consumible) {
        this.consumibles.add(consumible);
        System.out.println("Consumible agregado: " + consumible.getNombre());
    }

    // Método para agregar una entrada
    public void agregarButaca(ButacaFuncion butaca) {
        this.butacasFunciones.add(butaca);
        //System.out.println("Entrada agregada: " + butacasFunciones.getNumero());
    }

    // Método para eliminar una entrada por índice
    public void eliminarButaca(int indice) {
        if (indice >= 0 && indice < butacasFunciones.size()) {
            ButacaFuncion butElim = butacasFunciones.remove(indice);
            //System.out.println("Entrada eliminada: " + butElim.getNumero());
        } else {
            System.out.println("Índice fuera de rango");
        }
    }

    //////////////////////////////////////////////////////////////METODO INTERFACE///////////////////////////////////////////////////////////////////////////

    // Método para generar un reporte detallado
    public String emitirBoleta() {
        String reporte = "";
        reporte = "Fecha de compra: "+ fechaCompra + "\n";
        reporte = "Método de pago: "+ metodoPago + "\n";
        reporte ="Total: " + total + "\n";

        reporte = "\nConsumibles:\n";
        for (Consumible consumible : consumibles) {
            reporte = " - " + consumible.getNombre() + " - Precio: " + consumible.getPrecio() + "\n";
        }

        reporte = "\nEntradas:\n";
		
        for (ButacaFuncion butaca : butacasFunciones) {
            Sala sala;
            sala=butaca.getSala();
            Funcion funcion=butaca.getFuncion();
            reporte = " - Película: " + funcion.getPelicula() + " - Sala: " + 
            sala.getIdSala() + " - Butaca: " + butaca.getFila() + butaca.getColumna()+"\n";
        }

        return reporte;
    }

    public void ConsultarDatos(){
        
    }
}
