package pe.edu.pucp.papucplanet.confiteria.model;

public class Alimento extends Consumible {
    private double pesoPromedio;
    private TipoAlimento tipoAlimento;

    // Constructor con parámetros para Alimento y Consumible
    public Alimento(int codigo, String nombre, double precio, double pesoPromedio, TipoAlimento tipoAlimento) {
        super(codigo, nombre, precio); // Llama al constructor de Consumible
        this.pesoPromedio = pesoPromedio;
        this.tipoAlimento = tipoAlimento;
    }

    // Getter para pesoPromedio
    public double getPesoPromedio() {
        return pesoPromedio;
    }

    // Setter para pesoPromedio
    public void setPesoPromedio(double pesoPromedio) {
        this.pesoPromedio = pesoPromedio;
    }

    // Getter para tipoAlimento
    public TipoAlimento getTipoAlimento() {
        return tipoAlimento;
    }

    // Setter para tipoAlimento
    public void setTipoAlimento(TipoAlimento tipoAlimento) {
        this.tipoAlimento = tipoAlimento;
    }

    public void ConsultarDatos(){
        
    }
}