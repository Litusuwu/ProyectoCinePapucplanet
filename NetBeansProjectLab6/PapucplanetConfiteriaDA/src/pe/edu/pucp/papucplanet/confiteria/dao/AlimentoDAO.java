package pe.edu.pucp.papucplanet.confiteria.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;

public interface AlimentoDAO {
    // Método para insertar un nuevo alimento
    int insertar(Alimento alimento);
    
    // Método para actualizar los datos de un alimento existente
    int actualizar(Alimento alimento);
    
    // Método para eliminar un alimento por su código
    int eliminar(int id);
    
    // Método para obtener un alimento por su código
    Alimento obtenerPorId(int id);
    
    // Método para listar todos los alimentos
    ArrayList<Alimento> listar();        
}
