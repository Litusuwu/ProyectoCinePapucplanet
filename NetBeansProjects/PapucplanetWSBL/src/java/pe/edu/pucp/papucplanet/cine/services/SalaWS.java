
package pe.edu.pucp.papucplanet.cine.services;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.mysql.SalaMySQL;

@WebService(serviceName = "SalaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class SalaWS {

    private SalaDAO daoSala;

    @WebMethod(operationName = "listarTodosSala")
    public ArrayList<Sala> listarTodosSala() {
        ArrayList<Sala> salas = null;
        try {
            daoSala = new SalaMySQL();
            salas = daoSala.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return salas;
    }

    @WebMethod(operationName = "insertarSala")
    public int insertarSala(@WebParam(name = "sala") Sala sala) {
        int resultado = 0;
        try {
            daoSala = new SalaMySQL();
            resultado = daoSala.insertar(sala);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "modificarSala")
    public int modificarSala(@WebParam(name = "sala") Sala sala) {
        int resultado = 0;
        try {
            daoSala = new SalaMySQL();
            resultado = daoSala.modificar(sala);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "eliminarSala")
    public int eliminarSala(@WebParam(name = "idSala") int idSala) {
        int resultado = 0;
        try {
            daoSala = new SalaMySQL();
            resultado = daoSala.eliminar(idSala);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "obtenerPorIdSala")
    public Sala obtenerPorIdSala(@WebParam(name = "idSala") int idSala) {
        Sala sala = null;
        try {
            daoSala = new SalaMySQL();
            sala = daoSala.obtenerPorId(idSala);    
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return sala;
    }
    
    @WebMethod(operationName = "salasXIdsede")
    public ArrayList<Sala> salasXIdsede(@WebParam(name="idSede") int idSede) {
        ArrayList<Sala> salas = null;
        try{
            daoSala = new SalaMySQL();
            salas = daoSala.listarSalasxIdSede(idSede);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return salas;
    }
    
}
