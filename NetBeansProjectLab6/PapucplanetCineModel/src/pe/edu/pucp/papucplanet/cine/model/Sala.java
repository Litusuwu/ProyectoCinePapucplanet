package pe.edu.pucp.papucplanet.cine.model;

public class Sala {
    private int idSala;
    private int capacidad;
    private Sede sede;

    public Sala(int idSala, int capacidad,Sede sede) {
        this.idSala = idSala;
        this.capacidad = capacidad;
		this.sede=sede;
    }

    // Getter y Setter para numero
    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getIdSala() {
        return idSala;
    }

    // Getter y Setter para capacidad
    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getCapacidad() {
        return capacidad;
    }
    
    public void setSede(Sede sede){
    	this.sede=sede;
    }
	
    public Sede getSede() {
        return sede;
    }	
	/*
    public ArrayList<Butaca> getButacas(){
        return new ArrayList<>(butacas);
    }

    public void setButacas(ArrayList<Butaca> butacas){
        this.butacas = butacas; RECUERDA BORRAR
    }
	*/
	
    //////////////////////////////////////////////////////////////////METODOS///////////////////////////////////////////////////////////////////////////


    // Método para mostrar todas las funciones en la sala 
	/*
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
	*/
    // Método para actualizar la cantidad de asientos disponibles
    /*
	public int actualizarAsientosDisponibles() {
        int asientosDisponibles = 0;
        for (Butaca butaca : butacas) {
            if (butaca.getEstado() == EstadoButaca.DISPONIBLE) {
                asientosDisponibles++;
            }
        }
        return asientosDisponibles;
    }
	*/
}
