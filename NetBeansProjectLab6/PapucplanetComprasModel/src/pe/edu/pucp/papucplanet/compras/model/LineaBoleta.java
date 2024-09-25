package pe.edu.pucp.papucplanet.compras.model;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.confiteria.model.Consumible;


public class LineaBoleta {

    private int idLineaBoleta;
    private double precio;
    private int cantidad;
    private boolean activo;
    private ButacaFuncion butacaFuncion;
    private Consumible consumible;
    
    public LineaBoleta(){

    }
    
    public int getIdLineaBoleta() {
        return idLineaBoleta;
    }

    public void setIdLineaBoleta(int idLineaBoleta) {
        this.idLineaBoleta = idLineaBoleta;
    }

    public double getPrecio() {
        return precio;
    }

    public ButacaFuncion getButacaFuncion() {
        return butacaFuncion;
    }

    public void setButacaFuncion(ButacaFuncion butacaFuncion) {
        this.butacaFuncion = butacaFuncion;
    }

    public Consumible getConsumible() {
        return consumible;
    }

    public void setConsumible(Consumible consumible) {
        this.consumible = consumible;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    
}
