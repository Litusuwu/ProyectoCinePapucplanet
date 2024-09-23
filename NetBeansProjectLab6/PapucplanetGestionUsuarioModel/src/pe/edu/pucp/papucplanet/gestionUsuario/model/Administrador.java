package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class  Administrador extends Usuario{
	
    private String codigo;
    private int activo;
    
    public Administrador(){
        super();
    }
    // Constructor que llama al constructor de Usuario
    public Administrador(String dni, String nombre, String codigo,
                         String primerApellido, String segundoApellido) {
        super(dni, nombre,  primerApellido, segundoApellido);
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
    /**
     * @return the activo
     */
    public int getActivo() {
        return activo;
    }

    /**
     * @param activo the activo to set
     */
    public void setActivo(int activo) {
        this.activo = activo;
    }
    @Override
    public String emitirReporte(){
        String rep="";
        return rep;
    }

    
}
