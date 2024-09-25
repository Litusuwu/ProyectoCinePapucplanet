package pe.edu.pucp.papucplanet.compras.model;
import java.util.Date;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;

public class Boleta{
    private int idBoleta;
    private Cliente cliente;
    private Date fechaCompra;
    private MetodoPago metodoPago;
    private double total;
    private ArrayList<LineaBoleta> lineasBoleta;
    private boolean activo;
    //posee array de consumible y entradas

    public ArrayList<LineaBoleta> getLineasBoleta() {
        return lineasBoleta;
    }

    public void setLineasBoleta(ArrayList<LineaBoleta> lineasBoleta) {
        this.lineasBoleta = lineasBoleta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public Boleta(){
        
    }
    	// Constructor con parámetros
    public Boleta(Date fechaCompra, MetodoPago metodoPago, double total) {
        this.fechaCompra = fechaCompra;
        this.metodoPago = metodoPago;
        this.total = total;
    }
    
    public int getIdBoleta() {
        return idBoleta;
    }

    public void setIdBoleta(int idBoleta) {
        this.idBoleta = idBoleta;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
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


   
    //////////////////////////////////////////////////////////////METODO INTERFACE///////////////////////////////////////////////////////////////////////////

    // Método para generar un reporte detallado
    public String emitirBoleta() {
        String reporte = "";
        reporte = "Fecha de compra: "+ fechaCompra + "\n";
        reporte = "Método de pago: "+ metodoPago + "\n";
        reporte ="Total: " + total + "\n";
        return reporte;
    }

    public void ConsultarDatos(){
        
    }
}
