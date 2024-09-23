/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pe.edu.pucp.papucp.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.AdministradorMySQL;

/**
 *
 * @author carlo
 */
public class Papucplanet {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParseException {
        // TODO code application logic here
        AdministradorDAO locura;
        locura = new AdministradorMySQL();
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = formato.parse("1990-01-01");
        Administrador administrador = new Administrador();
        administrador.setCodigo("A123");
        administrador.setDni("12345678");
        administrador.setNombre("Juan");
        administrador.setPrimerApellido("Pérez");
        administrador.setSegundoApellido("Sánchez");
        administrador.setGenero('M');
        administrador.setFechaNacimiento(fechaNacimiento);

        // Llamar al método para insertar el administrador
        locura.insertar(administrador);
        int resultado = locura.insertar(administrador);

        if (resultado == 1) {
            System.out.println("Administrador insertado correctamente con ID: " + administrador.getId());
        } else {
            System.out.println("Error al insertar administrador.");
        }
        int idAdministrador = 4;
        Administrador administrador1 = locura.obtenerPorCodigo(idAdministrador);

        if (administrador1 != null) {
            System.out.println("ID: " + administrador1.getId());
            System.out.println("DNI: " + administrador1.getDni());
            System.out.println("Nombre: " + administrador1.getNombre());
            System.out.println("Primer Apellido: " + administrador1.getPrimerApellido());
            System.out.println("Segundo Apellido: " + administrador1.getSegundoApellido());
            System.out.println("Genero: " + administrador1.getGenero());
            System.out.println("Fecha de Nacimiento: " + administrador1.getFechaNacimiento());
            System.out.println("Código: " + administrador1.getCodigo());
            System.out.println("Activo: " + administrador1.getActivo());
        } else {
            System.out.println("No se encontró un administrador con el ID: " + idAdministrador);
        }
        ArrayList<Administrador> administradores = locura.listar();
        for (Administrador ad : administradores) {
            System.out.println("ID: " + ad.getId());
            System.out.println("DNI: " + ad.getDni());
            System.out.println("Nombre: " + ad.getNombre());
            System.out.println("Primer Apellido: " + ad.getPrimerApellido());
            System.out.println("Segundo Apellido: " + ad.getSegundoApellido());
            System.out.println("Genero: " + ad.getGenero());
            System.out.println("Fecha de Nacimiento: " + ad.getFechaNacimiento());
            System.out.println("Código: " + ad.getCodigo());
            System.out.println("Activo: " + ad.getActivo());
        }
//        System.out.println("hola!");
    }
    
}
