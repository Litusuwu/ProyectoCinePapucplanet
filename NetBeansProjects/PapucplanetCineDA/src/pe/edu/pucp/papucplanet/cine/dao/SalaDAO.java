
package pe.edu.pucp.papucplanet.cine.dao;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import java.util.ArrayList;

public interface SalaDAO {
    int insertar(Sala sala);
    int modificar(Sala sala);
    int eliminar(int idSala);
    ArrayList<Sala> listarTodos();
    Sala obtenerPorId(int idSala);
    ArrayList<Sala> listarSalasxIdSede(int idSede);
}
