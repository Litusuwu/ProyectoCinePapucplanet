package pe.edu.pucp.papucplanet.compras.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.model.Boleta;

public interface BoletaDAO {
    // Método para insertar una nueva boleta
    int insertar(Boleta boleta);
    
    // Método para actualizar los datos de una boleta existente
    int actualizar(Boleta boleta);
    
    // Método para eliminar una boleta por su código
    int eliminar(int id);
    
    // Método para obtener una boleta por su código
    Boleta obtenerPorId(int id);
    
    // Método para listar todos las boletas
    ArrayList<Boleta> listar();
}
