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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import modelo.DAOs.DAOFactory;
import modelo.DTOs.VehiculoDTO;
import util.MyDataSourceFactory;

/**
 *
 * @author Yury Muñoz
 */
public class ControladorActualizarVehiculo extends HttpServlet {

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
          
         String vin = request.getParameter("input-vin");
        String matricula = request.getParameter("input-matricula");
        String anioFabricacion = request.getParameter("input-aniofab");
        String cilindraje = request.getParameter("input-cilindraje");
        String tipoCombustible = request.getParameter("input-combustible");
        String modelo = request.getParameter("input-modelo");
        String color = request.getParameter("input-color");
        String numSillas = request.getParameter("input-nsillas");
        String idMarca = request.getParameter("input-marca");
        String idTipo = request.getParameter("input-tipo");
        
        String paisFab = request.getParameter("input-paisfab");
        String precioCosto = request.getParameter("input-costo");
        String precioVenta = request.getParameter("input-venta");
        String nombre = request.getParameter("input-nombre");
        
          VehiculoDTO v = new VehiculoDTO();
        v.setVin(vin);
        v.setMatricula(matricula);
        v.setAnioFabricacion(anioFabricacion);
        v.setCilindraje(cilindraje);
        v.setTipoCombustible( Integer.valueOf( tipoCombustible ));
        v.setModelo(modelo);
        v.setColor(color);
        v.setNumSillas(numSillas);
        v.setIdMarca(Integer.valueOf(idMarca));
        v.setIdTipo(Integer.valueOf(idTipo) );
        v.setPaisFab(paisFab);
        v.setPrecioCosto(Integer.valueOf(precioCosto) );
        v.setPrecioVenta( Integer.valueOf(precioVenta) );
        v.setNombre(nombre);
        
        DataSource ds = null;
        ds = MyDataSourceFactory.getMySQLDataSource();
        
        DAOFactory pbd = (DAOFactory) DAOFactory.getDAOFactory(1);
        pbd.getVehiculoDAO().updateVehiculo(ds, v);
        
        RequestDispatcher rd = request.getRequestDispatcher("./paginas/crearVehiculo.jsp");
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
