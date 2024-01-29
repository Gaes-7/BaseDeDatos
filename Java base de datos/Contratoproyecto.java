import java.sql.Date;

public class Contratoproyecto {

    private int idContratoProyecto;
    private int idAmin;
    private int idRecHum;
    private int idEmpleado;
    private int idCiudad;
    private int idTipoProyecto;
    private int idCliente;
    private Date FechaInicio;
    private Date FechaFin;
    private int Valor;
    private String Clausula;

    public int getIdContratoProyecto() {
        return idContratoProyecto;
    }

    public void setIdContratoProyecto(int idContratoProyecto) {
        this.idContratoProyecto = idContratoProyecto;
    }

    public int getIdAmin() {
        return idAmin;
    }

    public void setIdAmin(int idAmin) {
        this.idAmin = idAmin;
    }

    public int getIdRecHum() {
        return idRecHum;
    }

    public void setIdRecHum(int idRecHum) {
        this.idRecHum = idRecHum;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public int getIdTipoProyecto() {
        return idTipoProyecto;
    }

    public void setIdTipoProyecto(int idTipoProyecto) {
        this.idTipoProyecto = idTipoProyecto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Date getFechaInicio() {
        return FechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        FechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return FechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        FechaFin = fechaFin;
    }

    public int getValor() {
        return Valor;
    }

    public void setValor(int valor) {
        Valor = valor;
    }

    public String getClausula() {
        return Clausula;
    }

    public void setClausula(String clausula) {
        Clausula = clausula;
    }

}
