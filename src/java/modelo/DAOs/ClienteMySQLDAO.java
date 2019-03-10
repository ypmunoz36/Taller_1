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
import util.Conexion;

/**
 *
 * @author Yury Muñoz
 */
public class ClienteMySQLDAO implements ClienteDAO {

    @Override
    public boolean insertCliente(Conexion conexion, ClienteDTO c) {
           
        boolean respuesta = false;
        PreparedStatement pstmt = null;
        Connection con = null;
             
        try {
            con = conexion.conn;
            Logger.getLogger(ClienteMySQLDAO.class.getName()).log(Level.INFO, "Ejecutando insertCliente...");
            
            pstmt = con.prepareStatement("INSERT INTO cliente(cli_identificacion," +
                        "cli_nombres," +
                        "cli_apellidos," +
                        "cli_direccion," +
                        "cli_ciudad," +
                        "cli_telefono," +
                        "cli_celular," +
                        "cli_tipo," +
                        "cli_fecha_nac," +
                        "cli_correo," +
                        "cli_descripcion)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            
            pstmt.setInt(1,c.getIdentificacion());
            pstmt.setString(2, c.getNombre());
            pstmt.setString(3, c.getApellidos());
            pstmt.setString(4, c.getDireccion());
            pstmt.setInt(5, c.getCiudad());
            pstmt.setString(6, c.getTelefono());
            pstmt.setString(7, c.getCelular());
            pstmt.setInt(8, c.getTipo());
            pstmt.setString(9, c.getFechaNacimiento());
            pstmt.setString(10, c.getCorreo());
            pstmt.setString(11, c.getDescripcion());
            
              pstmt.execute();
            
       
            
            respuesta = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMySQLDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return respuesta;
    }

    @Override
    public ClienteDTO selectCliente(Conexion conexion, ClienteDTO c) {
        
         ClienteDTO rta = new ClienteDTO();
        
        Statement s;
        try {
            
            s = conexion.conn.createStatement();
            ResultSet rs = s.executeQuery ("select cli_identificacion," +
                "   cli_nombres," +
                "   cli_apellidos," +
                "   cli_direccion," +
                "   cli_ciudad," +
                "   cli_telefono," +
                "   cli_celular," +
                "   cli_tipo," +
                "   cli_fecha_nac," +
                "   cli_correo," +
                "   cli_descripcion" +
                " FROM cliente where cli_identificacion =" + c.getIdentificacion());
            while (rs.next())
            {
                rta.setIdentificacion(rs.getInt("cli_identificacion"));
                rta.setNombre(rs.getString("cli_nombres"));
                rta.setApellidos(rs.getString("cli_apellidos"));
                rta.setDireccion(rs.getString("cli_direccion"));
                rta.setCiudad( rs.getInt( "cli_ciudad" ));
                rta.setTelefono(rs.getString("cli_telefono"));
                rta.setCelular(rs.getString("cli_celular"));
                rta.setTipo(rs.getInt("cli_tipo"));
                rta.setFechaNacimiento(rs.getString("cli_fecha_nac"));
                rta.setCorreo(rs.getString("cli_correo"));
             
                rta.setDescripcion(rs.getString("cli_descripcion"));
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMySQLDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return rta;
    }

    @Override
    public boolean updateCliente(Conexion conexion, ClienteDTO c) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean respuesta = false;
        con = conexion.conn;
        try {            
            Logger.getLogger(ClienteMySQLDAO.class.getName()).log(Level.INFO, "Ejecutando updateCliente...");
            
            pstmt = con.prepareStatement("UPDATE cliente "
                    + " SET "
                    + " cli_nombres=?"
                    + " , cli_apellidos=?"
                    + " , cli_direccion=?"
                    + " , cli_ciudad=?"
                    + " , cli_telefono=?"
                    + " , cli_celular=?"
                    + " , cli_tipo=?"
                    + " , cli_fecha_nac=?"
                    + " , cli_correo=?"
                    + " , cli_descripcion=?"
                    + " where cli_identificacion=?");
                        
         
            pstmt.setString(1, c.getNombre());
            pstmt.setString(2, c.getApellidos());
            pstmt.setString(3, c.getDireccion());
            pstmt.setInt(4, c.getCiudad());
            pstmt.setString(5, c.getTelefono());
            pstmt.setString(6, c.getCelular());
            pstmt.setInt(7, c.getTipo());
            pstmt.setString(8, c.getFechaNacimiento());
            pstmt.setString(9, c.getCorreo());
            pstmt.setString(10, c.getDescripcion());
            
            pstmt.setInt(11, c.getIdentificacion());
            pstmt.executeUpdate();
            
            
            
            respuesta = true;
        } catch (SQLException ex) {
            Logger.getLogger(ClienteMySQLDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return respuesta;
    }
    
}
