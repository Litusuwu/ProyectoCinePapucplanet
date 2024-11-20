package pe.edu.pucp.papucplanet.dbmanager.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;

public class DBManager {
    private static DBManager dbManager;
    private String url = "jdbc:mysql://" +
                          "db-prog3-ta.c1880o4gidki.us-east-1.rds.amazonaws.com"
                          + ":3306/" + "TAprog3" + "?useSSL=false";
    private String usuario = "admin";
    private String password = "Lospapusprime123";
    private Connection con;
    private ResultSet rs;
            
    public static DBManager getInstance(){
        if(dbManager == null){
            createInstance();
        }
        return dbManager;
    }
    private static void createInstance(){
        dbManager = new DBManager();
    }
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, password);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return con;
    }
    
     public void cerrarConexion() {
        if(rs != null){
            try{
                rs.close();
            }catch(SQLException ex){
                System.out.println("Error al cerrar el lector:" + ex.getMessage());
            }
        }
        if (con != null) {
            try {
                con.close();  
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión:" + ex.getMessage());
            }
        }
    }
}
