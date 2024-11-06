
package pe.edu.pucp.papucplanet.cine.dao;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.model.Butaca;

public interface ButacaDAO {
    int insertar(Butaca butaca);
    int modificar(Butaca butaca);
    int eliminar(int idButaca);
    ArrayList<Butaca> listarTodos();
    ArrayList<Butaca> listarButacasXSala(int idSala);
    Butaca obtenerPorId(int idButaca);
}
