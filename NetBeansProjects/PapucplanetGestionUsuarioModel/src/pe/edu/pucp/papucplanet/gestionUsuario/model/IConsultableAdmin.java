/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package pe.edu.pucp.papucplanet.gestionUsuario.model;

import java.util.Date;

/**
 *
 * @author carlo
 */
public interface IConsultableAdmin {
    public String imprimirReporteDeCompras(Date date);
    public String imprimirReporteDeVentasPorPelicula();
}
