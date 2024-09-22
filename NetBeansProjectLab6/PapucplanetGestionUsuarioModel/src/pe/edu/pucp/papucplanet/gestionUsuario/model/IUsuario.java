package pe.edu.pucp.papucplanet.gestionUsuario.model;

public interface IUsuario {
    public boolean iniciarSesion(String user, String pass);
    public void cerrarSesion();
}
