import java.sql.Date;

public class ContratoEmp {

    private int idContratoEmp;
    private int idEmpleado;
    private int idAdmin;
    private int idRecHum;
    private String TipoContrato;
    private Date FechaInicio;
    private Date FechaFin;
    private int Salario;
    private String Banco;
    private String TipoDeCuenta;

    public int getIdContratoEmp() {
        return idContratoEmp;
    }

    public void setIdContratoEmp(int idContratoEmp) {
        this.idContratoEmp = idContratoEmp;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public int getIdRecHum() {
        return idRecHum;
    }

    public void setIdRecHum(int idRecHum) {
        this.idRecHum = idRecHum;
    }

    public String getTipoContrato() {
        return TipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        TipoContrato = tipoContrato;
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

    public int getSalario() {
        return Salario;
    }

    public void setSalario(int salario) {
        Salario = salario;
    }

    public String getBanco() {
        return Banco;
    }

    public void setBanco(String banco) {
        Banco = banco;
    }

    public String getTipoDeCuenta() {
        return TipoDeCuenta;
    }

    public void setTipoDeCuenta(String tipoDeCuenta) {
        TipoDeCuenta = tipoDeCuenta;
    }

}
