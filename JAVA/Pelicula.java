
class Pelicula {
    private String titulo;
    private double duracion;
    private String genero;
    private String sinopsis;

    // Constructor con parámetros
    public Pelicula(String titulo, double duracion, String genero, String sinopsis) {
        this.titulo = titulo;
        this.duracion = duracion;
        this.genero = genero;
        this.sinopsis = sinopsis;
    }

    // Getter y Setter para titulo
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTitulo() {
        return titulo;
    }

    // Getter y Setter para duracion
    public void setDuracion(double duracion) {
        this.duracion = duracion;
    }

    public double getDuracion() {
        return duracion;
    }

    // Getter y Setter para genero
    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getGenero() {
        return genero;
    }

    // Getter y Setter para sinopsis
    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getSinopsis() {
        return sinopsis;
    }
	
	
}