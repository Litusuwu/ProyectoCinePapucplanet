/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.CuentaDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.CuentaMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cuenta;
import java.util.ArrayList;
/**
 *
 * @author ISA
 */
@WebService(serviceName = "CuentaWS",targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class CuentaWS {

    private CuentaDAO daoCuenta;
    /*
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    */
    @WebMethod(operationName = "insertarCuenta")
    public int insertarCuenta(@WebParam(name = "usuario") Cuenta usuario) {
        int resultado = 0;
        try{
            daoCuenta = new CuentaMySQL();
            resultado = daoCuenta.insertar(usuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarCuenta")
    public int modificarCuenta(@WebParam(name = "usuario") Cuenta usuario) {
        int resultado = 0;
        try{
            daoCuenta = new CuentaMySQL();
            resultado = daoCuenta.actualizar(usuario); //modificar
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "eliminarCuenta")
    public int eliminarCuenta(@WebParam(name = "idCuenta") int idCuenta) {
        int resultado = 0;
        try{
            daoCuenta = new CuentaMySQL();
            resultado = daoCuenta.eliminar(idCuenta); //modificar
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarTodasCuentas")
    public ArrayList<Cuenta> listarTodasCuentas() {
        ArrayList<Cuenta> cuentas = null;
        try{
            daoCuenta = new CuentaMySQL();
            cuentas = daoCuenta.listar(); //modificar
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cuentas;
    }
    @WebMethod(operationName = "obtenerCuentaPorId")
    public Cuenta obtenerCuentaPorId(@WebParam(name = "idCuenta") int idCuenta) {
        Cuenta cuenta = null;
        try{
            daoCuenta = new CuentaMySQL();
            cuenta = daoCuenta.obtenerPorCodigo(idCuenta); //modificar
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return cuenta;
    }
    @WebMethod(operationName = "verificarCuenta")
    public int verificarCuenta(@WebParam(name = "usuario") Cuenta usuario) {
        int resultado = 0;
        try{
            daoCuenta = new CuentaMySQL();
            resultado = daoCuenta.verificar(usuario);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
}
