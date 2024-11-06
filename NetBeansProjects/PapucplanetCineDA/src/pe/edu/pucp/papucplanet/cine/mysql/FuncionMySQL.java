
package pe.edu.pucp.papucplanet.cine.mysql;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
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
            funcion.setIdFuncion(cs.getInt("_id_funcion"));
            
            for(ButacaFuncion butacaFuncion : funcion.getButacasFuncion()){
                cs = con.prepareCall("{call INSERTAR_BUTACA_FUNCION(?,?,?,?,?)}");
                cs.registerOutParameter("_id_butaca_funcion", java.sql.Types.INTEGER);
                cs.setInt("_fid_butaca",butacaFuncion.getIdButaca());
                cs.setInt("_fid_funcion", funcion.getIdFuncion());
                cs.setString("_estado_butaca",butacaFuncion.getEstado().toString());
                cs.setDouble("_precio",butacaFuncion.getPrecio());
                cs.executeUpdate();
                butacaFuncion.setIdButacaFuncion(cs.getInt("_id_butaca_funcion"));
            }
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
            cs.setInt("_id_funcion",funcion.getIdFuncion());
            
            cs.setTime("_horaInicio", new java.sql.Time(funcion.getHorarioInicio().getTime()));
            cs.setTime("_horaFin", new java.sql.Time(funcion.getHorarioFin().getTime()));
            cs.setDate("_dia",new java.sql.Date(funcion.getDia().getTime()));
            cs.setInt("_fid_sala",funcion.getSala().getIdSala());
            cs.setInt("_fid_pelicula",funcion.getPelicula().getIdPelicula());
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

            while(rs.next()){
                funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                funcion.setPelicula(new Pelicula());
                funcion.getPelicula().setIdPelicula(rs.getInt("fid_pelicula"));
                funcion.getPelicula().setTitulo(rs.getString("titulo"));
                funcion.getPelicula().setGenero(Genero.valueOf(rs.getString("genero")));
                funcion.getPelicula().setDuracion(rs.getDouble("duracion"));
                funcion.getPelicula().setSinopsis(rs.getString("sinopsis"));
                funcion.getPelicula().setImagenPromocional(rs.getString("imagen_link"));
                
                //funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                funcion.setSala(new Sala());
                funcion.getSala().setIdSala(rs.getInt("fid_sala"));
                funcion.getSala().setNumeroSala(rs.getInt("numero_sala"));
                funcion.getSala().setSede(new Sede());
                funcion.getSala().getSede().setUniversidad(rs.getString("nombre_sede"));
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

            if(rs.next()){
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                funcion.setPelicula(new Pelicula());
                funcion.getPelicula().setIdPelicula(rs.getInt("fid_pelicula"));
                funcion.getPelicula().setTitulo(rs.getString("titulo"));
                funcion.getPelicula().setGenero(Genero.valueOf(rs.getString("genero")));
                funcion.getPelicula().setDuracion(rs.getDouble("duracion"));
                funcion.getPelicula().setSinopsis(rs.getString("sinopsis"));
                funcion.getPelicula().setImagenPromocional(rs.getString("imagen_link"));
                
                //funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                funcion.setSala(new Sala());
                funcion.getSala().setIdSala(rs.getInt("fid_sala"));
                funcion.getSala().setNumeroSala(rs.getInt("numero_sala"));
                funcion.getSala().setSede(new Sede());
                funcion.getSala().getSede().setIdSede(rs.getInt("id_sede"));
                funcion.getSala().getSede().setUniversidad(rs.getString("nombre_sede"));
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

            while (rs.next()) {
                funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                funcion.setPelicula(new Pelicula());
                funcion.getPelicula().setIdPelicula(rs.getInt("fid_pelicula"));
                funcion.getPelicula().setTitulo(rs.getString("titulo"));
                funcion.getPelicula().setGenero(Genero.valueOf(rs.getString("genero")));
                funcion.getPelicula().setDuracion(rs.getDouble("duracion"));
                funcion.getPelicula().setSinopsis(rs.getString("sinopsis"));
                funcion.getPelicula().setImagenPromocional(rs.getString("imagen_link"));
                
                //funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                funcion.setSala(new Sala());
                funcion.getSala().setIdSala(rs.getInt("fid_sala"));
                funcion.getSala().setNumeroSala(rs.getInt("numero_sala"));
                funcion.getSala().setSede(new Sede());
                funcion.getSala().getSede().setUniversidad(rs.getString("nombre_sede"));
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
    public ArrayList<Funcion> listarFuncionesPorFecha(Date fecha) {
        ArrayList<Funcion> funciones = new ArrayList<>();
        try {
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);

            // Llamada al procedimiento almacenado con el parámetro idPelicula
            cs = con.prepareCall("{call LISTAR_FUNCIONES_POR_FECHA(?)}");
            java.sql.Date sqlFecha = new java.sql.Date(fecha.getTime());
            cs.setDate("_fecha", sqlFecha);
            rs = cs.executeQuery();

            Funcion funcion;

            while (rs.next()) {
                funcion = new Funcion();
                funcion.setIdFuncion(rs.getInt("id_funcion"));
                funcion.setHorarioInicio(new java.sql.Time(rs.getTime("horaInicio").getTime()));
                funcion.setHorarioFin(new java.sql.Time(rs.getTime("horaFin").getTime()));
                funcion.setDia(rs.getDate("dia"));
                funcion.setPelicula(new Pelicula());
                funcion.getPelicula().setIdPelicula(rs.getInt("fid_pelicula"));
                funcion.getPelicula().setTitulo(rs.getString("titulo"));
                funcion.getPelicula().setGenero(Genero.valueOf(rs.getString("genero")));
                funcion.getPelicula().setDuracion(rs.getDouble("duracion"));
                funcion.getPelicula().setSinopsis(rs.getString("sinopsis"));
                funcion.getPelicula().setImagenPromocional(rs.getString("imagen_link"));
                
                //funcion.setPelicula(peliculaDao.obtenerPorId(idPelicula));
                funcion.setSala(new Sala());
                funcion.getSala().setIdSala(rs.getInt("fid_sala"));
                funcion.getSala().setNumeroSala(rs.getInt("numero_sala"));
                funcion.getSala().setSede(new Sede());
                funcion.getSala().getSede().setUniversidad(rs.getString("nombre_sede"));

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
    public int modificarConButacasFuncion(Funcion funcion) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_FUNCION(?,?,?,?,?,?)}");
            cs.setInt("_id_funcion",funcion.getIdFuncion());
            
            cs.setTime("_horaInicio", new java.sql.Time(funcion.getHorarioInicio().getTime()));
            cs.setTime("_horaFin", new java.sql.Time(funcion.getHorarioFin().getTime()));
            cs.setDate("_dia",new java.sql.Date(funcion.getDia().getTime()));
            cs.setInt("_fid_sala",funcion.getSala().getIdSala());
            cs.setInt("_fid_pelicula",funcion.getPelicula().getIdPelicula());
            cs.executeUpdate();
            
            cs = con.prepareCall("{call ELIMINAR_BUTACAS_FUNCION_X_ID_FUNCION(?)}");
            cs.setInt("_id_funcion",funcion.getIdFuncion());
            cs.executeUpdate();
            
            for(ButacaFuncion butacaFuncion : funcion.getButacasFuncion()){
                cs = con.prepareCall("{call INSERTAR_BUTACA_FUNCION(?,?,?,?,?)}");
                cs.registerOutParameter("_id_butaca_funcion", java.sql.Types.INTEGER);
                cs.setInt("_fid_butaca",butacaFuncion.getIdButaca());
                cs.setInt("_fid_funcion", funcion.getIdFuncion());
                cs.setString("_estado_butaca",butacaFuncion.getEstado().toString());
                cs.setDouble("_precio",butacaFuncion.getPrecio());
                cs.executeUpdate();
                butacaFuncion.setIdButacaFuncion(cs.getInt("_id_butaca_funcion"));
            }
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
}