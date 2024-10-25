package pe.edu.pucp.papucplanet.compras.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.mysql.ButacaFuncionMySQL;
import pe.edu.pucp.papucplanet.cine.mysql.ButacaMySQL;
import pe.edu.pucp.papucplanet.cine.mysql.SedeMySQL;
import pe.edu.pucp.papucplanet.compras.dao.BoletaDAO;
import pe.edu.pucp.papucplanet.compras.dao.LineaBoletaDAO;
import pe.edu.pucp.papucplanet.compras.model.Boleta;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.confiteria.model.Consumible;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class LineaBoletaMySQL implements LineaBoletaDAO{
    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    
    @Override
    public int insertar(LineaBoleta lineaBoleta) {
        int resultado = 0;
        try{
            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_LINEA_BOLETA(?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_lineaBoleta
            //cs.setInt(2, lineaBoleta.getBoleta().getIdBoleta());
            if(lineaBoleta.getConsumible() == null){
                cs.setInt(3,0);
            }else{
                cs.setInt(3, lineaBoleta.getConsumible().getId());
            }
            if(lineaBoleta.getButacaFuncion() == null){
                cs.setInt(4, 0);
            }else{
                cs.setInt(4, lineaBoleta.getButacaFuncion().getIdButacaFuncion());
            }
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
            //cs.setInt(2, lineaBoleta.getBoleta().getIdBoleta());
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
        BoletaDAO boleta = new BoletaMySQL();
        ButacaFuncionDAO butacaFuncion = new ButacaFuncionMySQL();
        
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_LINEA_BOLETA_X_ID(?)}");
            cs.setInt("_id_linea_boleta", id);
            rs = cs.executeQuery();
            int idBoleta = 0, idButacaFuncion = 0, idConsumible = 0;
            if(rs.next()){
               lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
               idBoleta = rs.getInt("fid_boleta");
               //lineaBoleta.setBoleta(boleta.obtenerPorId(idBoleta));
               
               if (rs.next()) {
                   Consumible consumible;
                    // Asignar los valores desde el ResultSet
                    if(rs.getInt("id_bebida") != 0){
                        consumible = new Bebida();
                    }
                    else if(rs.getInt("id_alimento") != 0){
                        consumible = new Alimento();
                    }
                    else{
                        throw new IllegalArgumentException("No existe ese consumible.");
                    }

                    consumible.setId(rs.getInt("id_consumible"));
                    lineaBoleta.setConsumible(consumible);
                }
               
               idButacaFuncion = rs.getInt("fid_butaca_funcion");
               lineaBoleta.setButacaFuncion(butacaFuncion.obtenerPorId(idButacaFuncion));
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
        ArrayList<LineaBoleta> lineasBoletas = new ArrayList<>();
        int idBoleta,idConsumible,idButaca;
        BoletaDAO boletaSQL = new BoletaMySQL();
        ButacaFuncionDAO butacaFuncionSQL = new ButacaFuncionMySQL();
        AlimentoDAO alimentoSQL = new AlimentoMySQL();
        Alimento alimento;
        BebidaDAO bebidaSQL = new BebidaMySQL();
        Bebida bebida;
        ButacaFuncion butacaFuncion;
                
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            
            cs = con.prepareCall("{CALL INFORMACION_EXTRA_LINEA_BOLETA()}");
            rs = cs.executeQuery();
            
            while(rs.next()){
                
                LineaBoleta lineaboleta = new LineaBoleta();
                // Asignar los valores desde el ResultSet  
                idConsumible = rs.getInt("id_consumible");
                
                if(rs.getInt("id_alimento") != 0){
                    alimento = alimentoSQL.obtenerPorId(idConsumible);
                    lineaboleta.setConsumible(alimento);
                }
                else if(rs.getInt("id_bebida") != 0){
                    bebida = bebidaSQL.obtenerPorId(idConsumible);
                    lineaboleta.setConsumible(bebida);
                }
                else{
                    throw new IllegalArgumentException("No existe ese usuario.");
                }
               
                idBoleta = rs.getInt("fid_boleta");
                idButaca = rs.getInt("fid_butaca");
                
                butacaFuncion = butacaFuncionSQL.obtenerPorId(idButaca);
                lineaboleta.setButacaFuncion(butacaFuncion);
                lineaboleta.setCantidad(rs.getInt("cantidad"));
                lineaboleta.setActivo(rs.getBoolean("activo"));
                lineaboleta.setSubtotal(rs.getInt("subtotal"));
                lineaboleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
                lineasBoletas.add(lineaboleta);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return lineasBoletas;
    }
}
