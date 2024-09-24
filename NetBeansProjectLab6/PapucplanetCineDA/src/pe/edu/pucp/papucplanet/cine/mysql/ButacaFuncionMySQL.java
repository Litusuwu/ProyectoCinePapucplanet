
package pe.edu.pucp.papucplanet.cine.mysql;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.model.EstadoButaca;
import pe.edu.pucp.papucplanet.cine.model.Funcion;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;


public class ButacaFuncionMySQL implements ButacaFuncionDAO{
    private Connection con;
    private CallableStatement cs;
    private ResultSet rs;
    @Override
    public int insertar(ButacaFuncion butacaFuncion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int modificar(ButacaFuncion butacaFuncion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int eliminar(int idButacaFuncion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<ButacaFuncion> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ButacaFuncion obtenerPorId(int idButacaFuncion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
