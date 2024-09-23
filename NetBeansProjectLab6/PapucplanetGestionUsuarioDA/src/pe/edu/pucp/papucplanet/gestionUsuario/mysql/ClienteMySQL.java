/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package pe.edu.pucp.papucplanet.gestionUsuario.mysql;

import com.papucplanet.dbmanager.model.DBManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.ClienteDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;


public class ClienteMySQL implements ClienteDAO, GestionUsuarioDAO<Cliente>{
    private ResultSet rs, rs2;
    private Connection con;
    private CallableStatement cs;
    @Override
    public int insertar(Cliente cliente) {
        int resultado = 0;
//        Sede sede;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_CLIENTE(?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_administrador
            cs.setString(2, cliente.getDni());
            cs.setString(3, cliente.getNombre());
            cs.setString(4, cliente.getPrimerApellido());
            cs.setString(5, cliente.getSegundoApellido());
            cs.setString(6, String.valueOf(cliente.getGenero())); // Convertir char a String
            cs.setDate(7, new Date(cliente.getFechaNacimiento().getTime())); // Para usar java.sql.Date
            cs.setInt(8, cliente.getSede().getId());
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
            int idCliente = cs.getInt(1);
            cliente.setId(idCliente); // Establecer el ID en el objeto Administrador
            resultado = 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int actualizar(Cliente cliente) {
        int resultado = 0;
//        Sede sede;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICA_CLIENTE(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, cliente.getId()); // El parámetro de salida _id_administrador
            cs.setString(2, cliente.getDni());
            cs.setString(3, cliente.getNombre());
            cs.setString(4, cliente.getPrimerApellido());
            cs.setString(5, cliente.getSegundoApellido());
            cs.setString(6, String.valueOf(cliente.getGenero())); // Convertir char a String
            cs.setDate(7, new Date(cliente.getFechaNacimiento().getTime())); // Para usar java.sql.Date
            cs.setInt(8, cliente.getSede().getId());
            cs.setInt(9, cliente.getActivo());
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
//            int idCliente = cs.getInt(1);
//            cliente.setId(idCliente); // Establecer el ID en el objeto Administrador
            resultado = 1;
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int eliminar(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cliente obtenerPorCodigo(int codigo) {
        Cliente cliente = null;
        Sede sede;
        try {
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparar la llamada al procedimiento
            String sql = "{CALL LISTAR_ADMINISTRADOR_X_ID(?)}";
            cs = con.prepareCall(sql);

            // Establecer el parámetro de entrada
            cs.setInt(1, codigo);

            // Ejecutar el procedimiento y obtener los resultados
            rs = cs.executeQuery();
            
            
            // Si hay resultados, crear un objeto Administrador
            if (rs.next()) {
                int idSede;
                cliente = new Cliente();

                // Asignar los valores desde el ResultSet al objeto Administrador
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setDni(rs.getString("DNI"));
                cliente.setNombre(rs.getString("nombres"));
                cliente.setPrimerApellido(rs.getString("primer_apellido"));
                cliente.setSegundoApellido(rs.getString("segundo_apellido"));
                cliente.setGenero(rs.getString("genero").charAt(0)); // Convertir String a char
                cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento")); // java.sql.Date
                cliente.setActivo(rs.getInt("activo")); // Mapear TINYINT a boolean
                idSede = rs.getInt("fid_sede");
                // Llama al segundo query de obtener sede por  id
                sql = "{CALL LISTAR_SEDE_X_ID(?)}";
                cs.setInt(1, idSede);
                //
                rs2 = cs.executeQuery();
                if(rs2.next()){
                    sede = new Sede();
                    sede.setId(idSede);
                    sede.setUbicacion(rs2.getString("ubicacion"));
                    sede.setUniversidad(rs2.getString("nombre"));
                    
                    cliente.setSede(sede);
                    
                }
                else{
                    System.out.println("No se encontro la sede");
                    return null;
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        return cliente; // Retorna null si no se encuentra el administrador
    }

    @Override
    public ArrayList<Cliente> listar() {
        ArrayList<Cliente> listaClientes = new ArrayList<>();
        int idSede;
        Sede sede;
        try {
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparar la llamada al procedimiento
            String sql = "{CALL LISTAR_CLIENTES_TODOS()}";
            cs = con.prepareCall(sql);

            // Ejecutar el procedimiento y obtener los resultados
            rs = cs.executeQuery();

            // Recorrer el ResultSet y crear objetos Administrador
            while (rs.next()) {
                Cliente cliente = new Cliente();

                // Asignar los valores desde el ResultSet al objeto Administrador
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setDni(rs.getString("DNI"));
                cliente.setNombre(rs.getString("nombres"));
                cliente.setPrimerApellido(rs.getString("primer_apellido"));
                cliente.setSegundoApellido(rs.getString("segundo_apellido"));
                cliente.setGenero(rs.getString("genero").charAt(0)); // Convertir String a char
                cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento")); // java.sql.Date
                cliente.setActivo(rs.getInt("activo")); // Mapear TINYINT a boolean
                idSede = rs.getInt("fid_sede");
                // Llama al segundo query de obtener sede por  id
                sql = "{CALL LISTAR_SEDE_X_ID(?)}";
                cs.setInt(1, idSede);
                //
                rs2 = cs.executeQuery();
                if(rs2.next()){
                    sede = new Sede();
                    sede.setId(idSede);
                    sede.setUbicacion(rs2.getString("ubicacion"));
                    sede.setUniversidad(rs2.getString("nombre"));
                    
                    cliente.setSede(sede);
                    
                }
                else{
                    System.out.println("No se encontro la sede");
                    continue;
                }

                // Añadir el administrador a la lista
                listaClientes.add(cliente);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        return listaClientes;
    }
}
