/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pe.edu.pucp.papucplanet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Image;
import java.net.URL;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import pe.edu.pucp.papucplanet.dbmanager.model.DBManager;

public class ReporteSede extends HttpServlet {
    
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public ReporteSede(){
        System.setProperty("user.language", "es");
        System.setProperty("user.country", "PE");
        System.setProperty("user.timezone", "GMT-5");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        try{
            JasperReport jr = (JasperReport) JRLoader.loadObject(ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/ReporteIngresosSedes.jasper"));

            URL rutaLogo = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/images/LogoPapucPlanet.png");
            String rutaArchivoLogo = URLDecoder.decode(rutaLogo.getPath(), "UTF-8");
            Image logo = (new ImageIcon(rutaArchivoLogo).getImage());
            
            URL rutaSubreporteGrafico = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteGrafico.jasper");
            String rutaArchivoSubreporteGrafico = URLDecoder.decode(rutaSubreporteGrafico.getPath(), "UTF-8");
        
            URL rutaSubreportePai = ReporteSede.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReportePai.jasper");
            String rutaArchivoSubreportePai = URLDecoder.decode(rutaSubreportePai.getPath(), "UTF-8");
            
            HashMap parametros = new HashMap();
            parametros.put("idSede", 1);
            parametros.put("nombreSede", "PUCP");
            parametros.put("fechaInicio", dateFormat.parse("10-01-2024"));
            parametros.put("fechaFin", dateFormat.parse("10-12-2024"));
            parametros.put("logoCine", logo);
            parametros.put("rutaGraficoIngresos1", rutaArchivoSubreporteGrafico);
            parametros.put("rutaGraficoIngresos2", rutaArchivoSubreportePai);

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

