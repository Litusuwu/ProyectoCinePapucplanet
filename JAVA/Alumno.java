import java.util.ArrayList;

class Alumno extends Usuario{
	
	private Sede sede;
    //posee un arrayList de boletas
    private ArrayList<Boleta> boletas;

	// Constructor con parámetros para Cliente y Usuario
    public Alumno(String dni, String nombre, String correo,Sede sede) {
        super(dni, nombre, correo); // Llama al constructor de Usuario
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

}