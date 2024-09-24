package pe.edu.pucp.papucplanet.cine.dao;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import java.util.ArrayList;

public interface SedeDAO {
    int insertar(Sede sede);
    int modificar(Sede sede);
    int eliminar(int idSede);
    ArrayList<Sede> listarTodos();
    Sede obtenerPorId(int idSede);
}
