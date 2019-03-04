/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import modelo.DTOs.PersonaDTO;

/**
 *
 * @author sala8
 */
public class PersonaMySQLDbDAO implements PersonaDAO {

    @Override
    public boolean insert(DataSource ds, PersonaDTO p) {
       boolean rta = false;
        Connection con = null;
        Statement stmt = null;        
        try {
                con = ds.getConnection();
                stmt = con.createStatement();
                rta = stmt.execute("insert into persona (identificacion,"
                        + "nombre_1, nombre_2, apellido_1, apellido_2, genero, telefono, email,"
                        + "fecha_nacimiento, tipo_persona)"
                        + " values ("+p.getIdentificacion()+", '"+p.getNombre_1()+"', '"+p.getNombre_2()+"', '"+p.getApellido_1()+"', "
                        + "'"+p.getApellido_2()+"', '"+p.getGenero()+"', '"+p.getTelefono()+"','"+p.getEmail()+"',"
                        + "'"+p.getFecha_nacimiento()+"', '"+p.getTipo_persona()+"')");
                
        } catch (SQLException e) {
                e.printStackTrace();
        }finally{
            if(stmt != null) try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(PersonaMySQLDbDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(con != null) try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(PersonaMySQLDbDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rta;
    }

    @Override
    public ArrayList consulta(DataSource ds, String id, String nombre1, String apellido1) {
         ArrayList rta = new ArrayList();
        
        Statement s;
        try {
            
            s = ds.getConnection().createStatement();
            ResultSet rs = s.executeQuery ("select identificacion,nombre_1, "
                    + "nombre_2, apellido_1, apellido_2, genero, telefono, "
                    + "email,fecha_nacimiento, tipo_persona" 
                    + " from persona" 
                    + " where identificacion = " + id);
            while (rs.next())
            {
                String aux = rs.getString("identificacion");
                aux += "  "+rs.getString("nombre_1");
                aux += "  "+rs.getString("nombre_2");
                aux += "  "+rs.getString("apellido_1");
                aux += "  "+rs.getString("apellido_2");
                
                rta.add(aux);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return rta;
    }
    
    
    
}
