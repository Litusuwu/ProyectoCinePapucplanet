/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pe.edu.pucp.papucp.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.confiteria.model.TipoAlimento;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.ClienteDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.CuentaDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cuenta;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Usuario;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.AdministradorMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.ClienteMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.CuentaMySQL;

/**
 *
 * @author carlo
 */
public class Papucplanet {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
          // Test ADMIN
        AdministradorDAO locura;
        locura = new AdministradorMySQL();
        int resultado;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = formato.parse("1990-01-01");
        Administrador administrador = new Administrador();
        administrador.setCodigo("A123");
        administrador.setDni("12345678");
        administrador.setNombre("Lucas");
        administrador.setPrimerApellido("Chad");
        administrador.setSegundoApellido("Sigma");
        administrador.setGenero('M');
        administrador.setFechaNacimiento(fechaNacimiento);

        // Llamar al método para insertar el administrador
        locura.insertar(administrador);
        resultado = locura.insertar(administrador);
        
        if (resultado > 0) {
            System.out.println("Administrador insertado correctamente con ID: " + administrador.getId());
        } else {
            System.out.println("Error al insertar administrador." + administrador.getId());
        }
        int idAdministrador = 24;
        Administrador administrador1 = locura.obtenerPorCodigo(idAdministrador);

        if (administrador1 != null) {
            String str = administrador1.imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un administrador con el ID: " + idAdministrador);
        }
        ArrayList<Administrador> administradores = locura.listar();
        for (Administrador ad : administradores) {
            String str = ad.imprimirDatos();
            System.out.println(str);
        }
        locura.eliminar(5);
        if (resultado > 0) {
            System.out.println("Administrador eliminado correctamente con ID: 5");
        } else {
            System.out.println("Error al eliminar administrador.");
        }
        administrador1 = locura.obtenerPorCodigo(5);

        if (administrador1 != null) {
            String str = administrador1.imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un administrador con el ID: " + idAdministrador);
        }
        System.out.println("hola!");

        //Test Cuenta
        ClienteDAO clienteDAO;
        Sede sede;

        clienteDAO = new ClienteMySQL();
        Cliente cliente = new Cliente();
        sede = new Sede();
        sede.setIdSede(1);
        sede.setUniversidad("Sede PUCP");
        sede.setUbicacion("Av.Universitaria");
        cliente.setDni("76211902");
        cliente.setNombre("Guanira");
        cliente.setPrimerApellido("Erasmo");
        cliente.setSegundoApellido("Allasi");
        cliente.setGenero('F');
        cliente.setFechaNacimiento(fechaNacimiento);
        cliente.setSede(sede);
        
        resultado = clienteDAO.insertar(cliente);
        if(resultado > 0){
            System.out.println("Cliente insertado con el ID : " +  cliente.getId());
        }
        else{
            System.out.println("No se pudo insertar al cliente.");
        }
        int idCliente = 57;
        cliente = null;
        cliente = clienteDAO.obtenerPorCodigo(59);

        if (cliente != null) {
            String str = cliente.imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un cliente con el ID: " + idCliente);
        }
        cliente.setNombre("Guanira");
        resultado = clienteDAO.actualizar(cliente);
        if (resultado > 0) {
            String str = clienteDAO.obtenerPorCodigo(59).imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un cliente con el ID: " + idCliente);
        }
        ArrayList<Cliente> clientes = clienteDAO.listar();
        for (Cliente cli : clientes) {
            String str = cli.imprimirDatos();
            System.out.println(str);
        }
        resultado = clienteDAO.eliminar(59);
        if (resultado > 0) {
            String str = clienteDAO.obtenerPorCodigo(59).imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se elimino un cliente con el ID: " + idCliente);
        }
        //Test Cliente
        CuentaDAO cuentaDAO;

        cuentaDAO = new CuentaMySQL();
        Cuenta cuenta = new Cuenta();
        cuenta.setCorreo("vegetta777OMGRexXx@pucp.edu.pe");
        cuenta.setPassword("GuaniraXErasmo");
        cuenta.setUsuario(administrador);
        resultado = cuentaDAO.insertar(cuenta);
        if(resultado > 0){
            System.out.println("Cuenta insertada con el ID : " +  cuenta.getUsuario().getId());
        }
        else{
            System.out.println("No se pudo insertar la cuenta.");
        }
        
        
        cuenta = cuentaDAO.obtenerPorCodigo(administrador.getId());

        if (cuenta != null) {
            String str = cuenta.imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un cliente con el ID: " + administrador.getId());
        }
        cuenta.setCorreo("guaniraPROgamer");
        resultado = cuentaDAO.actualizar(cuenta);
        if (resultado > 0) {
            String str = cuentaDAO.obtenerPorCodigo(administrador.getId()).imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se encontró un cliente con el ID: " + administrador.getId());
        }
        ArrayList<Cuenta> cuentas = cuentaDAO.listar();
        for (Cuenta cu : cuentas) {
            String str = cu.imprimirDatos();
            System.out.println(str);
        }
        resultado = cuentaDAO.eliminar(administrador.getId());
        if (resultado > 0) {
            String str = cuentaDAO.obtenerPorCodigo(administrador.getId()).imprimirDatos();
            System.out.println(str);
        } else {
            System.out.println("No se elimino un cliente con el ID: " + administrador.getId());
        }
    }
    
}
