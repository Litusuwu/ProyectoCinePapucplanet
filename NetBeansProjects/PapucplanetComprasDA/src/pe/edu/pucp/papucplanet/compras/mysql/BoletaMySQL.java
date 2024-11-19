package pe.edu.pucp.papucplanet.compras.mysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jdk.dynalink.linker.support.Guards;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.compras.dao.BoletaDAO;
import pe.edu.pucp.papucplanet.compras.model.Boleta;
import pe.edu.pucp.papucplanet.compras.model.LineaBoleta;
import pe.edu.pucp.papucplanet.compras.model.MetodoPago;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;

public class BoletaMySQL implements BoletaDAO{
    private ResultSet rs,rs2;
    private Connection con;
    private CallableStatement cs;
     // Método para insertar una nueva boleta
    @Override
    public int insertar(Boleta boleta){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call INSERTAR_BOLETA(?,?,?,?,?)}");
            cs.registerOutParameter("_id_boleta", java.sql.Types.INTEGER);
            cs.setInt("_fid_cliente", boleta.getCliente().getId());
            cs.setDate("_fechaCompra", new java.sql.Date(boleta.getFechaCompra().getTime()));
            cs.setString("_metodo_pago", boleta.getMetodoPago().toString());
            cs.setDouble("_total", boleta.getTotal());
            cs.executeUpdate();
            boleta.setIdBoleta(cs.getInt("_id_boleta"));
            for(LineaBoleta lb : boleta.getLineasBoleta()){
                if(lb.getButacaFuncion() != null){
                    cs= con.prepareCall("{call RESERVAR_BUTACA_FUNCION(?)}");
                    cs.setInt(1, lb.getButacaFuncion().getIdButacaFuncion());  // _id_butaca_funcion
                    int res=cs.executeUpdate(); // Llamar al procedimiento para reservar la butaca
                    if (res == 0) {  
                        con.rollback(); 
                        System.out.println("Error al reservar la butaca.");
                        con.close();
                        return res;  // Terminar la ejecución del método si hay error
                    }
                }
                cs = con.prepareCall("{call INSERTAR_LINEA_BOLETA(?,?,?,?,?,?)}");
                cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_lineaBoleta
                cs.setInt(2, boleta.getIdBoleta());
                if(lb.getConsumible() == null){
                    cs.setInt(3,0);
                }else{
                    cs.setInt(3, lb.getConsumible().getId());
                }
                if(lb.getButacaFuncion() == null){
                    cs.setInt(4, 0);
                }else{
                    cs.setInt(4, lb.getButacaFuncion().getIdButacaFuncion());
                }
                cs.setInt(5, lb.getCantidad());
                cs.setDouble(6, lb.getSubtotal());
                // Ejecutar el procedimiento
                cs.executeUpdate();
                lb.setIdLineaBoleta(cs.getInt("_id_linea_boleta"));
            }
            resultado = boleta.getIdBoleta();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage();}
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    @Override
    // Método para actualizar los datos de una boleta existente
    public int actualizar(Boleta boleta){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            cs = con.prepareCall("{call MODIFICAR_BOLETA(?,?,?,?,?)}");
            cs.setInt("_id_boleta", boleta.getIdBoleta());
            cs.setInt("_fid_cliente", boleta.getCliente().getId());
            cs.setDate("_fechaCompra", new java.sql.Date(boleta.getFechaCompra().getTime()));
            cs.setString("_metodo_pago", boleta.getMetodoPago().toString());
            cs.setDouble("_total", boleta.getTotal());
            cs.executeUpdate();
            for(LineaBoleta lb : boleta.getLineasBoleta()){
                cs = con.prepareCall("{call INSERTAR_LINEA_BOLETA(?,?,?,?,?)}");
                cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_lineaBoleta
                cs.setInt(2, boleta.getIdBoleta());
                if(lb.getConsumible() == null){
                    cs.setInt(3,0);
                }else{
                    cs.setInt(3, lb.getConsumible().getId());
                }
                if(lb.getButacaFuncion() == null){
                    cs.setInt(4, 0);
                }else{
                    cs.setInt(4, lb.getButacaFuncion().getIdButacaFuncion());
                }
                cs.setInt(5, lb.getCantidad());
                cs.setDouble(6, lb.getSubtotal());
                // Ejecutar el procedimiento
                cs.executeUpdate();
                lb.setIdLineaBoleta(cs.getInt("_id_linea_boleta"));
            }
            resultado = boleta.getIdBoleta();
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            try{con.rollback();}catch(SQLException ex1){ex1.getMessage();}
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    // Método para eliminar una boleta por su código
    @Override
    public int eliminar(int id){
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_BOLETA_X_ID(?)}");
            cs.setInt("_id_boleta", id);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }
    
    // Método para obtener una boleta por su código
    @Override
    public Boleta obtenerPorId(int id){
        Boleta boleta = new Boleta();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BOLETAS_TODAS()}");
            rs = cs.executeQuery();
            if(rs.next()){
                boleta.setIdBoleta(rs.getInt("id_boleta"));
                boleta.setFechaCompra(rs.getDate("fechaCompra"));
                boleta.setMetodoPago(MetodoPago.valueOf(rs.getString("metodo_pago")));
                boleta.setTotal(rs.getDouble("total"));
                boleta.setActivo(rs.getBoolean("activo"));
        
                int idCliente = rs.getInt("fid_cliente");
                // Llama al segundo query de obtener sede por  id
                String sql = "{CALL LISTAR_CLIENTE_X_ID(?)}";
                cs = con.prepareCall(sql);
                cs.setInt(1, idCliente);
                //
//                rs2 = cs.executeQuery();
                //
                rs2 = cs.executeQuery();
                Cliente cliente;
                if(rs2.next()){
                    cliente = new Cliente();
                    cliente.setId(rs2.getInt("id_cliente"));
                    cliente.setDni(rs2.getString("DNI"));
                    cliente.setNombre(rs.getString("nombres"));
                    cliente.setPrimerApellido(rs2.getString("primer_apellido"));
                    cliente.setSegundoApellido(rs2.getString("segundo_apellido"));
                    cliente.setGenero(rs2.getString("genero").charAt(0)); // Convertir String a char
                    cliente.setFechaNacimiento(rs2.getDate("fecha_nacimiento")); // java.sql.Date
                    cliente.setActivo(rs2.getBoolean("activo")); // Mapear TINYINT a boolean
                    int idSede = rs2.getInt("fid_sede");
                    // Llama al segundo query de obtener sede por  id
                    sql = "{CALL LISTAR_SEDE_X_ID(?)}";
                    cs = con.prepareCall(sql);
                    cs.setInt(1, idSede);
                    //
                    rs2 = cs.executeQuery();
                    if(rs2.next()){
                        Sede sede = new Sede();
                        sede.setIdSede(rs2.getInt("id_sede"));
                        sede.setUbicacion(rs2.getString("ubicacion"));
                        sede.setUniversidad(rs2.getString("nombre"));

                        cliente.setSede(sede);
                        boleta.setCliente(cliente);
                    }
                    else{
                        System.out.println("No se encontro la sede");
                        return null;
                    }
                    }
                    else{
                        System.out.println("No se encontro la sede");
                    }       
                
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return boleta;        
    }
    
    // Método para listar todos las boletas
    @Override
    public ArrayList<Boleta> listar(){
        ArrayList<Boleta> boletas = new ArrayList<>();
        Cliente cliente;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_BOLETAS_TODAS()}");
            rs = cs.executeQuery();
            while(rs.next()){
                Boleta boleta = new Boleta();
                boleta.setIdBoleta(rs.getInt("id_boleta"));
                boleta.setFechaCompra(rs.getDate("fechaCompra"));
                boleta.setMetodoPago(MetodoPago.valueOf(rs.getString("metodo_pago")));
                boleta.setTotal(rs.getDouble("total"));
                boleta.setActivo(rs.getBoolean("activo"));
        
                int idCliente = rs.getInt("fid_cliente");
                // Llama al segundo query de obtener sede por  id
                String sql = "{CALL LISTAR_CLIENTE_X_ID(?)}";
                cs = con.prepareCall(sql);
                cs.setInt(1, idCliente);
                //
//                rs2 = cs.executeQuery();
                //
                rs2 = cs.executeQuery();
                if(rs2.next()){
                    cliente = new Cliente();
                    cliente.setId(rs2.getInt("id_cliente"));
                    cliente.setDni(rs2.getString("dni"));
                    cliente.setNombre(rs2.getString("nombres"));
                    cliente.setPrimerApellido(rs2.getString("primer_apellido"));
                    cliente.setSegundoApellido(rs2.getString("segundo_apellido"));
                    cliente.setGenero(rs2.getString("genero").charAt(0)); // Convertir String a char
                    cliente.setFechaNacimiento(rs2.getDate("fecha_nacimiento")); // java.sql.Date
                    cliente.setActivo(rs2.getBoolean("activo")); // Mapear TINYINT a boolean
                    int idSede = rs2.getInt("fid_sede");
                    // Llama al segundo query de obtener sede por  id
                    sql = "{CALL LISTAR_SEDE_X_ID(?)}";
                    cs = con.prepareCall(sql);
                    cs.setInt(1, idSede);
                    //
                    rs2 = cs.executeQuery();
                    if(rs2.next()){
                        Sede sede = new Sede();
                        sede.setIdSede(rs2.getInt("id_sede"));
                        sede.setUbicacion(rs2.getString("ubicacion"));
                        sede.setUniversidad(rs2.getString("nombre"));

                        cliente.setSede(sede);
                        boleta.setCliente(cliente);
                    }
                    else{
                        System.out.println("No se encontro la sede");
                        return null;
                    }
                    }
                    else{
                        System.out.println("No se encontro la sede");
                        continue;
                    }
                

                // Añadir el administrador a la lista
                boletas.add(boleta);        
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return boletas;        
    }
}
