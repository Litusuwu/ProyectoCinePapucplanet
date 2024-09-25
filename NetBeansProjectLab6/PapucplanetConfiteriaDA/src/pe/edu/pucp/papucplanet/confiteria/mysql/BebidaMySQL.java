package pe.edu.pucp.papucplanet.confiteria.mysql;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class BebidaMySQL implements BebidaDAO{
    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    
    @Override
    public int insertar(Bebida bebida) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_BEBIDA(?,?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_alimento
            cs.setString(2, bebida.getNombre());
            cs.setDouble(3, bebida.getPrecio());
            cs.setInt(4,bebida.getOnzas());
            cs.setBoolean(5,bebida.isTieneHielo()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
            int idBebida = cs.getInt(1);
            bebida.setId(idBebida); // Establecer el ID en el objeto Administrador
            resultado = bebida.getId();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(SQLException ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado;
    }

    @Override
    public int actualizar(Bebida bebida) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICAR_BEBIDA(?,?,?,?,?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.setInt(1,bebida.getId());
            cs.setString(2, bebida.getNombre());
            cs.setDouble(3, bebida.getPrecio());
            cs.setInt(4,bebida.getOnzas());
            cs.setBoolean(5,bebida.isTieneHielo());
            // Ejecutar el procedimiento
            cs.executeUpdate();
            resultado = bebida.getId();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{
                con.close();
            }
            catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        }
        return resultado; 
    }

    @Override
    public int eliminar(int id) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_BEBIDA_X_ID(?)}");
                cs.setInt("_id_bebida", id);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public Bebida obtenerPorId(int id) {
        Bebida bebida = new Bebida();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BEBIDA_X_ID(?)}");
            cs.setInt("_id_bebida", id);
            rs = cs.executeQuery();
            if(rs.next()){
               bebida.setId(rs.getInt("id_bebida"));
               bebida.setNombre(rs.getString("nombre"));
               bebida.setPrecio(rs.getDouble("precio"));
               bebida.setOnzas(rs.getInt("onzas"));
               bebida.setTieneHielo(rs.getBoolean("tieneHielo"));
               bebida.setActivo(rs.getBoolean("activo"));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return bebida;   
    }

    @Override
    public ArrayList<Bebida> listar() {
        ArrayList<Bebida> bebidas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BEBIDAS_TODAS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Bebida bebida = new Bebida();
                bebida.setId(rs.getInt("id_bebida"));
                bebida.setNombre(rs.getString("nombre"));
                bebida.setPrecio(rs.getDouble("precio"));
                bebida.setOnzas(rs.getInt("onzas"));
                bebida.setTieneHielo(rs.getBoolean("tieneHielo"));
                bebida.setActivo(rs.getBoolean("activo"));
                bebidas.add(bebida);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return bebidas;
    }
    
}
