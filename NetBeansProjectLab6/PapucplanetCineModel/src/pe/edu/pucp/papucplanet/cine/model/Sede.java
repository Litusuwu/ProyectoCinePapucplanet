package pe.edu.pucp.papucplanet.cine.model;
import java.util.ArrayList;

public class Sede {
    private int idSede;
    private String universidad;
    private String ubicacion;
    //posee un arrayList de salas
    //private ArrayList<Sala> salas;
    private boolean activo;
    
    public Sede(){
        
    }
    // Constructor con parámetros
    public Sede( String universidad, String ubicacion) {
	//	this.id=id;
        this.universidad = universidad;
        this.ubicacion = ubicacion;
        this.activo = true;
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


    public int getIdSede() {
        return idSede;
    }
    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    //Setter y Getter para activo
    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    public String imprimirDatos(){
        String str = "--------------------------------\n";
        str += "ID: " + this.getIdSede()+ "\n";
        str +=  "Universidad: " + this.getUniversidad()+ "\n";
        str +=  "Ubicacion: " + this.getUbicacion();
        return str;
    }
    // Método para eliminar una sala por índice
    /*
    public void eliminarSala(int indice) {
        if (indice >= 0 && indice < salas.size()) {
            Sala salaEliminada = salas.remove(indice);
            System.out.println("Sala eliminada: " + salaEliminada.getIdSala());
        } else {
            System.out.println("Índice fuera de rango");
        }
    }
    */
    // Método para mostrar todas las salas de la sede -> DE LA INTERFAZ
    /*
    public void imprimirSedes() {
        if (salas.isEmpty()) {
            System.out.println("No hay salas en la sede.");
        } else {
            System.out.println("Salas en la sede:");
            for (Sala sala : salas) {
                System.out.println(" - Sala número: " + sala.getIdSala() + " con capacidad de: " + sala.getCapacidad() + " personas");
            }
        }
    }
    */
    //    public ArrayList<Sala> getSalas(){
//        return salas;
////        return new ArrayList<>(salas);
//    }
//
//    public void setSalas(ArrayList<Sala> salas){
//        this.salas = salas;
//    }
    
    

    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////
    // Método para agregar una nueva sala
    /*
    public void agregarSala(Sala sala) {
    this.salas.add(sala);
    System.out.println("Sala agregada en la sede: " + sala.getIdSala());
    }
     */
}
