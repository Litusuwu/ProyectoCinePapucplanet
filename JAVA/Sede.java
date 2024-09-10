import java.util.ArrayList;

class Sede {
    private String universidad;
    private String ubicacion;
    //posee un arrayList de salas
    private ArrayList<Sala> salas;

    // Constructor con parámetros
    public Sede(String universidad, String ubicacion) {
        this.universidad = universidad;
        this.ubicacion = ubicacion;
    }

    // Getter y Setter para universidad
    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public String getUniversidad() {
        return universidad;
    }

    // Getter y Setter para ubicacion
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public ArrayList<Sala> getSalas(){
        return new ArrayList<>(salas);
    }

    public void setSalas(ArrayList<Sala> salas){
        this.salas = salas;
    }

    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////

    // Método para agregar una nueva sala
    public void agregarSala(Sala sala) {
        this.salas.add(sala);
        System.out.println("Sala agregada en la sede: " + sala.getNumero());
    }

    // Método para eliminar una sala por índice
    public void eliminarSala(int indice) {
        if (indice >= 0 && indice < salas.size()) {
            Sala salaEliminada = salas.remove(indice);
            System.out.println("Sala eliminada: " + salaEliminada.getNumero());
        } else {
            System.out.println("Índice fuera de rango");
        }
    }

    // Método para mostrar todas las salas de la sede -> DE LA INTERFAZ
    public void imprimirSedes() {
        if (salas.isEmpty()) {
            System.out.println("No hay salas en la sede.");
        } else {
            System.out.println("Salas en la sede:");
            for (Sala sala : salas) {
                System.out.println(" - Sala número: " + sala.getNumero() + " con capacidad de: " + sala.getCapacidad() + " personas");
            }
        }
    }
    
}
