/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import modelo.DAOs.DAOFactory;
import modelo.DAOs.PersonaDAO;
import modelo.DTOs.ClienteDTO;
import modelo.DTOs.PersonaDTO;
import util.MyDataSourceFactory;

/**
 *
 * @author sala8
 */
public class ControladorCrearCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Llegue al controlador crear cliente....");
        
        String identificacion = request.getParameter("input-identificacion");
        String correo = request.getParameter("input-email");
        String nombres = request.getParameter("input-nombres");
        String apellidos = request.getParameter("input-apellidos");
        String direccion = request.getParameter("input-direccion");
        String ciudad = request.getParameter("input-ciudad");
        String telefono = request.getParameter("input-telefono");
        String celular = request.getParameter("input-celular");
        String fechana = request.getParameter("input-fnacimineto");
        String descripcion = request.getParameter("input-comentarios");
        
        String tipop = "0";
        
        ClienteDTO c = new ClienteDTO();
        c.setIdentificacion( Integer.parseInt( identificacion ));
        c.setCorreo(correo);
        c.setNombre(nombres);
        c.setApellidos(apellidos);
        c.setDireccion(direccion);
        c.setCiudad(Integer.parseInt(ciudad) );
        c.setTelefono(telefono);
        c.setCelular(celular);
        c.setFechaNacimiento( fechana  );
        c.setTipo(Integer.parseInt(tipop));
        c.setDescripcion(descripcion);
        
        DataSource ds = null;
        
        ds = MyDataSourceFactory.getMySQLDataSource();
        
        DAOFactory pbd = (DAOFactory) DAOFactory.getDAOFactory(1);
        pbd.getClienteDAO().insertCliente(ds, c);
        
        System.out.println("ciudad id : " +  c.getCiudad());
        System.out.println("DataSource: " +  ds);
        
        RequestDispatcher rd = request.getRequestDispatcher("./paginas/crearCliente.jsp");
        rd.forward(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
