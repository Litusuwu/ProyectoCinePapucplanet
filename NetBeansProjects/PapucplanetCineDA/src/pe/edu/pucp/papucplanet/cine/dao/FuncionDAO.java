
package pe.edu.pucp.papucplanet.cine.dao;

import pe.edu.pucp.papucplanet.cine.model.Funcion;
import java.util.ArrayList;
import java.util.Date;

public interface FuncionDAO {
    int insertar(Funcion funcion);
    int modificar(Funcion funcion);
    int eliminar(int idFuncion);
    ArrayList<Funcion> listarTodos();
    Funcion obtenerPorId(int idFuncion);
    // Nuevo método para obtener funciones por película
    ArrayList<Funcion> obtenerFuncionesPorPelicula(int idPelicula);
    ArrayList<Funcion> listarFuncionesPorFecha(Date fecha);
    int modificarConButacasFuncion(Funcion funcion);
}
