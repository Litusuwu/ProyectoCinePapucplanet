package pe.edu.pucp.papucplanet.gestionUsuario.model;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.compras.model.Boleta;
public class Cliente extends Usuario{	
    private Sede sede;
    //posee un arrayList de boletas
    private ArrayList<Boleta> boletas;
    // Constructor con parámetros para Cliente y Usuario
    public Cliente(){
        
    }
    public Cliente(String dni, String nombre,
                         String primerApellido, String segundoApellido, char genero,
                         Date fechaNacimiento, String correo, String contrasena,
                         boolean activo, Sede sede) {
        super(dni, nombre,  primerApellido, segundoApellido, genero, fechaNacimiento,
                correo, contrasena, activo);
        this.sede=sede;
    }

    // Getter para universidad
    public Sede getSede() {
        return sede;
    }

    // Setter para universidad
    public void setSede(Sede sede) {
        this.sede = sede;
    }

    public ArrayList<Boleta> getBoletas(){
        return new ArrayList<>(boletas);
    }

    public void setBoletas(ArrayList<Boleta> boletas){
        this.boletas = boletas;
    }
    // Método para generar un reporte de todas las boletas del cliente
    @Override
    public String emitirReporte() {
        String reporte = "";
        reporte = "Reporte de boletas para el cliente: " + getNombre() + "\n";
        reporte = "Universidad: " + sede.getUniversidad() + "\n";
        reporte = "Boletas: \n";

        for (Boleta boleta : boletas) {
            reporte = " - Fecha de compra: " + boleta.getFechaCompra() +", Total: " + boleta.getTotal()+ "\n";
        }

        return reporte;
    }
    
    public void realizarPago(){

    }
    public void consultarDatos(){

    }

    @Override
    public String obtenerDatos() {
        String str = "--------------------------------------\n";
        str += "ID: " + this.getId() + "\n";
        str +=  "DNI: " + this.getDni() + "\n";
        str +=  "Nombre: " + this.getNombre() + "\n";
        str +=  "Primer Apellido: " + this.getPrimerApellido() + "\n";
        str += "Segundo Apellido: " + this.getSegundoApellido() + "\n";
        str += "Genero: " + this.getGenero() + "\n";
        str += "Fecha de Nacimiento: " + this.getFechaNacimiento() + "\n";
        str += "Activo: " + this.isActivo() + "\n";
        str += "ID Sede : " + this.getSede().getIdSede();
        return str;
        
    }

    

}
