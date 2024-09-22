package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class  Administrador extends Usuario{
	
    private String codigo;
    public Administrador(){
        super();
    }
    // Constructor que llama al constructor de Usuario
    public Administrador(String dni, String nombre, String correo, String codigo,
                         String primerApellido, String segundoApellido) {
        super(dni, nombre, correo, primerApellido, segundoApellido);
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
