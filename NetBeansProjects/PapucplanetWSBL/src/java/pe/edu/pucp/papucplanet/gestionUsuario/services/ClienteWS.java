/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.ClienteDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.ClienteMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;
import java.util.ArrayList;
/**
 *
 * @author ISA
 */
@WebService(serviceName = "ClienteWS",targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class ClienteWS {

    private ClienteDAO daoCliente;
    /*
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    */
    @WebMethod(operationName = "insertarCliente")
    public int insertarCliente(@WebParam(name = "cliente") Cliente cliente) {
        int resultado = 0;
        try{
            daoCliente = new ClienteMySQL();
            resultado = daoCliente.insertar(cliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarCliente")
    public int modificarCliente(@WebParam(name = "cliente") Cliente cliente) {
        int resultado = 0;
        try{
            daoCliente = new ClienteMySQL();
            resultado = daoCliente.actualizar(cliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarTodosClientes")
    public ArrayList<Cliente> listarTodosClientes() {
        ArrayList<Cliente> clientes = null;
        try{
            daoCliente = new ClienteMySQL();
            clientes = daoCliente.listar();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return clientes;
    }
    @WebMethod(operationName = "obtenerClientePorId")
    public Cliente obtenerClientePorId(@WebParam(name = "idCliente") int idCliente) {
        Cliente cliente = null;
        try{
            daoCliente = new ClienteMySQL();
            cliente = daoCliente.obtenerPorCodigo(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cliente;
    }
    @WebMethod(operationName = "eliminarCliente")
    public int eliminarCliente(@WebParam(name = "idCliente") int idCliente) {
        int resultado = 0;
        try{
            daoCliente = new ClienteMySQL();
            resultado = daoCliente.eliminar(idCliente);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
}
