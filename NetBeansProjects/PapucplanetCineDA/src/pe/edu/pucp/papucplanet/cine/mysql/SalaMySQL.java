
package pe.edu.pucp.papucplanet.cine.mysql;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.mysql.SedeMySQL;

//import pe.edu.pucp.papucplanet.cine.model.Butaca;
//import pe.edu.pucp.papucplanet.cine.model.Funcion;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import pe.edu.pucp.papucplanet.cine.model.Sede;


public class SalaMySQL implements SalaDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Sala sala) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_SALA(?,?,?,?)}");
            cs.registerOutParameter("_id_sala", java.sql.Types.INTEGER);
            cs.setInt("_numero_sala",sala.getNumeroSala());
            cs.setInt("_fid_sede",sala.getSede().getIdSede());
            cs.setInt("_capacidad",sala.getCapacidad());
            cs.executeUpdate();
            sala.setIdSala(cs.getInt("_id_sala"));
            result = sala.getIdSala();
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
    public int modificar(Sala sala) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_SALA(?,?,?,?)}");
            cs.setInt("_id_sala", sala.getIdSala());
            cs.setInt("_numero_sala",sala.getNumeroSala());
            cs.setInt("_fid_sede",sala.getSede().getIdSede());
            cs.setInt("_capacidad",sala.getCapacidad());
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
    public int eliminar(int idSala) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_SALA_X_ID(?)}");
            cs.setInt("_id_sala",idSala);
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
    public ArrayList<Sala> listarTodos() {
        ArrayList<Sala> salas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_SALAS_TODAS()}");
            rs = cs.executeQuery();
            Sala sala;
            int idSede;
            SedeDAO sedeDao = new SedeMySQL();
            while(rs.next()){
                sala = new Sala();
                sala.setIdSala(rs.getInt("id_sala"));
                sala.setNumeroSala(rs.getInt("numero_sala"));
                idSede = rs.getInt("fid_sede");
                sala.setSede(sedeDao.obtenerPorId(idSede));
                sala.setCapacidad(rs.getInt("capacidad"));
                salas.add(sala);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return salas;
    }

    @Override
    public Sala obtenerPorId(int idSala) {
        Sala sala = new Sala();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_SALA_X_ID(?)}");
            cs.setInt("_id_sala",idSala);
            rs = cs.executeQuery();
            int idSede = 0;
            SedeDAO sedeDao = new SedeMySQL();
            if(rs.next()){
                sala.setIdSala(rs.getInt("id_sala"));
                sala.setNumeroSala(rs.getInt("numero_sala"));
                idSede = rs.getInt("fid_sede");
                sala.setSede(sedeDao.obtenerPorId(idSede));
                sala.setCapacidad(rs.getInt("capacidad"));
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return sala;
    }

    @Override
    public ArrayList<Sala> listarSalasxIdSede(int idSede) {
        ArrayList<Sala> salas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call OBTENER_SALAS_POR_SEDE(?)}");
            cs.setInt("_id_sede",idSede);
            rs = cs.executeQuery();
            Sala sala;
            SedeDAO sedeDao = new SedeMySQL();
            while(rs.next()){
                sala = new Sala();
                sala.setIdSala(rs.getInt("id_sala"));
                sala.setNumeroSala(rs.getInt("numero_sala"));
                sala.setSede(sedeDao.obtenerPorId(idSede));
                sala.setCapacidad(rs.getInt("capacidad"));
                salas.add(sala);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return salas;
    }
    
}
