
class Sede {
    private String universidad;
    private String ubicacion;
    // Constructor con parámetros
    public Sede(String universidad, String ubicacion) {
        this.universidad = universidad;
        this.ubicacion = ubicacion;
    }

    // Getter y Setter para universidad
    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public String getUniversidad() {
        return universidad;
    }

    // Getter y Setter para ubicacion
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    
}
