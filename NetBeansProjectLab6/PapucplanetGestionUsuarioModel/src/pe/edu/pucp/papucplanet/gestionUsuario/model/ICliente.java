package pe.edu.pucp.papucplanet.gestionUsuario.model;
import java.util.ArrayList;
import pe.edu.pucp.papucplanet.compras.model.Boleta;

public interface ICliente {
   public ArrayList<Boleta> obtenerHistorialBoletos(int idUsuario);
   
}
