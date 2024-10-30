/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.mysql.ButacaMySQL;

/**
 *
 * @author ARQ-GUEVARA
 */
@WebService(serviceName = "ButacaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class ButacaWS {

    private ButacaDAO daoButaca;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<Butaca> listarTodos() {
        ArrayList<Butaca> butacas = null;
        try {
            daoButaca = new ButacaMySQL();
            butacas = daoButaca.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return butacas;
    }
    
    @WebMethod(operationName = "insertar")
    public int insertar(@WebParam(name = "butaca") Butaca butaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.insertar(butaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "modificar")
    public int modificar(@WebParam(name = "butaca") Butaca butaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.modificar(butaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminar")
    public int eliminar(@WebParam(name = "idButaca") int idButaca) {
        int resultado = 0;
        try {
            daoButaca = new ButacaMySQL();
            resultado = daoButaca.eliminar(idButaca);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "obtenerPorId")
    public Butaca obtenerPorId(@WebParam(name = "idButaca") int idButaca) {
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
