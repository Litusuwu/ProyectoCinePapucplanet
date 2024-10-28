package pe.edu.pucp.papucplanet.gestionUsuario.model;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.model.Sede;

public interface IConsultableCliente {
   public void mostrarRegistroDeCompras();
   public Pelicula seleccionarPelicula(Sede sede, Date fecha);
   public Sede seleccionarSede();
   public Date seleccionarFecha();
   public Funcion seleccionarFuncion(Sede sede, Date fecha, Pelicula pelicula);
   public Butaca seleccionarButaca(Funcion funcion);
}
