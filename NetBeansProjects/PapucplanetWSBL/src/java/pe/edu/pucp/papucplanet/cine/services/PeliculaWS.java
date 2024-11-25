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
    
    @WebMethod(operationName = "listarTodosPelicula")
    public ArrayList<Pelicula> listarTodosPelicula() {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
    
    @WebMethod(operationName = "insertarPelicula")
    public int insertarPelicula (@WebParam(name = "pelicula")Pelicula pelicula) {
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
    
    @WebMethod(operationName = "modificarPelicula")
    public int modificarPelicula(@WebParam(name = "pelicula") Pelicula pelicula){
        int resultado = 0;
        try{
            daoPelicula = new PeliculaMySQL();
            resultado = daoPelicula.modificar(pelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarPelicula")
    public int eliminarPelicula(@WebParam(name = "idPelicula") int idPelicula){
        int resultado = 0;
        try{
            daoPelicula = new PeliculaMySQL();
            resultado = daoPelicula.eliminar(idPelicula);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorIdPelicula")
    public Pelicula obtenerPorIdPelicula(@WebParam(name = "idPelicula") int idPelicula){
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
    
    @WebMethod(operationName = "listarPorNombrePelicula")
    public ArrayList<Pelicula> listarPorNombrePelicula(@WebParam(name = "nombre") String nombre) {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarPorNombre(nombre);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
    
    @WebMethod(operationName = "listarTodosPeliculaSinFunciones")
    public ArrayList<Pelicula> listarTodosPeliculaSinFunciones() {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarPeliculasSinFunciones();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
}
