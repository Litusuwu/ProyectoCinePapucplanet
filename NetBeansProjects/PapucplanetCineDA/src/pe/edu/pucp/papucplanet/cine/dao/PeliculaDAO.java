package pe.edu.pucp.papucplanet.cine.dao;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.model.Genero;

public interface PeliculaDAO {
    int insertar(Pelicula pelicula);
    int modificar(Pelicula pelicula);
    int eliminar(int idPelicula);
    ArrayList<Pelicula> listarTodos();
    Pelicula obtenerPorId(int idPelicula);
    ArrayList<Genero> listarGeneros();
    ArrayList<Pelicula> listarPorNombre(String nombre);
}
