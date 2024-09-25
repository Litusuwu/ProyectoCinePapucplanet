package pe.edu.pucp.papucplanet.confiteria.model;

public abstract class Consumible {
    private int id;
    private String nombre;
    private double precio;
    private boolean activo;
    
    public Consumible(){
    }

    // Constructor con parámetros
    public Consumible(int codigo, String nombre, double precio) {
        this.id = codigo;
        this.nombre = nombre;
        this.precio = precio;
    }

    // Getter para id
    public int getId() {
        return id;
    }

    // Setter para id
    public void setId(int id) {
        this.id = id;
    }

    // Getter para nombre
    public String getNombre() {
        return nombre;
    }

    // Setter para nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Getter para precio
    public double getPrecio() {
        return precio;
    }

    // Setter para precio
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public boolean getActivo(){
        return activo;
    }
    
    public void setActivo(boolean activo){
        this.activo=activo;
    }
    
}
