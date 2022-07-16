
package entity;


public class Listados {
    private int idlistados;
    private String listado;
    private String mail;    

    public Listados(int idlistados, String listado, String mail) {
        this.idlistados = idlistados;
        this.listado = listado;
        this.mail = mail;        
    }

    public Listados(String listado, String mail) {
        this.listado = listado;
        this.mail = mail;        
    }

    public int getIdlistados() {
        return idlistados;
    }

    public void setIdlistados(int idlistados) {
        this.idlistados = idlistados;
    }

    public String getListado() {
        return listado;
    }

    public void setListado(String listado) {
        this.listado = listado;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }    

    @Override
    public String toString() {
        return "Listados{" + "listado=" + listado + ", mail=" + mail + '}';
    }
    
    
}
