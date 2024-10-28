package pe.edu.pucp.papucplanet.confiteria.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;

public interface BebidaDAO {
    // Método para insertar una nueva bebida
    int insertar(Bebida bebida);
    
    // Método para actualizar los datos de una bebida existente
    int actualizar(Bebida bebida);
    
    // Método para eliminar una bebida por su código
    int eliminar(int id);
    
    // Método para obtener una bebida por su código
    Bebida obtenerPorId(int id);
    
    // Método para listar todos las bebidas
    ArrayList<Bebida> listar();      
}
