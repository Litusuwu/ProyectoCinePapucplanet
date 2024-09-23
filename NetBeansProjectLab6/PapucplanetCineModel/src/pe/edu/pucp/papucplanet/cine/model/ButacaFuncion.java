package pe.edu.pucp.papucplanet.cine.model;
public class ButacaFuncion extends Butaca{
    private Funcion funcion;
    private double precio;
    private EstadoButaca estado;
    // Constructor con parámetros
    public ButacaFuncion(char fila, int columna, boolean discapacitado, Sala sala,Funcion funcion, double precio, EstadoButaca estado) {
	super( fila,  columna,  discapacitado, sala);
        this.funcion = funcion;
        this.precio = precio;
        this.estado = estado;
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
	    // Getter y Setter para estado
    public void setEstado(EstadoButaca estado) {
        this.estado = estado;
    }

    public EstadoButaca getEstado() {
        return estado;
    }
    // Método para reservar la butaca
    /*
    public void reservarButaca() {
        if (this.estado == EstadoButaca.DISPONIBLE) {
            this.estado = EstadoButaca.RESERVADA;
            System.out.println("Butaca " + getFila() +  getFila() + " reservada.");
        } else {
            System.out.println("La butaca no está disponible para reservar.");
        }
    }
    */
    /*
    // Método para verificar si la butaca está disponible
    public boolean estaDisponible() {
        return this.estado == EstadoButaca.DISPONIBLE;
    }
    */
    // Método para mostrar información de la butaca
    /*
    public void mostrarInformacionButaca() {
		Sala sala=getSala();
        System.out.println("Butaca en sala " + sala.getIdSala() + ": Fila " +  getFila() + ", Columna " +  getFila());
        System.out.println("Estado: " + estado);
        System.out.println("Apta para discapacitados: " + (isDiscapacitado() ? "Sí" : "No"));
    }
    */
    
    public void ConsultarDatos(){
        
    }
    
}
