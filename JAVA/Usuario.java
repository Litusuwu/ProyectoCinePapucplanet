
abstract class Usuario{
	private int id;
	private String dni;
    private String nombre;
    private String correo;

	// Constructor que asigna automáticamente el ID usando el correlativo
    public Usuario(String dni, String nombre, String correo) {
        this.dni = dni;
        this.nombre = nombre;
        this.correo = correo;
    }

    // Getter para id (no hay setter porque el ID es automático)
    public int getId() {
        return id;
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

    public abstract String emitirReporte();
	
}