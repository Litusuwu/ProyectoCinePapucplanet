
package pe.edu.pucp.papucplanet.cine.mysql;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.dao.PeliculaDAO;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.util.ArrayList;
import java.time.LocalTime;
import java.sql.Time;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import pe.edu.pucp.papucplanet.cine.model.Genero;
import pe.edu.pucp.papucplanet.cine.model.Sede;


public class FuncionMySQL implements FuncionDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Funcion funcion) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_FUNCION(?,?,?,?,?,?)}");
            cs.registerOutParameter("_id_funcion", java.sql.Types.INTEGER);
            
            cs.setTime("_horaInicio", new java.sql.Time(funcion.getHorarioInicio().getTime()));
            cs.setTime("_horaFin", new java.sql.Time(funcion.getHorarioFin().getTime()));
            
            cs.setDate("_dia",new java.sql.Date(funcion.getDia().getTime()));
            cs.setInt("_fid_sala",funcion.getSala().getIdSala());
            cs.setInt("_fid_pelicula",funcion.getPelicula().getIdPelicula());
            cs.executeUpdate();
            
            resultado = funcion.getIdFuncion();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public int modificar(Funcion funcion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_FUNCION(?,?,?,?,?,?)}");
            cs.setInt("id_funcion",funcion.getIdFuncion());
            
            cs.setTime("_horaInicio", new java.sql.Time(funcion.getHorarioInicio().getTime()));
            cs.setTime("_horaFin", new java.sql.Time(funcion.getHorarioFin().getTime()));
            
            cs.setDate("_dia",new java.sql.Date(funcion.getDia().getTime()));
            cs.setInt("_fid_sala",funcion.getSala().getIdSala());
            cs.setInt("_fid_pelicula",funcion.getPelicula().getIdPelicula());
            cs.executeUpdate();
            /*
            ButacaFuncionDAO bufuDao = new ButacaFuncionMySQL();
            for(ButacaFuncion bufu: funcion.getButacasFuncion()){
                bufu.setFuncion(funcion);
                bufuDao.insertar(bufu);
            }
            */
            result = funcion.getIdFuncion();
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
    public int eliminar(int idFuncion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_FUNCION_X_ID(?)}");
            cs.setInt("_id_funcion",idFuncion);
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
    public ArrayList<Funcion> listarTodos() {
        ArrayList<Funcion> funciones = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_FUNCIONES_TODAS()}");
            rs = cs.executeQuery();
            Funcion funcion;
            PeliculaDAO peliculaDao = new PeliculaMySQL();
            int idPelicula;
            SalaDAO salaDao = new SalaMySQL();
            int idSala;
            while(rs.next()){
                funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                idPelicula = rs.getInt("fid_pelicula");
                funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                idSala = rs.getInt("fid_sala");
                funcion.setSala(salaDao.obtenerPorId(idSala));
                funciones.add(funcion);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return funciones;
    }

    @Override
    public Funcion obtenerPorId(int idFuncion) {
        Funcion funcion = new Funcion();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_FUNCION_X_ID(?)}");
            cs.setInt("_id_funcion",idFuncion);
            rs = cs.executeQuery();
            PeliculaDAO peliculaDao = new PeliculaMySQL();
            int idPelicula;
            SalaDAO salaDao = new SalaMySQL();
            int idSala;
            if(rs.next()){
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                idPelicula = rs.getInt("fid_pelicula");
                funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                idSala = rs.getInt("fid_sala");
                funcion.setSala(salaDao.obtenerPorId(idSala));
                //No implementar listar de butacas funcion porque implicaria bucle
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return funcion;
    }
    
    @Override
    public ArrayList<Funcion> obtenerFuncionesPorPelicula(int idPelicula) {
        ArrayList<Funcion> funciones = new ArrayList<>();
        try {
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);

            // Llamada al procedimiento almacenado con el parámetro idPelicula
            cs = con.prepareCall("{call OBTENER_FUNCIONES_POR_PELICULA(?)}");
            cs.setInt("_id_pelicula", idPelicula);
            rs = cs.executeQuery();

            Funcion funcion;
            PeliculaDAO peliculaDao = new PeliculaMySQL();
            SalaDAO salaDao = new SalaMySQL();
            int idSala,idPeliculaDB;

            while (rs.next()) {
                funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));       
                funcion.setDia(rs.getDate("dia"));          

                // Asignación de la película y la sala a través de DAOs
                idPeliculaDB = rs.getInt("fid_pelicula");
                funcion.setPelicula(peliculaDao.obtenerPorId(idPeliculaDB));

                idSala = rs.getInt("fid_sala");
                funcion.setSala(salaDao.obtenerPorId(idSala));

                // Agregar la función a la lista
                funciones.add(funcion);
            }

            con.commit();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            try { con.rollback(); } catch (SQLException ex1) { System.out.println(ex1.getMessage()); }
        } finally {
            try { con.close(); } catch (SQLException ex) { System.out.println(ex.getMessage()); }
        }
        return funciones;
    }
    
    @Override
    public ArrayList<Funcion> listarPeliculasConFuncionesActivas() {
        ArrayList<Funcion> funciones = new ArrayList<>();

        try {
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ListarPeliculasConFuncionesActivas()}");
            rs = cs.executeQuery();

            while (rs.next()) {
                Funcion funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(rs.getTime("horaInicio"));
                funcion.setHorarioFin(rs.getTime("horaFin"));
                funcion.setDia(rs.getDate("dia"));

                // Obtener y asignar la película asociada a la función
                Pelicula pelicula = new Pelicula();
                pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setDuracion(rs.getDouble("duracion"));
                pelicula.setGenero(Genero.valueOf(rs.getString("genero")));
                pelicula.setSinopsis(rs.getString("sinopsis"));
                pelicula.setImagenPromocional(rs.getString("imagen_link"));
                funcion.setPelicula(pelicula);

                // Obtener y asignar la sala asociada a la función
                Sala sala = new Sala();
                sala.setIdSala(rs.getInt("fid_sala"));
                
                //Obtener y asignar la sede asociada a la sala
                Sede sede = new Sede();
                sede.setIdSede(rs.getInt("id_sede"));
                sede.setUniversidad(rs.getString("nombre"));
                sala.setSede(sede); // Establece la sede en la sala
                
                // Puedes agregar más campos de `Sala` aquí si el procedimiento almacenado los devuelve
                funcion.setSala(sala);
                // Añadir la función a la lista de funciones
                funciones.add(funcion);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar funciones con películas activas: " + ex.getMessage());
        } finally {
            // Cerrar recursos en el bloque finally
            try {
                if (rs != null) rs.close();
                if (cs != null) cs.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar recursos: " + ex.getMessage());
            }
        }

        return funciones;
    }
    
}