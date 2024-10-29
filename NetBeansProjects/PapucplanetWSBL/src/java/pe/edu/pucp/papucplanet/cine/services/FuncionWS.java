
package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.mysql.FuncionMySQL;

@WebService(serviceName = "FuncionWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class FuncionWS {

    private FuncionDAO daoFuncion;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<Funcion> listarTodos() {
        ArrayList<Funcion> funciones = null;
        try {
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    
    @WebMethod(operationName = "insertar")
    public int insertar(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.insertar(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificar")
    public int modificar(@WebParam(name = "funcion") Funcion funcion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.modificar(funcion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminar")
    public int eliminar(@WebParam(name = "idFuncion") int idFuncion) {
        int resultado = 0;
        try {
            daoFuncion = new FuncionMySQL();
            resultado = daoFuncion.eliminar(idFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorId")
    public Funcion obtenerPorId(@WebParam(name = "idFuncion") int idFuncion) {
        Funcion funcion = null;
        try {
            daoFuncion = new FuncionMySQL();
            funcion = daoFuncion.obtenerPorId(idFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funcion;
    }
    
    @WebMethod(operationName = "obtenerFuncionesPorPelicula")
    public ArrayList<Funcion> obtenerFuncionesPorPelicula(@WebParam(name = "idPelicula") int idPelicula) {
        ArrayList<Funcion> funciones = null;
        try {
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.obtenerFuncionesPorPelicula(idPelicula);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
    
}
