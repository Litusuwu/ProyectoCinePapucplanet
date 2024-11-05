package pe.edu.pucp.papucplanet.cine.model;
import java.time.LocalTime;
import java.util.Date;
import java.util.ArrayList;

public class Funcion {
    private int idFuncion;
    private Date horarioInicio;
    private Date horarioFin;
    private Date dia;
    private Pelicula pelicula;
    private Sala sala;
    //private ArrayList<ButacaFuncion> butacasFuncion;
    private boolean activo;
    public Funcion(){
    }
    public Funcion(Date horarioInicio, Date horarioFin, Date dia, Pelicula pelicula, Sala sala) {
        this.horarioInicio = horarioInicio;
        this.horarioFin = horarioFin;
        this.dia = dia;
        this.pelicula = pelicula;
	this.sala=sala;
        this.activo = true;
    }
    //Setter y Getter para id

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
    }
    
    
    
    // Getter y Setter para horarioInicio
    public void setHorarioInicio(Date horarioInicio) {
        this.horarioInicio = horarioInicio;
    }

    public Date getHorarioInicio() {
        return horarioInicio;
    }

    // Getter y Setter para horarioFin
    public void setHorarioFin(Date horarioFin) {
        this.horarioFin = horarioFin;
    }

    public Date getHorarioFin() {
        return horarioFin;
    }

    // Getter y Setter para dia
    public void setDia(Date dia) {
        this.dia = dia;
    }

    public Date getDia() {
        return dia;
    }

    // Getter y Setter para pelicula
    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }

    public Pelicula getPelicula() {
        return pelicula;
    }

    // Getter y Setter para sala
    public void setSala(Sala sala) {
        this.sala = sala;
    }

    public Sala getSala() {
        return sala;
    }
	
/*
    public ArrayList<ButacaFuncion> getButacasFuncion(){
        return butacasFuncion;
//        return new ArrayList<>(butacasFuncion);
    }

    public void setButacasFuncion(ArrayList<ButacaFuncion> butacasFuncion){
        this.butacasFuncion = butacasFuncion;
    }
*/
    
    //Setter y Getter para activo
    public boolean isActivo(){
        return activo;
        
    }
    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public void consultarDatos() {
    }
    public String imprimirDatos(){
        String str = "---------------------------\n";
        
        return str;
    }
}
