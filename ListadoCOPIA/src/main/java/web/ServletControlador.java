package web;

import data.LibreriaDAO;
import entity.Listados;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{            
        
        String accion = req.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "editar":
                    editarListado(req,res);
                    break;
                case "eliminar":
                    eliminarListado(req,res);
                    break;
                case "buscar":
                    buscarListado(req,res);
                    break;
                default:
                    accionDefault(req, res);
                    break;
            }
        } else {
            accionDefault(req, res);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        String accion= req.getParameter("accion");
        if(accion!=null){
            switch(accion){
                case "insertar":
                    guardarListado(req, res);
                    break;
                case "modificar":
                    modificarListado(req,res);
                    break;
                default:
                    accionDefault(req, res);
                    break;
            }
        }
    }
    
    private void accionDefault(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        List<Listados> listados = new LibreriaDAO().findAll();        
        HttpSession sesion = req.getSession();
        listados.forEach(System.out::println);        
        sesion.setAttribute("listado", listados);        
        sesion.setAttribute("cantidadReg", calcularRegistros(listados));        
        res.sendRedirect("listados.jsp");
    }
    
     private void guardarListado(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String listado = req.getParameter("listado");
        String mail = req.getParameter("mail");        
        
        Listados list = new Listados(listado, mail);
        int regMod = new LibreriaDAO().create(list);
        System.out.println("Insertados: " + regMod);
        accionDefault(req, res);
    }          
    
    private void editarListado(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        int idListado = Integer.parseInt(req.getParameter("idListados"));
        Listados lib = new LibreriaDAO().findBookById(idListado);
        req.setAttribute("listado", lib);
        req.getRequestDispatcher("/WEB-INF/paginas/operaciones/editarListado.jsp").forward(req, res);
    }
    
    private void modificarListado(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{  
        String listado = req.getParameter("listado");
        String mail = req.getParameter("mail");        
        int idListado = Integer.parseInt(req.getParameter("idListados"));

        Listados lib = new Listados(idListado, listado, mail);
        int regMod = new LibreriaDAO().update(lib);
        System.out.println("SE ACTUALIZARON: " + regMod + " REGISTROS");
        accionDefault(req, res);
    }
        
    private void eliminarListado(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException{
     int idListados = Integer.parseInt(req.getParameter("idListados"));

     int regMod = new LibreriaDAO().delete(idListados);

     System.out.println("SE ELIMINARON: "+ regMod +" REGISTROS");

     accionDefault(req, res);
    }
    
    private void buscarListado(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String listado = req.getParameter("listado");        
        Listados lib = new LibreriaDAO().findBookByListado(listado);
        req.setAttribute("listado", lib);
        req.getRequestDispatcher("/WEB-INF/paginas/operaciones/navegacion.jsp").forward(req, res);
    }
    
    private int calcularRegistros(List<Listados> lista){
        int registros=0;
        for (int i = 0; i < lista.size(); i++) {
            registros += lista.get(i).getIdlistados();
            
        }        
        return registros;                
    }          
         
     
}
