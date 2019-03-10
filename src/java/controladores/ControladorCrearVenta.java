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
import modelo.DTOs.VentaDTO;
import util.Conexion;

import org.apache.log4j.Logger;
import util.logs.LoggerFactory;
import util.logs.LoggerInterface;

/**
 *
 * @author sala8
 */
public class ControladorCrearVenta extends HttpServlet {

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
       
        String identificacionCliente = request.getParameter("input-identificacionV");
        String vinAuto = request.getParameter("input-vinv");
        String fechaVenta = request.getParameter("input-fechav");
        String precioVenta = request.getParameter("input-valorv");
        String asesor = request.getParameter("input-asesor");

        VentaDTO v = new VentaDTO();
        v.setIdentificacionCliente(Integer.parseInt(identificacionCliente));
        v.setVinAuto(vinAuto);
        v.setFechaVenta(fechaVenta);
        v.setPrecioVenta(Integer.parseInt(precioVenta));
        v.setAsesor(asesor);
        
      
        
        Conexion sql = Conexion.getConnection();
        
        LoggerFactory factory = new LoggerFactory();
        LoggerInterface logger = factory.getLogger();
        if(sql!= null)
            logger.log("CrearVenta se conecto correctamente a mysql singleton");
        
        DAOFactory pbd =  DAOFactory.getDAOFactory(1);
        pbd.getVentaDAO().insertVenta(sql, v);
        
        RequestDispatcher rd = request.getRequestDispatcher("./paginas/crearVentas.jsp");
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
