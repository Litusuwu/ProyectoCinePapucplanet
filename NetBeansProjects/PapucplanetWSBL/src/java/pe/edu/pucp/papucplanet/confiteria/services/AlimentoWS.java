/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.confiteria.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;

@WebService(serviceName = "AlimentoWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class AlimentoWS {

    private AlimentoDAO daoAlimento;

    @WebMethod(operationName = "listarTodosAlimentos")
    public ArrayList<Alimento> listarTodosAlimentos() {
        ArrayList<Alimento> alimentos = null;
        try {
            daoAlimento = new AlimentoMySQL();
            alimentos = daoAlimento.listar();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return alimentos;
    }
    @WebMethod(operationName = "listarAlimentosPorNombre")
    public ArrayList<Alimento> listarAlimentosPorNombre(@WebParam(name = "nombreAlimento")
            String nombreAlimento) {
        ArrayList<Alimento> alimentos = null;
        try {
            daoAlimento = new AlimentoMySQL();
            alimentos = daoAlimento.listarPorNombre(nombreAlimento);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return alimentos;
    }

    @WebMethod(operationName = "insertarAlimento")
    public int insertarAlimento(@WebParam(name = "alimento") Alimento alimento) {
        int resultado = 0;
        try {
            daoAlimento = new AlimentoMySQL();
            resultado = daoAlimento.insertar(alimento);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "actualizarAlimento")
    public int actualizarAlimento(@WebParam(name = "alimento") Alimento alimento) {
        int resultado = 0;
        try {
            daoAlimento = new AlimentoMySQL();
            resultado = daoAlimento.actualizar(alimento);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "eliminarAlimento")
    public int eliminarAlimento(@WebParam(name = "idAlimento") int idAlimento) {
        int resultado = 0;
        try {
            daoAlimento = new AlimentoMySQL();
            resultado = daoAlimento.eliminar(idAlimento);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }

    @WebMethod(operationName = "obtenerPorIdAlimento")
    public Alimento obtenerAlimentoPorId(@WebParam(name = "idAlimento") int idAlimento) {
        Alimento alimento = null;
        try {
            daoAlimento = new AlimentoMySQL();
            alimento = daoAlimento.obtenerPorId(idAlimento);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return alimento;
    }
    
}
