package pe.edu.pucp.papucplanet.compras.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;

public interface LineaBoletaDAO {
    // Método para insertar una nueva boleta
    int insertar(LineaBoleta lineaBoleta);
    
    // Método para actualizar los datos de una boleta existente
    int actualizar(LineaBoleta lineaBoleta);
    
    // Método para eliminar una boleta por su código
    int eliminar(int id);
    
    // Método para obtener una boleta por su código
    LineaBoleta obtenerPorId(int id);
    
    // Método para listar todos las boletas
    ArrayList<LineaBoleta> listar(); 
}
