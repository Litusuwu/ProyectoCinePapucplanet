/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.cine.services;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.mysql.ButacaFuncionMySQL;

/**
 *
 * @author ARQ-GUEVARA
 */
@WebService(serviceName = "ButacaFuncionWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class ButacaFuncionWS {

    private ButacaFuncionDAO daoButacaFuncion;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<ButacaFuncion> listarTodos() {
        ArrayList<ButacaFuncion> butacasFunciones = null;
        try {
            daoButacaFuncion = new ButacaFuncionMySQL();
            butacasFunciones = daoButacaFuncion.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return butacasFunciones;
    }
    
    @WebMethod(operationName = "insertar")
    public int insertar(@WebParam(name = "butacaFuncion") ButacaFuncion butacaFuncion) {
        int resultado = 0;
        try {
            daoButacaFuncion = new ButacaFuncionMySQL();
            resultado = daoButacaFuncion.insertar(butacaFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificar")
    public int modificar(@WebParam(name = "butacaFuncion") ButacaFuncion butacaFuncion) {
        int resultado = 0;
        try {
            daoButacaFuncion = new ButacaFuncionMySQL();
            resultado = daoButacaFuncion.modificar(butacaFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminar")
    public int eliminar(@WebParam(name = "idButacaFuncion") int idButacaFuncion) {
        int resultado = 0;
        try {
            daoButacaFuncion = new ButacaFuncionMySQL();
            resultado = daoButacaFuncion.eliminar(idButacaFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorId")
    public ButacaFuncion obtenerPorId(@WebParam(name = "idButacaFuncion") int idButacaFuncion) {
        ButacaFuncion butacaFuncion = null;
        try {
            daoButacaFuncion = new ButacaFuncionMySQL();
            butacaFuncion = daoButacaFuncion.obtenerPorId(idButacaFuncion);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return butacaFuncion;
    }
}
