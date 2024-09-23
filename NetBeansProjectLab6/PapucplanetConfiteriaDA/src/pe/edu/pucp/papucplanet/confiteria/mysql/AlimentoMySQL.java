package pe.edu.pucp.papucplanet.confiteria.mysql;

import com.papucplanet.dbmanager.model.DBManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;

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
            cs.setString(5, alimento.getTipoAlimento().name()); 
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID del administrador generado (parámetro OUT)
            int idAdministrador = cs.getInt(1);
            alimento.setCodigo(idAdministrador); // Establecer el ID en el objeto Administrador
            resultado = alimento.getCodigo();
        }catch(Exception ex){
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
    public int actualizar(Alimento alimento) {
        
    }

    @Override
    public int eliminar(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Alimento obtenerPorCodigo(int codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Alimento> listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
