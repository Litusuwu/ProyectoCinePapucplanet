package pe.edu.pucp.papucplanet.compras.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.dao.BoletaDAO;
import pe.edu.pucp.papucplanet.compras.model.Boleta;
import pe.edu.pucp.papucplanet.compras.mysql.BoletaMySQL;

@WebService(serviceName = "BoletaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class BoletaWS {

    private BoletaDAO daoBoleta;
    
    @WebMethod(operationName = "listarTodasBoletas")
    public ArrayList<Boleta> listarTodasBoletas() {
        ArrayList<Boleta> boletas = null;
        try {
            daoBoleta = new BoletaMySQL();
            boletas = daoBoleta.listar();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return boletas;
    }
    
    @WebMethod(operationName = "insertarBoleta")
    public int insertarBoleta(@WebParam(name = "boleta") Boleta boleta) {
        int resultado = 0;
        try {
            daoBoleta = new BoletaMySQL();
            resultado = daoBoleta.insertar(boleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificarBoleta")
    public int modificarBoleta(@WebParam(name = "boleta") Boleta boleta) {
        int resultado = 0;
        try {
            daoBoleta = new BoletaMySQL();
            resultado = daoBoleta.actualizar(boleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarBoleta")
    public int eliminarBoleta(@WebParam(name = "idBoleta") int idBoleta) {
        int resultado = 0;
        try {
            daoBoleta = new BoletaMySQL();
            resultado = daoBoleta.eliminar(idBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerBoletaPorId")
    public Boleta obtenerBoletaPorId(@WebParam(name = "idBoleta") int idBoleta) {
        Boleta boleta = null;
        try {
            daoBoleta = new BoletaMySQL();
            boleta = daoBoleta.obtenerPorId(idBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return boleta;
    }
}
