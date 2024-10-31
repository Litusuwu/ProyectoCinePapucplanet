package pe.edu.pucp.papucplanet.compras.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.dao.LineaBoletaDAO;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;
import pe.edu.pucp.papucplanet.compras.mysql.LineaBoletaMySQL;

@WebService(serviceName = "LineaBoletaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class LineaBoletaWS {

    private LineaBoletaDAO daoLineaBoleta;

    @WebMethod(operationName = "listarTodosLineaBoleta")
    public ArrayList<LineaBoleta> listarTodosLineaBoleta() {
        ArrayList<LineaBoleta> lineasBoletas = null;
        try {
            daoLineaBoleta = new LineaBoletaMySQL();
            lineasBoletas = daoLineaBoleta.listar();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return lineasBoletas;
    }

    @WebMethod(operationName = "insertarLineaBoleta")
    public int insertarLineaBoleta(@WebParam(name = "lineaBoleta") LineaBoleta lineaBoleta) {
        int resultado = 0;
        try {
            daoLineaBoleta = new LineaBoletaMySQL();
            resultado = daoLineaBoleta.insertar(lineaBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "modificarLineaBoleta")
    public int modificarLineaBoleta(@WebParam(name = "lineaBoleta") LineaBoleta lineaBoleta) {
        int resultado = 0;
        try {
            daoLineaBoleta = new LineaBoletaMySQL();
            resultado = daoLineaBoleta.actualizar(lineaBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "eliminarLineaBoleta")
    public int eliminarLineaBoleta(@WebParam(name = "idLineaBoleta") int idLineaBoleta) {
        int resultado = 0;
        try {
            daoLineaBoleta = new LineaBoletaMySQL();
            resultado = daoLineaBoleta.eliminar(idLineaBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "obtenerPorIdLineaBoleta2")
    public LineaBoleta obtenerPorIdLineaBoleta(@WebParam(name = "idLineaBoleta") int idLineaBoleta) {
        LineaBoleta lineaBoleta = null;
        try {
            daoLineaBoleta = new LineaBoletaMySQL();
            lineaBoleta = daoLineaBoleta.obtenerPorId(idLineaBoleta);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return lineaBoleta;
    }
}
