package data;

import static data.Conexion.close;
import static data.Conexion.getConexion;
import entity.Listados;
import java.sql.*;
import java.util.*;

public class LibreriaDAO {
    
    private static final String SQL_CREATE = "INSERT INTO listados(listado, mail) VALUES(?, ?)";
    private static final String SQL_READ = "SELECT * FROM listados";    
    private static final String SQL_UPDATE_LISTADO = "UPDATE listados SET listado = ? WHERE id = ?";    
    private static final String SQL_UPDATE_MAIL = "UPDATE listados SET mail = ? WHERE id = ?";    
    private static final String SQL_UPDATE= "UPDATE listados SET listado = ?, mail = ? WHERE id = ?";
    private static final String SQL_DELETE = "DELETE FROM listados WHERE id = ?";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM listados WHERE id = ?";
    private static final String SQL_SELECT_BY_LISTADO = "SELECT * FROM listados WHERE listado = ?";
    
    public List<Listados> findAll() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Listados list = null;
        List<Listados> listados = new ArrayList();

        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_READ);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idlistados = rs.getInt(1);
                String listado = rs.getString(2);
                String mail = rs.getString(3);                

                list = new Listados(idlistados, listado, mail);

                listados.add(list);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(rs);
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }

        return listados;
    }
    
    public Listados findBookById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Listados list = null;
        
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()){
                int idlistados = rs.getInt(1);
                String listado = rs.getString(2);
                String mail = rs.getString(3);                

                list = new Listados(idlistados, listado, mail);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(rs);
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return list;
    }
    
    public Listados findBookByListado(String name) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Listados list = null;
        
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_SELECT_BY_LISTADO);
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            while (rs.next()){
                int idlistados = rs.getInt(1);
                String listado = rs.getString(2);
                String mail = rs.getString(3);                

                list = new Listados(idlistados, listado, mail);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(rs);
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return list;
    }
    
    public int create(Listados listado){
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_CREATE);
            stmt.setString(1,listado.getListado());
            stmt.setString(2,listado.getMail());            
            registros = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        finally{
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }
    
    public int updatePrecio(Listados listado){
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_UPDATE_LISTADO);                        
            stmt.setString(1, listado.getListado());
            stmt.setInt(2, listado.getIdlistados());            
            registros = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        finally{
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }
    
    public int updateCopias(Listados listado){
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_UPDATE_MAIL);                        
            stmt.setString(1, listado.getMail());
            stmt.setInt(2, listado.getIdlistados());            
            registros = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        finally{
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }     
    
    public int update(Listados listado) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, listado.getListado());
            stmt.setString(2, listado.getMail());            
            stmt.setInt(3, listado.getIdlistados());
            registros = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }
    
     public int delete(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        try {
            conn = getConexion();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, id);
            registros = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                close(stmt);
                close(conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }
}
