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
        try{
            daoFuncion = new FuncionMySQL();
            funciones = daoFuncion.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return funciones;
    }
   
    
}
