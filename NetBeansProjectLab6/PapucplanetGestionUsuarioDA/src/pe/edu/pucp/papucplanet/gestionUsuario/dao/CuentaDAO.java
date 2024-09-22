/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.dao;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cuenta;

/**
 *
 * @author carlo
 */
public interface CuentaDAO {
    // Método para insertar un nuevo administrador
    int insertar(Cuenta usuario);
    
    // Método para actualizar los datos de un administrador existente
    int actualizar(Cuenta usuario);
    
    // Método para eliminar un administrador por su código
    int eliminar(int codigo);
    
    // Método para obtener un administrador por su código
    Cuenta obtenerPorCodigo(int codigo);
    
    // Método para listar todos los administradores
    ArrayList<Cuenta> listar();
}
