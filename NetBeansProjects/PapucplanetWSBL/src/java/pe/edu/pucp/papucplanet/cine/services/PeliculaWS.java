package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.PeliculaDAO;
import pe.edu.pucp.papucplanet.cine.model.Genero;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.mysql.PeliculaMySQL;

@WebService(serviceName = "PeliculaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class PeliculaWS {
    
    private PeliculaDAO daoPelicula;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<Pelicula> listarTodos() {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
    
    /*public int insertar (@WebParam(name = "pelicula")Pelicula pelicula, @WebParam(name = "genero") Genero genero)*/
    @WebMethod(operationName = "insertar")
    public int insertar (@WebParam(name = "pelicula")Pelicula pelicula) {
        int resultado = 0;
        try{
            /*pelicula.setGenero(genero);*/
            daoPelicula = new PeliculaMySQL();
            resultado = daoPelicula.insertar(pelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificar")
    public int modificar(@WebParam(name = "pelicula") Pelicula pelicula){
        int resultado = 0;
        try{
            daoPelicula = new PeliculaMySQL();
            resultado = daoPelicula.modificar(pelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminar")
    public int eliminar(@WebParam(name = "idPelicula") int idPelicula){
        int resultado = 0;
        try{
            daoPelicula = new PeliculaMySQL();
            resultado = daoPelicula.eliminar(idPelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorId")
    public Pelicula obtenerPorId(@WebParam(name = "idPelicula") int idPelicula){
        Pelicula pelicula = null;
        try{
            daoPelicula = new PeliculaMySQL();
            pelicula = daoPelicula.obtenerPorId(idPelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return pelicula;
    }
    
    @WebMethod(operationName = "listarGeneros")
    public ArrayList<Genero> listarGeneros(){
        ArrayList<Genero> generos = null;
        try{
            daoPelicula = new PeliculaMySQL();
            generos = daoPelicula.listarGeneros();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return generos;
    }
    
    @WebMethod(operationName = "listarPorNombre")
    public ArrayList<Pelicula> listarPorNombre(@WebParam(name = "nombre") String nombre) {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarPorNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
}
