package pe.edu.pucp.papucplanet.cine.model;
//import pe.edu.pucp.papucplanet.cine.model.Genero;

import java.util.ArrayList;

public class Pelicula {
    private int idPelicula;
    private String titulo;
    private int duracion;
    private Genero genero;
    private String sinopsis;
    private boolean activo;
    private String imagenPromocional;   
    private ArrayList<Funcion> funciones;
    
    public Pelicula(){
        funciones = new ArrayList<>();
    }

    public Pelicula(String titulo, int duracion, Genero genero, String sinopsis, String imagenPromocional) {
        this.titulo = titulo;
        this.duracion = duracion;
        this.genero = genero;
        this.sinopsis = sinopsis;
        this.activo = true;
        this.imagenPromocional = imagenPromocional;
    }
    // Getter y Setter para titulo

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    // Getter y Setter para titulo
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getTitulo() {
        return titulo;
    }
    // Getter y Setter para duracion
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    public int getDuracion() {
        return duracion;
    }
    // Getter y Setter para genero
    public void setGenero(Genero genero) {
        this.genero = genero;
    }
    public Genero getGenero() {
        return genero;
    }
    // Getter y Setter para sinopsis
    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }
    public String getSinopsis() {
        return sinopsis;
    }
    //Setter y Getter para activo
    public boolean isActivo() {
        return activo;
    }
    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public ArrayList<Funcion> getFunciones(){
        return funciones;
    }

    public void setFunciones(ArrayList<Funcion> funciones){
        this.funciones = funciones;
    }
    
    public String getImagenPromocional() {
        return imagenPromocional;
    }

    public void setImagenPromocional(String imagenPromocional) {
        this.imagenPromocional = imagenPromocional;
    }
    
    public void agregarFuncion(Funcion func){
        funciones.add(func);
    }
    
    public String imprimirDatos(){
        String str = "--------------------------------\n";
        str += "ID: " + this.getIdPelicula()+ "\n";
        str +=  "Universidad: " + this.getTitulo()+ "\n";
        str +=  "Duracion: " + this.getDuracion() + "\n";
        str +=  "Genero: " + this.getGenero()+ "\n";
        str +=  "Sinopsis: " + this.getSinopsis()+ "\n";
        str +=  "Activo: " + this.isActivo();
        return str;
    }
}