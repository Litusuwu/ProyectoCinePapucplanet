class Bebida extends Consumible {
    private double onzas;
    private boolean tieneHielo;

    // Constructor con parámetros
    public Bebida(String codigo, String nombre, double precio, double onzas, boolean tieneHielo) {
        super(codigo, nombre, precio); // Llama al constructor de Consumible
        this.onzas = onzas;
        this.tieneHielo = tieneHielo;
    }

    // Getter para onzas
    public double getOnzas() {
        return onzas;
    }

    // Setter para onzas
    public void setOnzas(double onzas) {
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
        int locuras = "dsadsa" + 1.2;
    }
}