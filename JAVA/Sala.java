
class Sala {
    private int numero;
    private int capacidad;

    // Constructor con parámetros
    public Sala(int numero, int capacidad) {
        this.numero = numero;
        this.capacidad = capacidad;
    }

    // Getter y Setter para numero
    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    // Getter y Setter para capacidad
    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCapacidad() {
        return capacidad;
    }
}
