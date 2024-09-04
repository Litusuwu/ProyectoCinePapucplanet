
class Butaca {
    private char fila;
    private int columna;
    private EstadoButaca estado;
    private boolean discapacitado;
    private Sala sala;

    // Constructor con parámetros
    public Butaca(char fila, int columna, EstadoButaca estado, boolean discapacitado, Sala sala) {
        this.fila = fila;
        this.columna = columna;
        this.estado = estado;
        this.discapacitado = discapacitado;
        this.sala = sala;
    }

    // Getter y Setter para fila
    public void setFila(char fila) {
        this.fila = fila;
    }

    public char getFila() {
        return fila;
    }

    // Getter y Setter para columna
    public void setColumna(int columna) {
        this.columna = columna;
    }

    public int getColumna() {
        return columna;
    }

    // Getter y Setter para estado
    public void setEstado(EstadoButaca estado) {
        this.estado = estado;
    }

    public EstadoButaca getEstado() {
        return estado;
    }

    // Getter y Setter para discapacitado
    public void setDiscapacitado(boolean discapacitado) {
        this.discapacitado = discapacitado;
    }

    public boolean isDiscapacitado() {
        return discapacitado;
    }

    // Getter y Setter para sala
    public void setSala(Sala sala) {
        this.sala = sala;
    }

    public Sala getSala() {
        return sala;
    }

}
