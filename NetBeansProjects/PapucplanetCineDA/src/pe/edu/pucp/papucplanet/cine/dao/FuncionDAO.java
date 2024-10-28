
package pe.edu.pucp.papucplanet.cine.dao;

import pe.edu.pucp.papucplanet.cine.model.Funcion;
import java.util.ArrayList;

public interface FuncionDAO {
    int insertar(Funcion funcion);
    int modificar(Funcion funcion);
    int eliminar(int idFuncion);
    ArrayList<Funcion> listarTodos();
    Funcion obtenerPorId(int idFuncion);
}
