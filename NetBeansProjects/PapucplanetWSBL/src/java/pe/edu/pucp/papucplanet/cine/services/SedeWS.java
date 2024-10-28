package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.cine.mysql.SedeMySQL;

@WebService(serviceName = "SedeWS")
public class SedeWS {

    private SedeDAO daoSede;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<Sede> listarTodos() {
        ArrayList<Sede> sedes = null;
        try{
            daoSede = new SedeMySQL();
            sedes = daoSede.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return sedes;
    }
}
