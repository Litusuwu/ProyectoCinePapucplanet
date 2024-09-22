/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package pe.edu.pucp.papucplanet.gestionUsuario.mysql;


import com.papucplanet.dbmanager.model.DBManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;


public class AdministradorMySQL implements AdministradorDAO, GestionUsuarioDAO<Administrador>{

    private ResultSet rs;
    private Connection con;
    private PreparedStatement pst;
    @Override
    public int insertar(Administrador administrador) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
//            String sql = "INSERT INTO administrador";
            String sql = "INSERT INTO Usuario(dni, nombre, primerApellido, segundoApellido) " +
                    "VALUES(?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, administrador.getDni());
            pst.setString(2, administrador.getNombre());
            pst.setString(3, administrador.getPrimerApellido());
            pst.setString(4, administrador.getSegundoApellido());
            resultado = pst.executeUpdate();      
            sql = "SELECT @@last_insert_id as id";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            rs.next();
            administrador.setId(rs.getInt("id"));
            sql = "INSERT INTO Administrador(id_administrador, codigo) VALUES(?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(1, administrador.getId());
            pst.setString(2, administrador.getCodigo());
            resultado = pst.executeUpdate();
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
            con = DBManager.getInstance().getConnection();
            
            String sql = "UPDATE Usuario SET dni=?, nombre=?, primerApellido=?, segundoApellido=? WHERE id_usuario=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, administrador.getDni());
            pst.setString(2, administrador.getNombre());
            pst.setString(3, administrador.getPrimerApellido());
            pst.setString(4, administrador.getSegundoApellido());
            pst.setInt(6, administrador.getId());
            resultado = pst.executeUpdate();
            
            sql = "UPDATE Administrador SET codigo= ? WHERE id_administrador = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, administrador.getCodigo());
            pst.setInt(2, administrador.getId());
            resultado = pst.executeUpdate();
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
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<Administrador> listar() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
