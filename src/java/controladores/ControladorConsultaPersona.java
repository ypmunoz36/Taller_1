/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import modelo.DAOs.DAOFactory;
import modelo.DAOs.PersonaDAO;
import util.MyDataSourceFactory;

/**
 *
 * @author sala8
 */
@WebServlet(name = "ControladorConsultaPersona", urlPatterns = {"/ControladorConsultaPersona"})
public class ControladorConsultaPersona extends HttpServlet {

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
        String id = request.getParameter("identificacion");
        String nombre1 = request.getParameter("nombre1");
        String apellido1 = request.getParameter("apellido1");
        
        DataSource ds = null;
        
        ds = MyDataSourceFactory.getMySQLDataSource();
        
        DAOFactory pbd = (DAOFactory) DAOFactory.getDAOFactory(1); // Polimorfismo DAOFactory toma la forma de MysqlDbDaofactory
        ArrayList datos = pbd.getPersonaDAO().consulta(ds, id, nombre1, apellido1);

        System.out.println("nombre: " +  nombre1);
        System.out.println("DataSource: " +  ds);
        
        request.setAttribute("listaDatos", datos);
        RequestDispatcher rd = request.getRequestDispatcher("./paginas/respuestaConsulta.jsp");
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
