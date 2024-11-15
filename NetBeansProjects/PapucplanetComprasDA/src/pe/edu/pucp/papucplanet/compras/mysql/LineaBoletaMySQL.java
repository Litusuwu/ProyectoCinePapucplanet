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
import pe.edu.pucp.papucplanet.cine.model.EstadoButaca;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.model.Genero;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.model.Sede;
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
import pe.edu.pucp.papucplanet.confiteria.model.TipoAlimento;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class LineaBoletaMySQL implements LineaBoletaDAO{
    private ResultSet rs;
    private Connection con;
    private CallableStatement cs;
    
    @Override
    public int insertar(LineaBoleta lineaBoleta,int idBoleta) {
        int resultado = 0;
        try{
            // Preparamos la llamada al procedimiento
            String sql = "{CALL INSERTAR_LINEA_BOLETA(?, ?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.registerOutParameter(1, java.sql.Types.INTEGER); // El parámetro de salida _id_lineaBoleta
            cs.setInt(2, idBoleta);
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
            cs.setDouble(6,lineaBoleta.getSubtotal());
            // Ejecutar el procedimiento
            cs.executeUpdate();

            // Obtener el ID de la linea de boleta generado (parámetro OUT)
            int idLineaBoleta = cs.getInt(1);
            lineaBoleta.setIdLineaBoleta(idLineaBoleta); // Establecer el ID en el objeto
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
    public int actualizar(LineaBoleta lineaBoleta,int idBoleta) {
        int resultado = 0;
        try{
             con = DBManager.getInstance().getConnection();

            // Preparamos la llamada al procedimiento
            String sql = "{CALL MODIFICAR_LINEA_BOLETA(?,?,?,?,?,?)}";
            cs = con.prepareCall(sql);

            // Establecer los parámetros de entrada
            cs.setInt(1,lineaBoleta.getIdLineaBoleta());
            cs.setInt(2, idBoleta);
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
            cs.setDouble(6,lineaBoleta.getSubtotal());
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
    public int eliminar(int idLinea) {
        int resultado = 0;
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call ELIMINAR_LINEA_BOLETA_X_ID(?)}");
                cs.setInt("_id_linea_boleta", idLinea);
            resultado = cs.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return resultado;
    }

    @Override
    public LineaBoleta obtenerPorId(int idLinea) {
        LineaBoleta lineaBoleta = new LineaBoleta();
        Alimento alimento = new Alimento();
        Bebida bebida = new Bebida();
        ButacaFuncion butacaFuncion = new ButacaFuncion();
        Funcion funcion = new Funcion();
        Sala sala = new Sala();
        Pelicula pelicula = new Pelicula();
        Sede sede = new Sede();
        //BoletaDAO boleta = new BoletaMySQL();
        //ButacaFuncionDAO butacaFuncion = new ButacaFuncionMySQL();
        try{
            con = DBManager.getInstance().getConnection();
            cs = con.prepareCall("{call LISTAR_LINEA_BOLETA_X_ID(?)}");
            cs.setInt("_id_linea_boleta", idLinea);
            rs = cs.executeQuery();
            
            if(rs.next()){
               lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
               lineaBoleta.setCantidad(rs.getInt("cantidad"));
               lineaBoleta.setSubtotal(rs.getDouble("subtotal"));
               if(rs.getObject("id_consumible") == null){ //Lleno butaca funcion
                   lineaBoleta.setConsumible(null);
                   
                   butacaFuncion.setIdButacaFuncion(rs.getInt("id_butaca_funcion"));
                   butacaFuncion.setFila(rs.getString("fila_butaca").charAt(0));
                   butacaFuncion.setColumna(rs.getString("columna_butaca").charAt(0));
                   EstadoButaca est = EstadoButaca.valueOf(rs.getString("estado_butaca"));
                   butacaFuncion.setEstado(est);
                   butacaFuncion.setDiscapacitado(rs.getBoolean("es_discapacitado"));
                   butacaFuncion.setPrecio(rs.getDouble("precio"));
                   butacaFuncion.setIdButaca(rs.getInt("id_butaca"));
                   
                   funcion.setIdFuncion(rs.getInt("id_funcion"));
                   funcion.setDia(rs.getDate("funcion_dia"));
                   funcion.setHorarioFin(new java.sql.Time(rs.getTime("funcion_horaFin").getTime()));
                   funcion.setHorarioInicio(new java.sql.Time(rs.getTime("funcion_horaInicio").getTime()));
                   funcion.setActivo(true);
                   
                   pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                   pelicula.setTitulo(rs.getString("titulo"));
                   pelicula.setSinopsis(rs.getString("sinopsis"));
                   pelicula.setImagenPromocional(rs.getString("imagen_link"));
                   Genero genero = Genero.valueOf(rs.getString("genero"));
                   pelicula.setGenero(genero);
                   pelicula.setDuracion((double)rs.getInt("duracion"));
                   pelicula.setActivo(true);
                   funcion.setPelicula(pelicula);
                   
                   sala.setIdSala(rs.getInt("id_sala"));
                   sala.setCapacidad(rs.getInt("capacidad_sala"));
                   sala.setNumeroSala(rs.getInt("numero_sala"));
                   sala.setNumCol(rs.getInt("numero_columnas"));
                   sala.setNumFila(rs.getInt("numero_filas"));
                   
                   sede.setIdSede(rs.getInt("id_sede"));
                   sede.setUbicacion(rs.getString("ubicacion"));
                   sede.setUniversidad(rs.getString("nombre"));
                   sede.setActivo(true);
                   sala.setSede(sede);
                   
                   sala.setActivo(true);
                   funcion.setSala(sala);
                   
                   butacaFuncion.setFuncion(funcion);
                   butacaFuncion.setActivo(true); //Nota en la boleta, es una captura en el tiempo
                   lineaBoleta.setButacaFuncion(butacaFuncion);
               }else{ //Lleno el consumible
                   Consumible consumible = null;
                   lineaBoleta.setButacaFuncion(null);
                   char tipo = rs.getString("tipo_consumible").charAt(0);
                   if(tipo == 'A'){
                       TipoAlimento tipoalimento = TipoAlimento.valueOf(rs.getString("tipo_alimento"));
                       alimento.setTipoAlimento(tipoalimento);
                       alimento.setPesoPromedio(rs.getDouble("pesoPromedio"));
                       consumible = alimento;
                   }else{
                       bebida.setOnzas(rs.getInt("onzas"));
                       bebida.setTieneHielo(rs.getBoolean("tieneHielo"));
                       consumible = bebida;
                   }
                   consumible.setId(rs.getInt("id_consumible"));
                   consumible.setNombre(rs.getString("nombre_consumible"));
                   consumible.setPrecio(rs.getDouble("precio_consumible"));
                   consumible.setImagenURL(rs.getString("imagen_link"));
                   consumible.setTipo(tipo);
                   consumible.setActivo(true);
                   lineaBoleta.setConsumible(consumible);
               }
               lineaBoleta.setActivo(true);
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
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            
            cs = con.prepareCall("{CALL LISTAR_LINEAS_BOLETAS_TODAS()}");
            rs = cs.executeQuery();
            
            while(rs.next()){
               LineaBoleta lineaBoleta = new LineaBoleta();
               Alimento alimento = new Alimento();
               Bebida bebida = new Bebida();
               ButacaFuncion butacaFuncion = new ButacaFuncion();
               Funcion funcion = new Funcion();
               Sala sala = new Sala();
               Pelicula pelicula = new Pelicula();
               Sede sede = new Sede();
               
               lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
               lineaBoleta.setCantidad(rs.getInt("cantidad"));
               lineaBoleta.setSubtotal(rs.getDouble("subtotal"));
               if(rs.getObject("id_consumible") == null){ //Lleno butaca funcion
                   lineaBoleta.setConsumible(null);
                   
                   butacaFuncion.setIdButacaFuncion(rs.getInt("id_butaca_funcion"));
                   butacaFuncion.setFila(rs.getString("fila_butaca").charAt(0));
                   butacaFuncion.setColumna(rs.getString("columna_butaca").charAt(0));
                   EstadoButaca est = EstadoButaca.valueOf(rs.getString("estado_butaca"));
                   butacaFuncion.setEstado(est);
                   butacaFuncion.setDiscapacitado(rs.getBoolean("es_discapacitado"));
                   butacaFuncion.setPrecio(rs.getDouble("precio"));
                   butacaFuncion.setIdButaca(rs.getInt("id_butaca"));
                   
                   funcion.setIdFuncion(rs.getInt("id_funcion"));
                   funcion.setDia(rs.getDate("funcion_dia"));
                   funcion.setHorarioFin(new java.sql.Time(rs.getTime("funcion_horaFin").getTime()));
                   funcion.setHorarioInicio(new java.sql.Time(rs.getTime("funcion_horaInicio").getTime()));
                   funcion.setActivo(true);
                   
                   pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                   pelicula.setTitulo(rs.getString("titulo"));
                   pelicula.setSinopsis(rs.getString("sinopsis"));
                   pelicula.setImagenPromocional(rs.getString("imagen_link"));
                   Genero genero = Genero.valueOf(rs.getString("genero"));
                   pelicula.setGenero(genero);
                   pelicula.setDuracion((double)rs.getInt("duracion"));
                   pelicula.setActivo(true);
                   funcion.setPelicula(pelicula);
                   
                   sala.setIdSala(rs.getInt("id_sala"));
                   sala.setCapacidad(rs.getInt("capacidad_sala"));
                   sala.setNumeroSala(rs.getInt("numero_sala"));
                   sala.setNumCol(rs.getInt("numero_columnas"));
                   sala.setNumFila(rs.getInt("numero_filas"));
                   
                   sede.setIdSede(rs.getInt("id_sede"));
                   sede.setUbicacion(rs.getString("ubicacion"));
                   sede.setUniversidad(rs.getString("nombre"));
                   sede.setActivo(true);
                   sala.setSede(sede);
                   
                   sala.setActivo(true);
                   funcion.setSala(sala);
                   
                   butacaFuncion.setFuncion(funcion);
                   butacaFuncion.setActivo(true); //Nota en la boleta, es una captura en el tiempo
                   lineaBoleta.setButacaFuncion(butacaFuncion);
               }else{ //Lleno el consumible
                   Consumible consumible = null;
                   lineaBoleta.setButacaFuncion(null);
                   char tipo = rs.getString("tipo_consumible").charAt(0);
                   if(tipo == 'A'){
                       TipoAlimento tipoalimento = TipoAlimento.valueOf(rs.getString("tipo_alimento"));
                       alimento.setTipoAlimento(tipoalimento);
                       alimento.setPesoPromedio(rs.getDouble("pesoPromedio"));
                       consumible = alimento;
                   }else{
                       bebida.setOnzas(rs.getInt("onzas"));
                       bebida.setTieneHielo(rs.getBoolean("tieneHielo"));
                       consumible = bebida;
                   }
                   consumible.setId(rs.getInt("id_consumible"));
                   consumible.setNombre(rs.getString("nombre_consumible"));
                   consumible.setPrecio(rs.getDouble("precio_consumible"));
                   consumible.setImagenURL(rs.getString("imagen_link"));
                   consumible.setTipo(tipo);
                   consumible.setActivo(true);
                   lineaBoleta.setConsumible(consumible);
               }
               lineaBoleta.setActivo(true);
               lineasBoletas.add(lineaBoleta);
            }
            con.commit();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }finally{
            try{con.close();}catch(SQLException ex){System.out.println(ex.getMessage());}
        }
        return lineasBoletas;
    }

    @Override
    public ArrayList<LineaBoleta> listarPorUnaBoleta(int idBoleta) {
        ArrayList<LineaBoleta> lineasBoletas = new ArrayList<>();     
        try{
            con = DBManager.getInstance().getConnection();
            con.setAutoCommit(false);
            
            cs = con.prepareCall("{CALL LISTAR_LINEA_BOLETA_X_BOLETA(?)}");
            cs.setInt("_id_boleta", idBoleta);
            rs = cs.executeQuery();
            
            while(rs.next()){
               LineaBoleta lineaBoleta = new LineaBoleta();
               Alimento alimento = new Alimento();
               Bebida bebida = new Bebida();
               ButacaFuncion butacaFuncion = new ButacaFuncion();
               Funcion funcion = new Funcion();
               Sala sala = new Sala();
               Pelicula pelicula = new Pelicula();
               Sede sede = new Sede();
               
               lineaBoleta.setIdLineaBoleta(rs.getInt("id_linea_boleta"));
               lineaBoleta.setCantidad(rs.getInt("cantidad"));
               lineaBoleta.setSubtotal(rs.getDouble("subtotal"));
               if(rs.getObject("id_consumible") == null){ //Lleno butaca funcion
                   lineaBoleta.setConsumible(null);
                   
                   butacaFuncion.setIdButacaFuncion(rs.getInt("id_butaca_funcion"));
                   butacaFuncion.setFila(rs.getString("fila_butaca").charAt(0));
                   butacaFuncion.setColumna(rs.getString("columna_butaca").charAt(0));
                   EstadoButaca est = EstadoButaca.valueOf(rs.getString("estado_butaca"));
                   butacaFuncion.setEstado(est);
                   butacaFuncion.setDiscapacitado(rs.getBoolean("es_discapacitado"));
                   butacaFuncion.setPrecio(rs.getDouble("precio"));
                   butacaFuncion.setIdButaca(rs.getInt("id_butaca"));
                   
                   funcion.setIdFuncion(rs.getInt("id_funcion"));
                   funcion.setDia(rs.getDate("funcion_dia"));
                   funcion.setHorarioFin(new java.sql.Time(rs.getTime("funcion_horaFin").getTime()));
                   funcion.setHorarioInicio(new java.sql.Time(rs.getTime("funcion_horaInicio").getTime()));
                   funcion.setActivo(true);
                   
                   pelicula.setIdPelicula(rs.getInt("id_pelicula"));
                   pelicula.setTitulo(rs.getString("titulo"));
                   pelicula.setSinopsis(rs.getString("sinopsis"));
                   pelicula.setImagenPromocional(rs.getString("imagen_link"));
                   Genero genero = Genero.valueOf(rs.getString("genero"));
                   pelicula.setGenero(genero);
                   pelicula.setDuracion((double)rs.getInt("duracion"));
                   pelicula.setActivo(true);
                   funcion.setPelicula(pelicula);
                   
                   sala.setIdSala(rs.getInt("id_sala"));
                   sala.setCapacidad(rs.getInt("capacidad_sala"));
                   sala.setNumeroSala(rs.getInt("numero_sala"));
                   sala.setNumCol(rs.getInt("numero_columnas"));
                   sala.setNumFila(rs.getInt("numero_filas"));
                   
                   sede.setIdSede(rs.getInt("id_sede"));
                   sede.setUbicacion(rs.getString("ubicacion"));
                   sede.setUniversidad(rs.getString("nombre"));
                   sede.setActivo(true);
                   sala.setSede(sede);
                   
                   sala.setActivo(true);
                   funcion.setSala(sala);
                   
                   butacaFuncion.setFuncion(funcion);
                   butacaFuncion.setActivo(true); //Nota en la boleta, es una captura en el tiempo
                   lineaBoleta.setButacaFuncion(butacaFuncion);
               }else{ //Lleno el consumible
                   Consumible consumible = null;
                   lineaBoleta.setButacaFuncion(null);
                   char tipo = rs.getString("tipo_consumible").charAt(0);
                   if(tipo == 'A'){
                       TipoAlimento tipoalimento = TipoAlimento.valueOf(rs.getString("tipo_alimento"));
                       alimento.setTipoAlimento(tipoalimento);
                       alimento.setPesoPromedio(rs.getDouble("pesoPromedio"));
                       consumible = alimento;
                   }else{
                       bebida.setOnzas(rs.getInt("onzas"));
                       bebida.setTieneHielo(rs.getBoolean("tieneHielo"));
                       consumible = bebida;
                   }
                   consumible.setId(rs.getInt("id_consumible"));
                   consumible.setNombre(rs.getString("nombre_consumible"));
                   consumible.setPrecio(rs.getDouble("precio_consumible"));
                   consumible.setImagenURL(rs.getString("imagen_link"));
                   consumible.setTipo(tipo);
                   consumible.setActivo(true);
                   lineaBoleta.setConsumible(consumible);
               }
               lineaBoleta.setActivo(true);
               lineasBoletas.add(lineaBoleta);
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
