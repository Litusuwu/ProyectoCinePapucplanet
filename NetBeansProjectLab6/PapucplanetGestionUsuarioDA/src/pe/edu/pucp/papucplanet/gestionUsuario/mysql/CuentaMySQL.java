/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package pe.edu.pucp.papucplanet.gestionUsuario.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.CuentaDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cuenta;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Usuario;

public class CuentaMySQL implements CuentaDAO,  GestionUsuarioDAO<Cuenta>{
    private ResultSet rs, rs2;
    private Connection con;
    private CallableStatement cs;
    @Override
    public int insertar(Cuenta cuenta) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_CUENTA(?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_administrador
            cs.setString(2, cuenta.getPassword());
            cs.setString(3, cuenta.getCorreo());
            cs.setInt(4, cuenta.getUsuario().getId());
            // Ejecutar el procedimiento
            cs.executeUpdate();

            resultado = cs.getInt(1);
            cuenta.getUsuario().setId(cs.getInt(1));
//            if(resultado > 0)cliente.setId(resultado); // Establecer el ID en el objeto Administrador
//            resultado = 1;
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int actualizar(Cuenta cuenta) {
        int resultado = 0;
//        Sede sede;
        try{
            con = DBManager.getInstance().getConnection();
            String sql = "{CALL MODIFICAR_CUENTA(?, ?, ?)}";
            cs = con.prepareCall(sql);
            cs.setInt(1, cuenta.getUsuario().getId());
            cs.setString(2, cuenta.getPassword());
            cs.setString(3, cuenta.getCorreo());
            // Obtener el ID del administrador generado (parámetro OUT)
            // cliente.setId(idCliente); // Establecer el ID en el objeto Administrador
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int eliminar(int codigo) {
        int resultado = 0;
        try {
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparar la llamada al procedimiento
            String sql = "{CALL ELIMINAR_CUENTA_X_ID(?)}";
            cs = con.prepareCall(sql);

            // Establecer el parámetro de entrada
            cs.setInt(1, codigo);

            // Ejecutar el procedimiento y obtener los resultados
            resultado = cs.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

        return resultado; // Retorna null si no se encuentra el administrador
    }

    @Override
    public Cuenta obtenerPorCodigo(int codigo) {
        Cuenta cuenta = null;

        try {
            con = DBManager.getInstance().getConnection();
            String sql = "{CALL TESTCLARA(?)}";
            cs = con.prepareCall(sql);
            cs.setInt(1, codigo);
            rs = cs.executeQuery();
            if (rs.next()) {
                cuenta = new Cuenta();
                Usuario usuario;
                
                if(rs.getInt("id_administrador") != 0){
                    usuario = new Administrador();
                }
                else if(rs.getInt("id_cliente") != 0){
                    usuario = new Cliente();
                }
                else{
                    throw new IllegalArgumentException("No existe ese usuario.");
                }
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setActivo(rs.getBoolean("activo"));
                cuenta.setPassword(rs.getString("contrasena"));
                cuenta.setCorreo(rs.getString("correo"));
                cuenta.setUsuario(usuario);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

        return cuenta; 
    }

    @Override
    public ArrayList<Cuenta> listar() {
        ArrayList<Cuenta> listaCuentas = new ArrayList<>();
        try {
            // Obtener la conexión
            con = DBManager.getInstance().getConnection();

            // Preparar la llamada al procedimiento
            String sql = "{CALL TESTCLARA2()}";
            cs = con.prepareCall(sql);

            // Ejecutar el procedimiento y obtener los resultados
            rs = cs.executeQuery();

            // Recorrer el ResultSet
            while (rs.next()) {
                Cuenta cuenta = new Cuenta();
                Usuario usuario;
                // Asignar los valores desde el ResultSet  
                if(rs.getInt("id_administrador") != 0){
                    usuario = new Administrador();
                }
                else if(rs.getInt("id_cliente") != 0){
                    usuario = new Cliente();
                }
                else{
                    throw new IllegalArgumentException("No existe ese usuario.");
                }
                
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setActivo(rs.getBoolean("activo"));
                
                cuenta.setPassword(rs.getString("contrasena"));
                cuenta.setCorreo(rs.getString("correo"));
                cuenta.setUsuario(usuario);
                listaCuentas.add(cuenta);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        System.out.println("GA");
        return listaCuentas;
    }


    
}
