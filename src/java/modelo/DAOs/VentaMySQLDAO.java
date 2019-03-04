/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import javax.sql.DataSource;
import modelo.DTOs.ClienteDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;
import modelo.DTOs.VentaDTO;

/**
 *
 * @author Yury Muñoz
 */
public class VentaMySQLDAO implements VentaDAO {

    @Override
    public boolean insertVenta(DataSource ds, VentaDTO v) {
        
         boolean respuesta = false;
        PreparedStatement pstmt = null;
        Connection con = null;
             
        try {
            con = ds.getConnection();
            Logger.getLogger(VentaMySQLDAO.class.getName()).log(Level.INFO, "Ejecutando insert...");
            
            pstmt = con.prepareStatement("INSERT INTO venta" +
                                "(cliente_cli_identificacion," +
                                "vehiculo_idcarro," +
                                "ven_fecha," +
                                "ven_precio," +
                                "usuario_asesor)"
                    + " VALUES (?,?,?,?,?)");
            
            pstmt.setInt(1,  v.getIdentificacionCliente());
            pstmt.setString(2,v.getVinAuto());
            pstmt.setString(3, v.getFechaVenta());
            pstmt.setInt(4, v.getPrecioVenta());
            pstmt.setString(5,  v.getAsesor());
            
            pstmt.execute();
            con.close();
            respuesta = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(VentaMySQLDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return respuesta;
    }

    @Override
    public ArrayList selectVentas(DataSource ds, VentaDTO v) {
         ArrayList rta = new ArrayList();
        
        Statement s;
        try {
            
            s = ds.getConnection().createStatement();
            ResultSet rs = s.executeQuery ("select idventa,  cliente_cli_identificacion,    vehiculo_idcarro,ven_fecha, ven_precio,usuario_asesor,ven_fecha_registra FROM venta");
            while (rs.next())
            {
                String aux = rs.getString("idventa");
                aux += "  "+rs.getString("cliente_cli_identificacion");
                aux += "  "+rs.getString("vehiculo_idcarro");
                aux += "  "+rs.getString("ven_fecha");
                aux += "  "+rs.getString("ven_precio");
                aux += "  "+rs.getString("usuario_asesor");
                aux += "  "+rs.getString("ven_fecha_registra");
                
                rta.add(aux);
                
            System.out.println("aux----"+aux);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(VentaMySQLDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }

    @Override
    public boolean updateVenta(DataSource ds, VentaDTO v) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
