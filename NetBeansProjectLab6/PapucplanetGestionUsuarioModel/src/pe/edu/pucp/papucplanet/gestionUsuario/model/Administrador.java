package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class  Administrador extends Usuario{
	
    private String codigo;

    // Constructor que llama al constructor de Usuario
    public Administrador(String dni, String nombre, String correo, String codigo) {
        super(dni, nombre, correo); // Llama al constructor de la clase Usuario
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
    public String emitirReporte(){
        String rep="";
        return rep;
    }
}
