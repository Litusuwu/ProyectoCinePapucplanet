package pe.edu.pucp.papucplanet.compras.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.compras.dao.BoletaDAO;
import pe.edu.pucp.papucplanet.compras.dao.LineaBoletaDAO;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;
import pe.edu.pucp.papucplanet.confiteria.model.Consumible;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class LineaBoletaMySQL implements LineaBoletaDAO{
    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    
    @Override
    public int insertar(LineaBoleta lineaBoleta) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_LINEA_BOLETA(?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_lineaBoleta
            cs.setInt(2, lineaBoleta.getBoleta().getIdBoleta());
            
            cs.setInt(3, lineaBoleta.getConsumible().getId());
            cs.setInt(4, lineaBoleta.getButacaFuncion().getIdButacaFuncion());
            cs.setInt(5, lineaBoleta.getCantidad()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
            int idAdministrador = cs.getInt(1);
            lineaBoleta.setIdLineaBoleta(idAdministrador); // Establecer el ID en el objeto Administrador
            resultado = lineaBoleta.getIdLineaBoleta();
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
    public int actualizar(LineaBoleta lineaBoleta) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICAR_LINEA_BOLETA(?,?,?,?,?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.setInt(1,lineaBoleta.getIdLineaBoleta());
            cs.setInt(2, lineaBoleta.getBoleta().getIdBoleta());
            cs.setInt(3, lineaBoleta.getConsumible().getId());
            cs.setInt(4, lineaBoleta.getButacaFuncion().getIdButacaFuncion());
            cs.setInt(5, lineaBoleta.getCantidad()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();
            resultado = lineaBoleta.getIdLineaBoleta();
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
            cs = con.prepareCall("{call ELIMINAR_LINEA_BOLETA_X_ID(?)}");
                cs.setInt("_id_linea_boleta", id);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public LineaBoleta  obtenerPorId(int id) {
        LineaBoleta lineaBoleta = new LineaBoleta();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_LINEA_BOLETA_X_ID(?)}");
            cs.setInt("_id_linea_boleta", id);
            rs = cs.executeQuery();
            int idBoleta = 0, idButacaFuncion = 0, idConsumible = 0;
            if(rs.next()){
               lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
               idBoleta = rs.getInt("fid_boleta");
               lineaBoleta.setBoleta(BoletaDAO.obtenerPorId(idBoleta));//falta implementar
               
               
               
               
               idConsumible = rs.getInt("fid_consumible");
               lineaBoleta.setConsumible(consumible.getId());
               
               
               idButacaFuncion = rs.getInt("fid_butaca_funcion");
               lineaBoleta.setButacaFuncion(ButacaFuncionDAO.obtenerPorId(idButacaFuncion));//falta implementar
               lineaBoleta.setCantidad(rs.getInt("cantidad"));
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(Exception ex){System.out.println(ex.getMessage());}
        }
        return lineaBoleta;        
    }

    @Override
    public ArrayList<LineaBoleta> listar() {
        ArrayList<LineaBoleta> lineaBoletas = new ArrayList<>();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_LINEAS_BOLETAS_TODAS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                LineaBoleta lineaBoleta = new LineaBoleta();
                lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
                lineaBoleta.setNombre(rs.getString("nombre"));
                lineaBoleta.setPrecio(rs.getDouble("precio"));
                lineaBoleta.setPesoPromedio(rs.getDouble("pesoPromedio"));
                lineaBoleta.setTipoAlimento(TipoAlimento.valueOf(rs.getString("tipo_alimento")));
                lineaBoleta.add(lineaBoleta);
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return productos;
    }
}
