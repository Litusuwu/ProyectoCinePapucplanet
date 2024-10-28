package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class Cuenta{

    
    private Usuario usuario;
    private String password;
    private String correo;

    public Cuenta(){
        
    }
    public Cuenta(Usuario usuario,String password, String correo, int activo){
        this.usuario = usuario;
        this.password = password;
        this.correo = correo;
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
    public String imprimirDatos(){
        String str = "--------------------------------------\n";
        str += "ID: " + this.getUsuario().getId() + "\n";
        str += "Correo: " + this.getCorreo()+ "\n";
        str += "Contrasena: " + this.getPassword()+ "\n";
        str += "Tipo de Cuenta: " + ((this.getUsuario() instanceof Administrador)? "Administrador":"Cliente") + "\n";
        str += "Activo: " + (this.getUsuario().isActivo());
        return str;
        
    }

    //METODOS
//    public void iniciarSesion(String password,String correo){
//
//    }

    /**
     * @return the correo
     */
    
}