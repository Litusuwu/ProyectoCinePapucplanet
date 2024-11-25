/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.papucplanet.servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Image;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;
//import pe.edu.pucp.papucplanet.servlet.ReporteSede;
/**
 *
 * @author ISA
 */
public class ReportePelicula extends HttpServlet{
    //private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public ReportePelicula(){
        System.setProperty("user.language", "es");
        System.setProperty("user.country", "PE");
        System.setProperty("user.timezone", "GMT-5");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        try{
            JasperReport jr = (JasperReport) JRLoader.loadObject(ReportePelicula.class.getResource("/pe/edu/pucp/papucplanet/reportes/ReporteIngresosPorPelicula.jasper"));

            URL rutaLogo = ReportePelicula.class.getResource("/pe/edu/pucp/papucplanet/images/LogoPapucPlanet.png");
            String rutaArchivoLogo = URLDecoder.decode(rutaLogo.getPath(), "UTF-8");
            Image logo = (new ImageIcon(rutaArchivoLogo).getImage());
            
            URL rutaSubreportePai = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteInfoPelicula.jasper");
            String rutaArchivoSubreporteInfoPe = URLDecoder.decode(rutaSubreportePai.getPath(), "UTF-8");
            
            HashMap parametros = new HashMap();
            parametros.put("idPelicula", 1);
            parametros.put("logoCine", logo);
            parametros.put("rutaSubReporteInfoPelicula",rutaArchivoSubreporteInfoPe);
            JasperPrint jp = JasperFillManager.fillReport(jr, parametros, DBManager.getInstance().getConnection());

            JasperExportManager.exportReportToPdfStream(jp, response.getOutputStream());

        } catch (IOException | JRException ex) {
            System.out.println(ex.getMessage());
        } finally {
            DBManager.getInstance().cerrarConexion();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ReporteSede.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ReporteSede.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
