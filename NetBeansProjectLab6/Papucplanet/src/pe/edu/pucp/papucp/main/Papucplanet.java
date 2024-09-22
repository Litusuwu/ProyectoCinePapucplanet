/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pe.edu.pucp.papucp.main;

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
    public static void main(String[] args) {
        // TODO code application logic here
        AdministradorDAO locura;
        locura = new AdministradorMySQL();
        
        Administrador Patricia;
        Patricia = new Administrador();
        Patricia.setCodigo("A20216177");
        Patricia.setCorreo("patricia@gmail.com");
        Patricia.setDni("73363843");
        Patricia.setNombre("Patty");
        Patricia.setPrimerApellido("Cantaro");
        Patricia.setSegundoApellido("Marquez");
        
        locura.insertar(Patricia);
        
        System.out.println("hola!");
    }
    
}
