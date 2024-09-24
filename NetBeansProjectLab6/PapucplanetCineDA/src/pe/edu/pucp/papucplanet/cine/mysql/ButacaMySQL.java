package pe.edu.pucp.papucplanet.cine.mysql;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class ButacaMySQL implements ButacaDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Butaca butaca) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call INSERTAR_BUTACA(?,?,?,?,?)}");
            cs.registerOutParameter("_id_butaca", java.sql.Types.INTEGER);
            cs.setString("_fila",String.valueOf(butaca.getFila()));
            cs.setInt("_columna",butaca.getColumna());
            cs.setBoolean("_discapacitado",butaca.isDiscapacitado());
            cs.setInt("_fid_sala",butaca.getSala().getIdSala());
            cs.executeUpdate();
            butaca.setIdButaca(cs.getInt("_id_butaca"));
            result = butaca.getIdButaca();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return result;
    }

    @Override
    public int modificar(Butaca butaca) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call MODIFICAR_BUTACA(?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_butaca", java.sql.Types.INTEGER);
            cs.setString("_fila",String.valueOf(butaca.getFila()));
            cs.setInt("_columna",butaca.getColumna());
            cs.setBoolean("_discapacitado",butaca.isDiscapacitado());
            cs.setInt("_fid_sala",butaca.getSala().getIdSala());
            cs.setBoolean("_activo",butaca.isActivo());
            cs.executeUpdate();
            butaca.setIdButaca(cs.getInt("_id_butaca"));
            result = butaca.getIdButaca();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return result;
    }

    @Override
    public int eliminar(int idButaca) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Butaca> listarTodos() {
        ArrayList<Butaca> butacas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BUTACAS_TODAS()}");
            rs = cs.executeQuery();
            Butaca butaca;
            int idSala;
            //SalaDAO salaDao;
            while(rs.next()){
                butaca = new Butaca();
                butaca.setIdButaca(rs.getInt("_id_butaca"));
                butaca.setFila(rs.getString("_fila").charAt(0));
                butaca.setColumna(rs.getInt("_columna"));
                butaca.setDiscapacitado(rs.getBoolean("_discapacitado"));
                idSala = rs.getInt("_fid_sala");
                //salaDao = new Sala();
                //butaca.setSala(salaDao.obtenerPorId(idSala));
                butacas.add(butaca);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return butacas;
    }

    @Override
    public Butaca obtenerPorId(int idButaca) {
        Butaca butaca = new Butaca();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BUTACAS_TODAS()}");
            cs.setInt("_id_butaca",idButaca);
            rs = cs.executeQuery();
            int idSala = 0;
            //SalaDAO salaDao;
            if(rs.next()){
                butaca.setIdButaca(rs.getInt("_id_butaca"));
                butaca.setFila(rs.getString("_fila").charAt(0));
                butaca.setColumna(rs.getInt("_columna"));
                butaca.setDiscapacitado(rs.getBoolean("_discapacitado"));
                idSala = rs.getInt("_fid_sala");
                //salaDao = new Sala();
                //butaca.setSala(salaDao.obtenerPorId(idSala));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return butaca;
    }
    
}
