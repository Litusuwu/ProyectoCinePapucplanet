/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package pe.edu.pucp.papucplanet.gestionUsuario.mysql;


import com.papucplanet.dbmanager.model.DBManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.CallableStatement;
import java.sql.Date;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;


public class AdministradorMySQL implements AdministradorDAO, GestionUsuarioDAO<Administrador>{

    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    @Override
    public int insertar(Administrador administrador) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_ADMINISTRADOR(?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_administrador
            cs.setString(2, administrador.getCodigo());
            cs.setString(3, administrador.getDni());
            cs.setString(4, administrador.getNombre());
            cs.setString(5, administrador.getPrimerApellido());
            cs.setString(6, administrador.getSegundoApellido());
            cs.setString(7, String.valueOf(administrador.getGenero())); // Convertir char a String
            cs.setDate(8, new Date(administrador.getFechaNacimiento().getTime())); // Para usar java.sql.Date

            // Ejecutar el procedimiento
            cs.executeUpdate();
            resultado = cs.getInt(1);
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
    public int actualizar(Administrador administrador) {
        int resultado = 0;
        try{
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICAR_ADMINISTRADOR(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.setInt(1, administrador.getId()); // Parámetro _id_administrador
            cs.setString(2, administrador.getCodigo()); // Parámetro _codigo
            cs.setString(3, administrador.getDni()); // Parámetro _dni
            cs.setString(4, administrador.getNombre()); // Parámetro _nombres
            cs.setString(5, administrador.getPrimerApellido()); // Parámetro _primer_apellido
            cs.setString(6, administrador.getSegundoApellido()); // Parámetro _segundo_apellido
            cs.setString(7, String.valueOf(administrador.getGenero())); // Convertir char a String (Parámetro _genero)
            cs.setDate(8, new Date(administrador.getFechaNacimiento().getTime())); // Parámetro _fecha_nacimiento
            cs.setInt(9, administrador.getActivo()); // Parámetro _activo (convertido a TINYINT en MySQL)

            // Ejecutamos el procedimiento
            resultado = cs.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int eliminar(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public Administrador obtenerPorCodigo(int codigo) {
        Administrador administrador = null;
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
                administrador = new Administrador();

                // Asignar los valores desde el ResultSet al objeto Administrador
                administrador.setId(rs.getInt("id_administrador"));
                administrador.setDni(rs.getString("DNI"));
                administrador.setNombre(rs.getString("nombres"));
                administrador.setPrimerApellido(rs.getString("primer_apellido"));
                administrador.setSegundoApellido(rs.getString("segundo_apellido"));
                administrador.setGenero(rs.getString("genero").charAt(0)); // Convertir String a char
                administrador.setFechaNacimiento(rs.getDate("fecha_nacimiento")); // java.sql.Date
                administrador.setCodigo(rs.getString("codigo"));
                administrador.setActivo(rs.getInt("activo")); // Mapear TINYINT a boolean
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

        return administrador; // Retorna null si no se encuentra el administrador
    }

    @Override
    public ArrayList<Administrador> listar() {
        ArrayList<Administrador> listaAdministradores = new ArrayList<>();

        try {
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparar la llamada al procedimiento
            String sql = "{CALL LISTAR_ADMINISTRADORES_TODOS()}";
            cs = con.prepareCall(sql);

            // Ejecutar el procedimiento y obtener los resultados
            rs = cs.executeQuery();

            // Recorrer el ResultSet y crear objetos Administrador
            while (rs.next()) {
                Administrador administrador = new Administrador();

                // Asignar los valores desde el ResultSet al objeto Administrador
                administrador.setId(rs.getInt("id_administrador"));
                administrador.setDni(rs.getString("DNI"));
                administrador.setNombre(rs.getString("nombres"));
                administrador.setPrimerApellido(rs.getString("primer_apellido"));
                administrador.setSegundoApellido(rs.getString("segundo_apellido"));
                administrador.setGenero(rs.getString("genero").charAt(0)); // Convertir String a char
                administrador.setFechaNacimiento(rs.getDate("fecha_nacimiento")); // java.sql.Date
                administrador.setCodigo(rs.getString("codigo"));
                administrador.setActivo(rs.getInt("activo")); // Mapear TINYINT a boolean

                // Añadir el administrador a la lista
                listaAdministradores.add(administrador);
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

        return listaAdministradores;
    }
    
}
