/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.papucplanet.cine.services;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.cine.dao.PeliculaDAO;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.mysql.PeliculaMySQL;

@WebService(serviceName = "PeliculaWS")
public class PeliculaWS {
    
    private PeliculaDAO daoPelicula;
    
    @WebMethod(operationName = "listarTodos")
    public ArrayList<Pelicula> listarTodos() {
        ArrayList<Pelicula> peliculas = null;
        try{
            daoPelicula = new PeliculaMySQL();
            peliculas = daoPelicula.listarTodos();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return peliculas;
    }
}
