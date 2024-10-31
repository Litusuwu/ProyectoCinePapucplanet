/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.AdministradorMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import java.util.ArrayList;
/**
 *
 * @author ISA
 */
@WebService(serviceName = "AdministradorWS",targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class AdministradorWS {
    private AdministradorDAO daoAdministrador;
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "insertarAdministrador")
    public int insertarAdministrador(@WebParam(name = "admin") Administrador admin) {
        int resultado = 0;
        try{
            daoAdministrador = new AdministradorMySQL();
            resultado = daoAdministrador.insertar(admin);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "modificarAdministrador")
    public int modificarAdministrador(@WebParam(name = "admin") Administrador admin) {
        int resultado = 0;
        try{
            daoAdministrador = new AdministradorMySQL();
            resultado = daoAdministrador.actualizar(admin);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    @WebMethod(operationName = "listarTodosAdministradores")
    public ArrayList<Administrador> listarTodosAdministradores() {
        ArrayList<Administrador> admins = null;
        try{
            daoAdministrador = new AdministradorMySQL();
            admins = daoAdministrador.listar();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return admins;
    }
    @WebMethod(operationName = "obtenerAdministradorPorId")
    public Administrador obtenerAdministradorPorId(@WebParam(name = "idAdmin") int idAdmin) {
        Administrador admin = null;
        try{
            daoAdministrador = new AdministradorMySQL();
            admin = daoAdministrador.obtenerPorCodigo(idAdmin);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return admin;
    }
    @WebMethod(operationName = "eliminarAdministrador")
    public int eliminarAdministrador(@WebParam(name = "idAdmin") int idAdmin) {
        int resultado = 0;
        try{
            daoAdministrador = new AdministradorMySQL();
            resultado = daoAdministrador.eliminar(idAdmin);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
}
