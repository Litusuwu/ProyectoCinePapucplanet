/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.reportes.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.awt.Image;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import javax.swing.ImageIcon;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
import pe.edu.pucp.papucplanet.servlet.ReportePelicula;
import pe.edu.pucp.papucplanet.servlet.ReporteSede;
import pe.edu.pucp.papucplanet.servlet.ReporteBoleta;

@WebService(serviceName = "ReporteWS", targetNamespace = "http://services.papucplanet.pucp.edu.pe")
public class ReporteWS {

     public ReporteWS(){
        System.setProperty("user.language", "es");
        System.setProperty("user.country", "PE");
        System.setProperty("user.timezone", "GMT-5");
    }
    
    @WebMethod(operationName = "reporteSedes")
    public byte[] reporteSedes(@WebParam(name = "nombre") Date fechaInicio, Date fechaFin, Sede sede) {
        byte[] reporte = null;
        try{
            JasperReport jr = (JasperReport) JRLoader.loadObject(ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/ReporteIngresosSedes.jasper"));

            URL rutaLogo = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/images/LogoPapucPlanet.png");
            String rutaArchivoLogo = URLDecoder.decode(rutaLogo.getPath(),"UTF-8");
            Image logo = (new ImageIcon(rutaArchivoLogo).getImage());
            
            URL rutaSubreporteGrafico = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteGrafico.jasper");
            String rutaArchivoSubreporteGrafico = URLDecoder.decode(rutaSubreporteGrafico.getPath(), "UTF-8");
        
            URL rutaSubreportePai = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReportePai.jasper");
            String rutaArchivoSubreportePai = URLDecoder.decode(rutaSubreportePai.getPath(), "UTF-8");
            
            HashMap parametros = new HashMap();
            parametros.put("idSede", sede.getIdSede());
            parametros.put("nombreSede", sede.getUniversidad());
            parametros.put("fechaInicio", fechaInicio);
            parametros.put("fechaFin", fechaFin);
            parametros.put("logoCine", logo);
            parametros.put("rutaGraficoIngresos1", rutaArchivoSubreporteGrafico);
            parametros.put("rutaGraficoIngresos2", rutaArchivoSubreportePai);
        
            JasperPrint jp = JasperFillManager.fillReport(jr, parametros, DBManager.getInstance().getConnection());
        
            reporte = JasperExportManager.exportReportToPdf(jp);
        
        }catch(UnsupportedEncodingException | JRException ex){
            System.out.println(ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return reporte;
    }
    
//<<<<<<< HEAD
    @WebMethod(operationName = "reportePorPelicula")
    public byte[] reportePorPelicula(@WebParam(name = "idPelicula") int idPelicula) {
        byte[] reporte = null;
        try{
            JasperReport jr = (JasperReport) JRLoader.loadObject(ReportePelicula.class.getResource("/pe/edu/pucp/softprog/reportes/ReporteIngresosPorPelicula.jasper"));

            //URL rutaLogo = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/images/LogoPapucPlanet.png");
            //String rutaArchivoLogo = URLDecoder.decode(rutaLogo.getPath(),"UTF-8");
            //Image logo = (new ImageIcon(rutaArchivoLogo).getImage());
        
            HashMap parametros = new HashMap();
            //parametros.put("idSede", sede.getIdSede());
            parametros.put("idPelicula", idPelicula);
            JasperPrint jp = JasperFillManager.fillReport(jr, parametros, DBManager.getInstance().getConnection());
        
            reporte = JasperExportManager.exportReportToPdf(jp);
        //UnsupportedEncodingException | 
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
        }
        return reporte;
    }
//=======
    @WebMethod(operationName = "reporteBoleta")
    public byte[] reporteBoleta(@WebParam(name = "idBol") int id) throws UnsupportedEncodingException {
        byte[] reporte = null;
        try{
            JasperReport jr = (JasperReport) JRLoader.loadObject(ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/Boleta.jasper"));

            HashMap parametros = new HashMap();
            parametros.put("idBoleta", id);
            URL subReporte1URL = ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteButacas.jasper");
            URL subReporte2URL = ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteConfiteria.jasper");
            String ruta1=URLDecoder.decode(subReporte1URL.getPath(),"UTF-8");
            String ruta2=URLDecoder.decode(subReporte2URL.getPath(),"UTF-8");
            parametros.put("rutaSubreporteButacas", ruta1);
            parametros.put("rutaSubreporteConfiteria", ruta2);
            JasperPrint jp = JasperFillManager.fillReport(jr, parametros, DBManager.getInstance().getConnection());
        
            reporte = JasperExportManager.exportReportToPdf(jp);
        }catch(JRException ex){
            System.out.println(ex.getMessage());
        }finally{
            DBManager.getInstance().cerrarConexion();
        }
        return reporte;
    }

}
