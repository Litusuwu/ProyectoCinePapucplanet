import java.util.ArrayList;

class Sala {
    private int numero;
    private int capacidad;
    //posee un arrayList de funciones
    private ArrayList<Funcion> funciones;
    private ArrayList<Butaca> butacas;

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

    public ArrayList<Funcion> getFunciones(){
        return new ArrayList<>(funciones);
    }

    public void setFunciones(ArrayList<Funcion> funciones){
        this.funciones = funciones;
    }

    public ArrayList<Butaca> getButacas(){
        return new ArrayList<>(butacas);
    }

    public void setButacas(ArrayList<Butaca> butacas){
        this.butacas = butacas;
    }

    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////

    // Método para agregar una nueva función
    public void agregarFuncion(Funcion funcion) {
        this.funciones.add(funcion);
        System.out.println("Función agregada en la sala " + numero + ": " + funcion.getDia() + " a las " + funcion.getHorarioInicio());
    }

    // Método para eliminar una función por índice
    public void eliminarFuncion(int indice) {
        if (indice >= 0 && indice < funciones.size()) {
            this.funciones.remove(indice);
            System.out.println("Función eliminada de la sala " + numero);
        } else {
            System.out.println("Índice fuera de rango");
        }
    }

    // Método para mostrar todas las funciones en la sala 
    public void imprimirSalas() {
        if (funciones.isEmpty()) {
            System.out.println("No hay funciones programadas para la sala " + numero);
        } else {
            System.out.println("Funciones en la sala " + numero + ":");
            for (Funcion funcion : funciones) {
                System.out.println(" - " + funcion.getDia() + " a las " + funcion.getHorarioInicio());
            }
        }
    }

    // Método para actualizar la cantidad de asientos disponibles
    public int actualizarAsientosDisponibles() {
        int asientosDisponibles = 0;
        for (Butaca butaca : butacas) {
            if (butaca.getEstado() == EstadoButaca.DISPONIBLE) {
                asientosDisponibles++;
            }
        }
        return asientosDisponibles;
    }

}
