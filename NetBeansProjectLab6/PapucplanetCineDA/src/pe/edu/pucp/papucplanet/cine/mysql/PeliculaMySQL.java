
package pe.edu.pucp.papucplanet.cine.mysql;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.PeliculaDAO;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.model.Genero;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;


public class PeliculaMySQL implements PeliculaDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(Pelicula pelicula) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_PELICULA(?,?,?,?,?)}");
            cs.registerOutParameter("_id_pelicula", java.sql.Types.INTEGER);
            cs.setString("_titulo",pelicula.getTitulo());
            cs.setDouble("_duracion",pelicula.getDuracion());
            cs.setString("_genero",String.valueOf(pelicula.getGenero()));
            cs.setString("_sinopsis",pelicula.getSinopsis());
            cs.executeUpdate();
            pelicula.setIdPelicula(cs.getInt("_id_pelicula"));
            result = pelicula.getIdPelicula();
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
    public int modificar(Pelicula pelicula) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_PELICULA(?,?,?,?,?)}");
            cs.setInt("_id_pelicula", pelicula.getIdPelicula());
            cs.setString("_titulo",pelicula.getTitulo());
            cs.setDouble("_duracion",pelicula.getDuracion());
            cs.setString("_genero",String.valueOf(pelicula.getGenero()));
            cs.setString("_sinopsis",pelicula.getSinopsis());
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
    public int eliminar(int idPelicula) {
        int result = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call ELIMINAR_PELICULA_X_ID(?)}");
            cs.setInt("_id_pelicula",idPelicula);
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
    public ArrayList<Pelicula> listarTodos() {
        ArrayList<Pelicula> peliculas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_PELICULAS_TODAS()}");
            rs = cs.executeQuery();
            Pelicula pelicula;
            
            while(rs.next()){
                pelicula = new Pelicula();
                pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setGenero(Genero.valueOf(rs.getString("genero")));
                pelicula.setDuracion(rs.getDouble("duracion"));
                pelicula.setSinopsis(rs.getString("sinopsis"));
                peliculas.add(pelicula);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return peliculas;
    }

    @Override
    public Pelicula obtenerPorId(int idPelicula) {
        Pelicula pelicula = new Pelicula();
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call LISTAR_PELICULA_X_ID(?)}");
            cs.setInt("_id_pelicula",idPelicula);
            rs = cs.executeQuery();
            
            if(rs.next()){
                pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setGenero(Genero.valueOf(rs.getString("genero")));
                pelicula.setDuracion(rs.getDouble("duracion"));
                pelicula.setSinopsis(rs.getString("sinopsis"));
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage(); }
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());};
        }
        return pelicula;
    }
    
}
