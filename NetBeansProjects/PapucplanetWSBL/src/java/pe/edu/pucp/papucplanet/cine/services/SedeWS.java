package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.cine.mysql.SedeMySQL;

@WebService(serviceName = "SedeWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class SedeWS {

    private SedeDAO daoSede;
    
    @WebMethod(operationName = "listarTodosSede")
    public ArrayList<Sede> listarTodosSede() {
        ArrayList<Sede> sedes = null;
        try{
            daoSede = new SedeMySQL();
            sedes = daoSede.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sedes;
    }
    
    @WebMethod(operationName = "insertarSede")
    public int insertarSede(@WebParam(name="sede") Sede sede) {
        int resultado=0;
        try{
            daoSede = new SedeMySQL();
            resultado = daoSede.insertar(sede);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarSede")
    public int eliminarSede(@WebParam(name="idSede") int idSede) {
        int resultado=0;
        try{
            daoSede = new SedeMySQL();
            resultado = daoSede.eliminar(idSede);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorIdSede")
    public Sede obtenerPorIdSede(@WebParam(name = "idSede") int idSede){
        Sede sede = null;
        try{
            daoSede = new SedeMySQL();
            sede = daoSede.obtenerPorId(idSede);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sede;
    }
    
    @WebMethod(operationName = "modificarSede")
    public int modificarSede(@WebParam(name="sede") Sede sede) {
        int resultado=0;
        try{
            daoSede = new SedeMySQL();
            resultado = daoSede.modificar(sede);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
}
