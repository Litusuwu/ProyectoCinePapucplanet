
package pe.edu.pucp.papucplanet.cine.mysql;

import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.cine.model.Sala;
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
            //SalaDao salaDao;
            for(Sala sala : sede.getSalas()){
                //salaDao.insertar(sala);
                cs = con.prepareCall("call INSERTAR_SALA(?,?,?,?)");
                cs.registerOutParameter("_id_sala",java.sql.Types.INTEGER);
                cs.setInt("_numero_sala",sala.getNumeroSala());
                cs.setInt("_fid_sede",sede.getIdSede());
                cs.setInt("_capacidad",sala.getCapacidad());
                cs.executeUpdate();
                sala.setIdSala(cs.getInt("_id_sala"));
            }
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int idSede) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Sede> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Sede obtenerPorId(int idSede) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
