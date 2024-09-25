
package pe.edu.pucp.papucplanet.cine.mysql;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.cine.model.EstadoButaca;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

public class ButacaFuncionMySQL implements ButacaFuncionDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(ButacaFuncion butacaFuncion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_BUTACA_FUNCION(?,?,?,?,?)}");
            cs.registerOutParameter("_id_butaca_funcion", java.sql.Types.INTEGER);
            
            cs.setInt("_fid_butaca",butacaFuncion.getIdButaca());
            cs.setInt("_fid_funcion",butacaFuncion.getFuncion().getIdFuncion());
            cs.setString("_estado_butaca",butacaFuncion.getEstado().toString());
            cs.setDouble("_precio",butacaFuncion.getPrecio());
            cs.executeUpdate();
            /*
            ButacaFuncionDAO bufuDao = new ButacaFuncionMySQL();
            for(ButacaFuncion bufu: funcion.getButacasFuncion()){
                bufu.setFuncion(funcion);
                bufuDao.insertar(bufu);
            }
            //pelicula.setIdPelicula(cs.getInt("_id_pelicula"));*/
            
            result = butacaFuncion.getIdButacaFuncion();
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
    public int modificar(ButacaFuncion butacaFuncion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_BUTACA_FUNCION(?,?,?,?,?)}");
            cs.registerOutParameter("_id_butaca_funcion", java.sql.Types.INTEGER);
            
            cs.setInt("_fid_butaca",butacaFuncion.getIdButaca());
            cs.setInt("_fid_funcion",butacaFuncion.getFuncion().getIdFuncion());
            cs.setString("_estado_butaca",butacaFuncion.getEstado().toString());
            cs.setDouble("_precio",butacaFuncion.getPrecio());
            cs.executeUpdate();
            
            result = butacaFuncion.getIdButacaFuncion();
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
    public int eliminar(int idButacaFuncion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_BUTACA_FUNCION_X_ID(?)}");
            cs.setInt("_id_butaca_funcion",idButacaFuncion);
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
    public ArrayList<ButacaFuncion> listarTodos() {
        ArrayList<ButacaFuncion> butacasfunciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_BUTACAS_TODAS()}");
            rs = cs.executeQuery();
            ButacaFuncion butacaFuncion;
            int id;
            FuncionDAO funcionDAO = new FuncionMySQL();
            ButacaDAO butacaDAO = new ButacaMySQL();
            while(rs.next()){
                butacaFuncion = new ButacaFuncion();
                butacaFuncion.setIdButacaFuncion(rs.getInt("id_butaca_funcion"));
                butacaFuncion.setPrecio(rs.getDouble("precio"));
                butacaFuncion.setActivo(rs.getBoolean("activo"));
                EstadoButaca est=EstadoButaca.valueOf(rs.getString("estado"));
                butacaFuncion.setEstado(est);
                id = rs.getInt("fid_funcion");          
                
                Funcion fun=funcionDAO.obtenerPorId(id);
                id = rs.getInt("fid_butaca");
                
                Butaca but=butacaDAO.obtenerPorId(id);
                butacaFuncion.setIdButaca(id);
                butacaFuncion.setFila(but.getFila());
                butacaFuncion.setColumna(but.getColumna());
                butacaFuncion.setDiscapacitado(but.isDiscapacitado());
                butacaFuncion.setSala(but.getSala());
                butacaFuncion.setFuncion(fun);
                butacasfunciones.add(butacaFuncion);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return butacasfunciones;
    }

    @Override
    public ButacaFuncion obtenerPorId(int idButacaFuncion) {
        ButacaFuncion butacaFuncion = new ButacaFuncion();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_BUTACA_FUNCION_X_ID(?)}");
            cs.setInt("id_butaca_funcion",idButacaFuncion);
            rs = cs.executeQuery();
            int id;
            if(rs.next()){
                butacaFuncion.setIdButacaFuncion(rs.getInt("id_butaca_funcion"));
                butacaFuncion.setPrecio(rs.getDouble("precio"));
                butacaFuncion.setActivo(rs.getBoolean("activo"));
                EstadoButaca est=EstadoButaca.valueOf(rs.getString("estado"));
                butacaFuncion.setEstado(est);
                id = rs.getInt("fid_funcion");          
                FuncionDAO funcionDAO = new FuncionMySQL();
                Funcion fun=funcionDAO.obtenerPorId(id);
                id = rs.getInt("fid_butaca");
                
                ButacaDAO butacaDAO = new ButacaMySQL();
                Butaca but=butacaDAO.obtenerPorId(id);
                butacaFuncion.setIdButaca(id);
                butacaFuncion.setFila(but.getFila());
                butacaFuncion.setColumna(but.getColumna());
                butacaFuncion.setDiscapacitado(but.isDiscapacitado());
                butacaFuncion.setSala(but.getSala());
                butacaFuncion.setFuncion(fun);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return butacaFuncion;
    }
    
}
