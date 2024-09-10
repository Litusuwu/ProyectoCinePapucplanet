import java.util.ArrayList;

class Cliente extends Usuario implements IConsultable{
	
	private String universidad;
    //posee un arrayList de boletas
    private ArrayList<Boleta> boletas;

	// Constructor con parámetros para Cliente y Usuario
    public Cliente(String dni, String nombre, String correo, String universidad) {
        super(dni, nombre, correo); // Llama al constructor de Usuario
        this.universidad = universidad;
    }

    // Getter para universidad
    public String getUniversidad() {
        return universidad;
    }

    // Setter para universidad
    public void setUniversidad(String universidad) {
        this.universidad = universidad;
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
        reporte = "Universidad: " + universidad + "\n";
        reporte = "Boletas: \n";

        for (Boleta boleta : boletas) {
            reporte = " - Fecha de compra: " + boleta.getFechaCompra() +", Total: " + boleta.getTotal()+ "\n";
        }

        return reporte;
    }

}