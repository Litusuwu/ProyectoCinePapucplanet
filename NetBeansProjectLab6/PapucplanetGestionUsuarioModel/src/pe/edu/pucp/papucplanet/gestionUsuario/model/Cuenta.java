package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class Cuenta{

    
    private Usuario usuario;
    private String password;
    private String correo;
    private int activo;
    
    public Cuenta(Usuario usuario,String password, String correo, int activo){
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
        this.activo = activo;
    }
    public String getPassword() {
        return password;
    }
    public String getCorreo() {
        return correo;
    }
    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    // Setter para universidad
    public void setPassword(String password) {
        this.password = password;
    }
    public void setUsuario(Usuario usuario){
        this.usuario=usuario;
    }
    public Usuario getUsuario(){
        return usuario;
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
    //METODOS
//    public void iniciarSesion(String password,String correo){
//
//    }

    /**
     * @return the correo
     */
    
}