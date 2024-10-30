/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.confiteria.services;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;

@WebService(serviceName = "BebidaWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class BebidaWS {

    private BebidaDAO daoBebida;

    @WebMethod(operationName = "listarTodasBebidas")
    public ArrayList<Bebida> listarTodasBebidas() {
        ArrayList<Bebida> bebidas = null;
        try {
            daoBebida = new BebidaMySQL();
            bebidas = daoBebida.listar();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return bebidas;
    }

    @WebMethod(operationName = "insertarBebida")
    public int insertarBebida(@WebParam(name = "bebida") Bebida bebida) {
        int resultado = 0;
        try {
            daoBebida = new BebidaMySQL();
            resultado = daoBebida.insertar(bebida);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "actualizarBebida")
    public int actualizarBebida(@WebParam(name = "bebida") Bebida bebida) {
        int resultado = 0;
        try {
            daoBebida = new BebidaMySQL();
            resultado = daoBebida.actualizar(bebida);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "eliminarBebida")
    public int eliminarBebida(@WebParam(name = "idBebida") int idBebida) {
        int resultado = 0;
        try {
            daoBebida = new BebidaMySQL();
            resultado = daoBebida.eliminar(idBebida);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "obtenerPorIdBebida")
    public Bebida obtenerBebidaPorId(@WebParam(name = "idBebida") int idBebida) {
        Bebida bebida = null;
        try {
            daoBebida = new BebidaMySQL();
            bebida = daoBebida.obtenerPorId(idBebida);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return bebida;
    }
    
}
