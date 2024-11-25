package pe.edu.pucp.papucplanet.gestionUsuario.model;

import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.Sede;
public class Cliente extends Usuario{	
    private Sede sede;
    
    public Cliente(){
        
    }
    public Cliente(String dni, String nombre,
                         String primerApellido, String segundoApellido, char genero,
                         Date fechaNacimiento, String correo, String contrasena,
                         boolean activo, Sede sede) {
        super(dni, nombre,  primerApellido, segundoApellido, genero, fechaNacimiento,
                correo, contrasena, activo);
        this.sede=sede;
    }
    
    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }
}
