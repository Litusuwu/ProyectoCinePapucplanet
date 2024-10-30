
package pe.edu.pucp.papucplanet.cine.services;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.mysql.ButacaMySQL;

@WebService(serviceName = "ButacaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class ButacaWS {

    private ButacaDAO daoButaca;
    
    @WebMethod(operationName = "listarTodosButaca")
    public ArrayList<Butaca> listarTodosButaca() {
        ArrayList<Butaca> butacas = null;
        try {
            daoButaca = new ButacaMySQL();
            butacas = daoButaca.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return butacas;
    }
    
    @WebMethod(operationName = "insertarButaca")
    public int insertarButaca(@WebParam(name = "butaca") Butaca butaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.insertar(butaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarButaca")
    public int modificarButaca(@WebParam(name = "butaca") Butaca butaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.modificar(butaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarButaca")
    public int eliminarButaca(@WebParam(name = "idButaca") int idButaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.eliminar(idButaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorIdButaca")
    public Butaca obtenerPorIdButaca(@WebParam(name = "idButaca") int idButaca) {
        Butaca butaca = null;
        try {
            daoButaca = new ButacaMySQL();
            butaca = daoButaca.obtenerPorId(idButaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return butaca;
    }
}
