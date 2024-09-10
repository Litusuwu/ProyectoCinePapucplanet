import java.util.Date;
import java.util.ArrayList;
class Boleta implements IConsultable{
	private Date fechaCompra;
	private MetodoPago metodoPago;
	private double total;
    //posee array de consumible y entradas
    private ArrayList<Consumible> consumibles;
    private ArrayList<Entrada> entradas;
	
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

    public ArrayList<Entrada> getEntradas(){
        return new ArrayList<>(entradas);
    }

    public void setEntradas(ArrayList<Entrada> entradas){
        this.entradas = entradas;
    }

    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////

    // Método para agregar un consumible
    public void agregarConsumible(Consumible consumible) {
        this.consumibles.add(consumible);
        System.out.println("Consumible agregado: " + consumible.getNombre());
    }

    // Método para agregar una entrada
    public void agregarEntrada(Entrada entrada) {
        this.entradas.add(entrada);
        System.out.println("Entrada agregada: " + entrada.getNumero());
    }

    // Método para eliminar una entrada por índice
    public void eliminarEntrada(int indice) {
        if (indice >= 0 && indice < entradas.size()) {
            Entrada entradaEliminada = entradas.remove(indice);
            System.out.println("Entrada eliminada: " + entradaEliminada.getNumero());
        } else {
            System.out.println("Índice fuera de rango");
        }
    }

    //////////////////////////////////////////////////////////////METODO INTERFACE///////////////////////////////////////////////////////////////////////////

    // Método para generar un reporte detallado
    public String emitirReporte() {
        String reporte = "";
        reporte = "Fecha de compra: "+ fechaCompra + "\n";
        reporte = "Método de pago: "+ metodoPago + "\n";
        reporte ="Total: " + total + "\n";

        reporte = "\nConsumibles:\n";
        for (Consumible consumible : consumibles) {
            reporte = " - " + consumible.getNombre() + " - Precio: " + consumible.getPrecio() + "\n";
        }

        //reporte = "\nEntradas:\n";
        //for (Entrada entrada : entradas) {
            //reporte = " - Película: " + entrada.getPelicula() + " - Asiento: " + entrada.getAsiento() + "\n";
        //}

        return reporte;
    }

}