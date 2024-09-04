
class Cliente extends Usuario{
	
	private String universidad;
	// Constructor con parámetros para Cliente y Usuario
    public Cliente(String dni, String nombre, String correo, String universidad) {
        super(dni, nombre, correo); // Llama al constructor de Usuario
        this.universidad = universidad;
    }

    // Getter para universidad
    public String getUniversidad() {
        return universidad;
    }

    // Setter para universidad
    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }
}