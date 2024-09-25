package pe.edu.pucp.papucplanet.gestionUsuario.model;

import java.util.Date;

abstract public class Usuario implements IUsuario{

    private int id;
    private String dni;
    private String nombre;
    private String primerApellido;
    private String segundoApellido;
    private char genero;
    private Date fechaNacimiento;

    private boolean activo;
    
    // Constructor que asigna automáticamente el ID usando el correlativo
    public Usuario(){
        
    }
    public Usuario(String dni, String nombre,
                    String primerApellido, String segundoApellido, char genero,
                    Date fechaNacimiento, String correo, String contrasena,
                    boolean activo) {
        this.dni = dni;
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.genero = genero;
        this.fechaNacimiento = fechaNacimiento;
        this.activo = activo;
    }

    // Getter para id
    public int getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    // Getter y Setter para dni
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    // Getter y Setter para nombre
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    /**
     * @return the primerApellido
     */
    public String getPrimerApellido() {
        return primerApellido;
    }
    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }
    public String getSegundoApellido() {
        return segundoApellido;
    }
    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }
     public char getGenero() {
        return genero;
    }
    public void setGenero(char genero) {
        this.genero = genero;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public boolean isActivo() {
        return activo;
    }

    /**
     * @param activo the activo to set
     */
    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    /**
     * @return the genero
     */
    public abstract String emitirReporte();
    public abstract String obtenerDatos();
    @Override
    public boolean iniciarSesion(String correo, String dni){
        return this.primerApellido.equals(primerApellido);
    }
    @Override
    public void cerrarSesion(){
        
    }
}
