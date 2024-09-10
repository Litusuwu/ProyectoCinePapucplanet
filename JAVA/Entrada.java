
class Entrada {
    private int numero;
    private Funcion funcion;
    private double precio;
    private Butaca butaca;

    // Constructor con parámetros
    public Entrada(int numero, Funcion funcion, double precio, Butaca butaca) {
        this.numero = numero;
        this.funcion = funcion;
        this.precio = precio;
        this.butaca = butaca;
    }

    // Getter y Setter para numero
    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    // Getter y Setter para funcion
    public void setFuncion(Funcion funcion) {
        this.funcion = funcion;
    }

    public Funcion getFuncion() {
        return funcion;
    }

    // Getter y Setter para precio
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getPrecio() {
        return precio;
    }

    // Getter y Setter para butaca
    public void setButaca(Butaca butaca) {
        this.butaca = butaca;
    }

    public Butaca getButaca() {
        return butaca;
    }
}
