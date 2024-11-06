package pe.edu.pucp.papucplanet.cine.model;

public class Sala {
     private int idSala;
    private int capacidad;
    private int numeroSala;
    private int numCol;
    private int numFila;
    private Sede sede;
    private boolean activo;

    public Sala(){
    }

    public Sala( int capacidad,int numeroSala,Sede sede) {
        //this.idSala = idSala;
        this.numeroSala = numeroSala;
        this.capacidad = capacidad;
    this.sede=sede;
        this.activo = true;
    }

    public int getNumCol() {
        return numCol;
    }

    public void setNumCol(int numCol) {
        this.numCol = numCol;
    }

    public int getNumFila() {
        return numFila;
    }

    public void setNumFila(int numFila) {
        this.numFila = numFila;
    }
    
    // Getter y Setter para numero_sala
    public void setNumeroSala(int numeroSala) {
        this.numeroSala = numeroSala;
    }

    public int getNumeroSala() {
        return numeroSala;
    }
    // Getter y Setter para id
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
    //Setter y Getter para activo
    
    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    public String imprimirDatos(){
        String str = "--------------------------------\n";
        str += "ID: " + this.getIdSala()+ "\n";
        str +=  "Capacidad: " + this.getCapacidad()+ "\n";
        str +=  "Numero Sala: " + this.getNumeroSala()+ "\n";
        str +=  "Sede ID: " + this.getSede().getIdSede()+ "\n";
        str +=  "Activo: " + this.isActivo();
        return str;
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
