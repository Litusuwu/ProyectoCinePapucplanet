
package pe.edu.pucp.papucplanet.cine.mysql;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.mysql.SalaMySQL;
//import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class SedeMySQL implements SedeDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Sede sede) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_SEDE(?,?,?)}");
            cs.registerOutParameter("_id_sede",java.sql.Types.INTEGER);
            cs.setString("_nombre",sede.getUniversidad());
            cs.setString("_ubicacion",sede.getUbicacion());
            cs.executeUpdate();
            sede.setIdSede(cs.getInt("_id_sede"));
//            SalaDAO salaDao = new SalaMySQL();
//            for(Sala sala : sede.getSalas()){
//                sala.setSede(sede);
//                salaDao.insertar(sala);
//            }
            result = sede.getIdSede();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return result;
    }
    
    @Override
    public int modificar(Sede sede) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_SEDE(?,?,?)}");
            cs.setInt("_id_sede",sede.getIdSede());
            cs.setString("_nombre",sede.getUniversidad());
            cs.setString("_ubicacion",sede.getUbicacion());
            result = cs.executeUpdate();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return result;
    }

    @Override
    public int eliminar(int idSede) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_SEDE_X_ID(?)}");
            cs.setInt("_id_sede",idSede);
            result = cs.executeUpdate();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return result;
    }

    @Override
    public ArrayList<Sede> listarTodos() {
        ArrayList<Sede> sedes = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_SEDES_TODAS()}");
            rs = cs.executeQuery();
            Sede sede;
            while(rs.next()){
                sede = new Sede();
                sede.setIdSede(rs.getInt("id_sede"));
                sede.setUniversidad(rs.getString("nombre"));
                sede.setUbicacion(rs.getString("ubicacion"));
                sedes.add(sede);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return sedes;
    }

    @Override
    public Sede obtenerPorId(int idSede) {
        Sede sede = new Sede();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_SALA_X_ID(?)}");
            cs.setInt("_id_sede",idSede);
            rs = cs.executeQuery();
            if(rs.next()){
                sede.setIdSede(rs.getInt("id_sede"));
                sede.setUniversidad(rs.getString("nombre"));
                sede.setUbicacion(rs.getString("ubicacion"));
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return sede;
    }
    
}
