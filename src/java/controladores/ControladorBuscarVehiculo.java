/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DAOs.DAOFactory;
import modelo.DTOs.VehiculoDTO;
import util.Conexion;
import util.logs.LoggerFactory;
import util.logs.LoggerInterface;

/**
 *
 * @author Yury Muñoz
 */
public class ControladorBuscarVehiculo extends HttpServlet {

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
        String identificacion = request.getParameter("input_idBuscarAuto");
        
        VehiculoDTO v = new VehiculoDTO();
        if(!identificacion.equals(""))
            v.setVin(identificacion);
        
        Conexion sql = Conexion.getConnection();
        
       LoggerFactory factory = new LoggerFactory();
        LoggerInterface logger = factory.getLogger();
        if(sql!= null)
            logger.log("BuscarVehiculo se conecto correctamente a mysql singleton");
        
        DAOFactory df  =  DAOFactory.getDAOFactory(1);
        VehiculoDTO cliente = df.getVehiculoDAO().selectVehiculo(sql, v);
        
        // Cuando retorna el cliente consultado
        request.setAttribute("vehiculoConsultado", cliente);
        RequestDispatcher rd = request.getRequestDispatcher("./paginas/actualizarVehiculo.jsp");
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
