
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
    Connection con = null;
    CallableStatement cs = null;

    try {
        // Obtener la conexión y desactivar el autocommit para iniciar la transacción
        con = DBManager.getInstance().getConnection();
        con.setAutoCommit(false);

        // Preparar y ejecutar el procedimiento almacenado para insertar la sala
        cs = con.prepareCall("{call INSERTAR_SALA(?,?,?,?,?,?)}");
        cs.registerOutParameter("_id_sala", java.sql.Types.INTEGER);
        cs.setInt("_numero_sala", sala.getNumeroSala());
        cs.setInt("_fid_sede", sala.getSede().getIdSede());
        cs.setInt("_capacidad", sala.getCapacidad());
        cs.setInt("_numcol", sala.getNumCol());
        cs.setInt("_numfilas", sala.getNumFila());
        cs.executeUpdate();

        // Obtener el ID de la sala recién insertada
        sala.setIdSala(cs.getInt("_id_sala"));
        result = sala.getIdSala();

        // Cerrar el CallableStatement para reutilizarlo en el siguiente bucle
        cs.close();

        // Preparar el procedimiento almacenado para insertar butacas
        cs = con.prepareCall("{call INSERTAR_BUTACA(?,?,?,?,?)}");
        cs.registerOutParameter("_id_butaca", java.sql.Types.INTEGER);

        // Insertar las butacas asociadas
        for (int i = 'A'; i < 'A' + sala.getNumFila(); i++) {
            for (int j = 1; j <= sala.getNumCol(); j++) {
                cs.setString("_fila", String.valueOf((char) i));
                cs.setInt("_columna", j);
                cs.setBoolean("_discapacitado", false);
                cs.setInt("_fid_sala", sala.getIdSala());
                cs.executeUpdate();
            }
        }

        // Confirmar la transacción
        con.commit();

    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        if (con != null) {
            try {
                con.rollback(); // Hacer rollback en caso de error
            } catch (SQLException ex1) {
                System.out.println("Error en rollback: " + ex1.getMessage());
            }
        }
    } finally {
        // Cerrar recursos para evitar fugas de memoria
        if (cs != null) {
            try {
                cs.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar CallableStatement: " + ex.getMessage());
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar conexión: " + ex.getMessage());
            }
        }
    }

    return result;
}

    @Override
    public int modificar(Sala sala) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_SALA(?,?,?,?,?,?)}");
            cs.setInt("_id_sala", sala.getIdSala());
            cs.setInt("_numero_sala",sala.getNumeroSala());
            cs.setInt("_fid_sede",sala.getSede().getIdSede());
            cs.setInt("_capacidad",sala.getCapacidad());
            cs.setInt("_numcol", sala.getNumCol());
            cs.setInt("_numfilas", sala.getNumFila());
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
    Connection con = null;
    CallableStatement cs = null;

    try {
        // Obtener la conexión y desactivar autocommit para iniciar la transacción
        con = DBManager.getInstance().getConnection();
        con.setAutoCommit(false);

        // Llamada al procedimiento para eliminar la sala
        cs = con.prepareCall("{call ELIMINAR_SALA_X_ID(?)}");
        cs.setInt("_id_sala", idSala);
        result = cs.executeUpdate();
        cs.close(); // Cerrar el CallableStatement para reutilizarlo

        // Llamada al procedimiento para eliminar las butacas asociadas a la sala
        cs = con.prepareCall("{call ELIMINAR_BUTACAS_X_SALA_ID(?)}");
        cs.setInt("_id_sala", idSala);
        cs.executeUpdate();
        cs.close(); // Cerrar el CallableStatement nuevamente

        // Confirmar la transacción
        con.commit();

    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        if (con != null) {
            try {
                con.rollback(); // Deshacer la transacción en caso de error
            } catch (SQLException ex1) {
                System.out.println("Error en rollback: " + ex1.getMessage());
            }
        }
    } finally {
        // Cerrar recursos para evitar fugas de memoria
        if (cs != null) {
            try {
                cs.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar CallableStatement: " + ex.getMessage());
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar conexión: " + ex.getMessage());
            }
        }
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
                sala.setNumCol(rs.getInt("numcol"));
                sala.setNumFila(rs.getInt("numfilas"));
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
                sala.setNumCol(rs.getInt("numcol"));
                sala.setNumFila(rs.getInt("numfilas"));
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
            while(rs.next()){
                sala = new Sala();
                sala.setIdSala(rs.getInt("id_sala"));
                sala.setNumeroSala(rs.getInt("numero_sala"));
                sala.setCapacidad(rs.getInt("capacidad"));
                sala.setNumCol(rs.getInt("numcol"));
                sala.setNumFila(rs.getInt("numfilas"));
                sala.setSede(new Sede());
                sala.getSede().setIdSede(idSede);
                sala.getSede().setUniversidad("nombre_sede");
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
