package pe.edu.pucp.papucplanet.gestionUsuario.model;

public class Cuenta{
    private Usuario usuario;
    private String password;
    
    public Cuenta(Usuario usuario,String password){
        this.usuario=usuario;
        this.password=password;
    }
    public String getPassword() {
        return password;
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
    //METODOS
//    public void iniciarSesion(String password,String correo){
//
//    }
}