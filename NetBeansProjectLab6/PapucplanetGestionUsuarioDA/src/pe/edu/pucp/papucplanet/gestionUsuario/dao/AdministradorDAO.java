package pe.edu.pucp.papucplanet.gestionUsuario.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

/**
 *
 * @author carlo
 */
public interface AdministradorDAO {
    // Método para insertar un nuevo administrador
    int insertar(Administrador administrador);
    
    // Método para actualizar los datos de un administrador existente
    int actualizar(Administrador administrador);
    
    // Método para eliminar un administrador por su código
    int eliminar(int codigo);
    
    // Método para obtener un administrador por su código
    Administrador obtenerPorCodigo(int codigo);
    
    // Método para listar todos los administradores
    ArrayList<Administrador> listar();
}
