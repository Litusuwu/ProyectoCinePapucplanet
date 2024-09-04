import java.util.Date;
class Boleta{
	private Date fechaCompra;
	private MetodoPago metodoPago;
	private double total;
	
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
}