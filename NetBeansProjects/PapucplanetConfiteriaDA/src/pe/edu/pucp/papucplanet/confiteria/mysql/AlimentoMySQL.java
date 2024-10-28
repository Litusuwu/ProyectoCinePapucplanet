package pe.edu.pucp.papucplanet.confiteria.mysql;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.model.TipoAlimento;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class AlimentoMySQL implements AlimentoDAO{
    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    
    @Override
    public int insertar(Alimento alimento) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_ALIMENTO(?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_alimento
            cs.setString(2, alimento.getNombre());
            cs.setDouble(3, alimento.getPrecio());
            cs.setDouble(4, alimento.getPesoPromedio());
            cs.setString(5, alimento.getTipoAlimento().toString()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
            int idAdministrador = cs.getInt(1);
            alimento.setId(idAdministrador); // Establecer el ID en el objeto Administrador
            resultado = alimento.getId();
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
    public int actualizar(Alimento alimento) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICAR_ALIMENTO(?,?,?,?,?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.setInt(1,alimento.getId());
            cs.setString(2, alimento.getNombre());
            cs.setDouble(3, alimento.getPrecio());
            cs.setDouble(4, alimento.getPesoPromedio());
            cs.setString(5, alimento.getTipoAlimento().toString()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();
            resultado = alimento.getId();
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
            cs = con.prepareCall("{call ELIMINAR_ALIMENTO_X_ID(?)}");
                cs.setInt("_id_alimento", id);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public Alimento obtenerPorId(int id) {
        Alimento alimento = new Alimento();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALIMENTO_X_ID(?)}");
            cs.setInt("_id_alimento", id);
            rs = cs.executeQuery();
            if(rs.next()){
               alimento.setId(rs.getInt("id_alimento"));
               alimento.setNombre(rs.getString("nombre"));
               alimento.setPrecio(rs.getDouble("precio"));
               alimento.setPesoPromedio(rs.getDouble("pesoPromedio"));
               alimento.setTipoAlimento(TipoAlimento.valueOf(rs.getString("tipo_alimento")));
               alimento.setActivo(rs.getBoolean("activo"));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return alimento;        
    }

    @Override
    public ArrayList<Alimento> listar() {
        ArrayList<Alimento> productos = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_ALIMENTOS_TODOS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Alimento producto = new Alimento();
                producto.setId(rs.getInt("id_alimento"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setPesoPromedio(rs.getDouble("pesoPromedio"));
                producto.setTipoAlimento(TipoAlimento.valueOf(rs.getString("tipo_alimento")));
                productos.add(producto);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return productos;
    }
    
}
