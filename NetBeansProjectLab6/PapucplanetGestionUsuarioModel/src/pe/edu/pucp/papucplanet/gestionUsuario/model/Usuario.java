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
    // Constructor que asigna automáticamente el ID usando el correlativo
    public Usuario(){
        
    }
    public Usuario(String dni, String nombre,
                    String primerApellido, String segundoApellido) {
        this.dni = dni;
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
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

    /**
     * @param primerApellido the primerApellido to set
     */
    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    /**
     * @return the segundoApellido
     */
    public String getSegundoApellido() {
        return segundoApellido;
    }

    /**
     * @param segundoApellido the segundoApellido to set
     */
    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }
     public char getGenero() {
        return genero;
    }

    /**
     * @param genero the genero to set
     */
    public void setGenero(char genero) {
        this.genero = genero;
    }

    /**
     * @return the fechaNacimiento
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    public abstract String emitirReporte();
    @Override
    public boolean iniciarSesion(String correo, String dni){
        return this.primerApellido.equals(primerApellido);
    }
    @Override
    public void cerrarSesion(){
        
    }

    /**
     * @return the genero
     */
   
}
