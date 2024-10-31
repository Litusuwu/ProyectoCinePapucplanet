
package pe.edu.pucp.papucplanet.cine.dao;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import java.util.ArrayList;

public interface ButacaFuncionDAO {
    int insertar(ButacaFuncion butacaFuncion);
    int modificar(ButacaFuncion butacaFuncion);
    int eliminar(int idButacaFuncion);
    ArrayList<ButacaFuncion> listarTodos();
    ButacaFuncion obtenerPorId(int idButacaFuncion);
    public ArrayList<ButacaFuncion> obtenerButacasPorFuncion(int idFuncion);
}
