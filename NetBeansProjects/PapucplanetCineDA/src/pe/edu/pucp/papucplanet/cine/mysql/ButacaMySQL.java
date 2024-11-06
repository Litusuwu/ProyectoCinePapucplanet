package pe.edu.pucp.papucplanet.cine.mysql;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.model.Sala;

public class ButacaMySQL implements ButacaDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Butaca butaca) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_BUTACA(?,?,?,?,?)}");
            cs.registerOutParameter("_id_butaca", java.sql.Types.INTEGER);
            cs.setString("_fila",String.valueOf(butaca.getFila()));
            cs.setInt("_columna",butaca.getColumna());
            cs.setBoolean("_discapacitado",butaca.isDiscapacitado());
            cs.setInt("_fid_sala",butaca.getSala().getIdSala());
            cs.executeUpdate();
            butaca.setIdButaca(cs.getInt("_id_butaca"));
            result = butaca.getIdButaca();
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
    public int modificar(Butaca butaca) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_BUTACA(?,?,?,?,?)}");
            cs.setInt("_id_butaca", butaca.getIdButaca());
            cs.setString("_fila",String.valueOf(butaca.getFila()));
            cs.setInt("_columna",butaca.getColumna());
            cs.setBoolean("_discapacitado",butaca.isDiscapacitado());
            cs.setInt("_fid_sala",butaca.getSala().getIdSala());
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
    public int eliminar(int idButaca) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_BUTACA_X_ID(?)}");
            cs.setInt("_id_butaca",idButaca);
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
    public ArrayList<Butaca> listarTodos() {
        ArrayList<Butaca> butacas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_BUTACAS_TODAS()}");
            rs = cs.executeQuery();
            Butaca butaca;
            int idSala;
            SalaDAO salaDao = new SalaMySQL();
            while(rs.next()){
                butaca = new Butaca();
                butaca.setIdButaca(rs.getInt("id_butaca"));
                butaca.setFila(rs.getString("fila").charAt(0));
                butaca.setColumna(rs.getInt("columna"));
                butaca.setDiscapacitado(rs.getBoolean("discapacitado"));
                idSala = rs.getInt("fid_sala");
                butaca.setSala(salaDao.obtenerPorId(idSala));
                butacas.add(butaca);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return butacas;
    }

    @Override
    public Butaca obtenerPorId(int idButaca) {
        Butaca butaca = new Butaca();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_BUTACA_X_ID(?)}");
            cs.setInt("_id_butaca",idButaca);
            rs = cs.executeQuery();
            int idSala = 0;
            //SalaDAO salaDao;
            if(rs.next()){
                butaca.setIdButaca(rs.getInt("id_butaca"));
                butaca.setFila(rs.getString("fila").charAt(0));
                butaca.setColumna(rs.getInt("columna"));
                butaca.setDiscapacitado(rs.getBoolean("discapacitado"));
                idSala = rs.getInt("fid_sala");
                //salaDao = new SalaMySQL();
                //butaca.setSala(salaDao.obtenerPorId(idSala));
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return butaca;
    }
    
    @Override
    public ArrayList<Butaca> listarButacasXSala(int idSala) {
        ArrayList<Butaca> butacas = new ArrayList<>();
        Butaca butaca;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_BUTACAS_X_SALA(?)}");
            cs.setInt("_id_sala",idSala);
            rs = cs.executeQuery();
            
            while(rs.next()){
                butaca = new Butaca();
                butaca.setIdButaca(rs.getInt("id_butaca"));
                butaca.setFila(rs.getString("fila").charAt(0));
                butaca.setColumna(rs.getInt("columna"));
                butaca.setDiscapacitado(rs.getBoolean("discapacitado"));
                butaca.setSala(new Sala());
                butaca.getSala().setIdSala(rs.getInt("fid_sala"));
                butacas.add(butaca);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return butacas;
    }
    
}
