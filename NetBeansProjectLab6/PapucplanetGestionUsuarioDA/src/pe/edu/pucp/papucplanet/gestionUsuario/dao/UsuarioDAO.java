/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Usuario;

/**
 *
 * @author carlo
 */
public interface UsuarioDAO {
    // Método para insertar un nuevo administrador
    int insertar(Usuario usuario);
    
    // Método para actualizar los datos de un administrador existente
    int actualizar(Usuario usuario);
    
    // Método para eliminar un administrador por su código
    int eliminar(int codigo);
    
    // Método para obtener un administrador por su código
    Usuario obtenerPorCodigo(int codigo);
    
    // Método para listar todos los administradores
    ArrayList<Usuario> listar();
}
