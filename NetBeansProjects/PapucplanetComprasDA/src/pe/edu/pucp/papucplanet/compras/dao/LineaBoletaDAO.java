package pe.edu.pucp.papucplanet.compras.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;

public interface LineaBoletaDAO {
    // Método para insertar una nueva boleta
    int insertar(LineaBoleta lineaBoleta,int idBoleta);
    
    // Método para actualizar los datos de una boleta existente
    int actualizar(LineaBoleta lineaBoleta,int idBoleta); //La linea ya esta asignada a una boleta
    
    // Método para eliminar una linea de boleta por su código
    int eliminar(int idLinea); //La linea ya esta asignada a una boleta
    
    // Método para obtener una boleta por su código
    LineaBoleta obtenerPorId(int idLinea);
    
    // Método para listar todos las lineas de boleta
    ArrayList<LineaBoleta> listar(); 
    // Método para listar todas las lineas de boleta de una boleta
    ArrayList<LineaBoleta> listarPorUnaBoleta(int idBoleta); 
}
