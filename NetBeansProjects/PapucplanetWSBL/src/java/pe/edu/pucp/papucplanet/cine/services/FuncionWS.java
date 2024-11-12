package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.mysql.FuncionMySQL;

@WebService(serviceName = "FuncionWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class FuncionWS {

    private FuncionDAO daoFuncion;
    
    @WebMethod(operationName = "listarTodosFuncion")
    public ArrayList<Funcion> listarTodosFuncion() {
        ArrayList<Funcion> funciones = null;
        try{
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    
    @WebMethod(operationName = "insertarFuncion")
    public int insertarFuncion(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.insertar(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarFuncion")
    public int modificarFuncion(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.modificar(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarFuncion")
    public int eliminarFuncion(@WebParam(name = "idFuncion") int idFuncion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.eliminar(idFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorIdFuncion")
    public Funcion obtenerPorIdFuncion(@WebParam(name = "idFuncion") int idFuncion) {
        Funcion funcion = null;
        try {
            daoFuncion = new FuncionMySQL();
            funcion = daoFuncion.obtenerPorId(idFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funcion;
    }
    
    @WebMethod(operationName = "obtenerFuncionesPorPeliculaFuncion")
    public ArrayList<Funcion> obtenerFuncionesPorPeliculaFuncion(@WebParam(name = "idPelicula") int idPelicula) {
        ArrayList<Funcion> funciones = null;
        try {
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.obtenerFuncionesPorPelicula(idPelicula);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    
    @WebMethod(operationName = "listarFuncionesPorFecha")
    public ArrayList<Funcion> listarFuncionesPorFecha(@WebParam(name = "Funcion") Funcion funcion) {
        ArrayList<Funcion> funciones = null;
        try {
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.listarFuncionesPorFecha(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    @WebMethod(operationName = "listarPeliculasConFuncionesActivasFuncion")
    public ArrayList<Funcion> listarPeliculasConFuncionesActivasFuncion() {
        ArrayList<Funcion> funciones = null;
        try {
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.listarPeliculasConFuncionesActivas();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    
    @WebMethod(operationName = "modificarFuncionConButacasFuncion")
    public int modificarFuncionConButacasFuncion(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.modificarConButacasFuncion(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "estaDisponibleElHorario")
    public int estaDisponibleElHorario(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.verificarDisponibilidadHorario(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
}
