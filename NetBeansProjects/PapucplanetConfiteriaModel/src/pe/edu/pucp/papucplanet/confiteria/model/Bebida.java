package pe.edu.pucp.papucplanet.confiteria.model;

public class Bebida extends Consumible {
    private int onzas;
    private boolean tieneHielo;

    public Bebida(){
    }
    
    // Constructor con parámetros
    public Bebida(int codigo, String nombre, double precio, int onzas, boolean tieneHielo) {
        super(codigo, nombre, precio); // Llama al constructor de Consumible
        this.onzas = onzas;
        this.tieneHielo = tieneHielo;
    }

    // Getter para onzas
    public int getOnzas() {
        return onzas;
    }

    // Setter para onzas
    public void setOnzas(int onzas) {
        this.onzas = onzas;
    }

    // Getter para tieneHielo
    public boolean isTieneHielo() {
        return tieneHielo;
    }

    // Setter para tieneHielo
    public void setTieneHielo(boolean tieneHielo) {
        this.tieneHielo = tieneHielo;
    }

    public void ConsultarDatos(){
        
    }
}