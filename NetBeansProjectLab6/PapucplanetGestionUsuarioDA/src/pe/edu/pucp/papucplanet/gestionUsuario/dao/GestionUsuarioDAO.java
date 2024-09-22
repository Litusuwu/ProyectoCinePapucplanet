/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.dao;

import java.util.ArrayList;

// @param => tipo de dato de gestionUsuario

public interface GestionUsuarioDAO<T> {
     // Método para insertar un nuevo administrador
    int insertar(T t);
    
    // Método para actualizar los datos de un administrador existente
    int actualizar(T t);
    
    // Método para eliminar un administrador por su código
    int eliminar(int codigo);
    
    // Método para obtener un administrador por su código
    T obtenerPorCodigo(int codigo);
    
    // Método para listar todos los administradores
    ArrayList<T> listar();
}
