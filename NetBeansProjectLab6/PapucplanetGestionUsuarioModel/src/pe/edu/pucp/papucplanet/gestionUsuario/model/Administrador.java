package pe.edu.pucp.papucplanet.gestionUsuario.model;

import java.util.Date;

public class  Administrador extends Usuario{
	
    private String codigo;
    
    public Administrador(){
        super();
    }
    // Constructor que llama al constructor de Usuario
    public Administrador(String dni, String nombre,
                         String primerApellido, String segundoApellido, char genero,
                         Date fechaNacimiento, String correo, String contrasena,
                         boolean activo, String codigo) {
        super(dni, nombre,  primerApellido, segundoApellido, genero, fechaNacimiento,
                correo, contrasena, activo);
        this.codigo = codigo;
    }

    // Getter para codigo
    public String getCodigo() {
        return codigo;
    }

    // Setter para codigo
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    @Override
    public String obtenerDatos(){
        String str = "--------------------------------------\n";
        str += "ID: " + this.getId() + "\n";
        str +=  "DNI: " + this.getDni() + "\n";
        str +=  "Nombre: " + this.getNombre() + "\n";
        str +=  "Primer Apellido: " + this.getPrimerApellido() + "\n";
        str += "Segundo Apellido: " + this.getSegundoApellido() + "\n";
        str += "Genero: " + this.getGenero() + "\n";
        str += "Fecha de Nacimiento: " + this.getFechaNacimiento() + "\n";
        str += "Codigo: " + this.getCodigo() + "\n";
        str += "Activo: " + this.isActivo();
        return str;
    }

    @Override
    public String emitirReporte() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
