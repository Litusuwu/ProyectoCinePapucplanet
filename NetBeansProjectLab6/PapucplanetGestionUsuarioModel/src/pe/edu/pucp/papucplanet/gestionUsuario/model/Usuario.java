package pe.edu.pucp.papucplanet.gestionUsuario.model;

abstract public class Usuario implements IUsuario{

    private int id;
    private String dni;
    private String nombre;
    private String correo;
    private String primerApellido;
    private String segundoApellido;
    // Constructor que asigna automáticamente el ID usando el correlativo
    public Usuario(){
        
    }
    public Usuario(String dni, String nombre, String correo,
                    String primerApellido, String segundoApellido) {
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
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

    // Getter y Setter para correo
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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
    
    public abstract String emitirReporte();
    @Override
    public boolean iniciarSesion(String correo, String dni){
        return this.correo.equals(correo);
    }
    @Override
    public void cerrarSesion(){
        
    }
}
