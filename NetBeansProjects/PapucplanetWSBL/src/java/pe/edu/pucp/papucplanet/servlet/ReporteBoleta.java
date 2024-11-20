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

public class ReporteBoleta extends HttpServlet {

    public ReporteBoleta(){
        System.setProperty("user.language", "es");
        System.setProperty("user.country", "PE");
        System.setProperty("user.timezone", "GMT-5");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try { 

            JasperReport jr = (JasperReport) JRLoader.loadObject(ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/Boleta.jasper"));

            HashMap parametros = new HashMap();
            parametros.put("idBoleta", 1);
            URL subReporte1URL = ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteButacas.jasper");
            URL subReporte2URL = ReporteBoleta.class.getResource("/pe/edu/pucp/papucplanet/reportes/SubReporteConfiteria.jasper");
            String ruta1=URLDecoder.decode(subReporte1URL.getPath(),"UTF-8");
            String ruta2=URLDecoder.decode(subReporte2URL.getPath(),"UTF-8");
            parametros.put("rutaSubreporteButacas", ruta1);
            parametros.put("rutaSubreporteConfiteria", ruta2);
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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}