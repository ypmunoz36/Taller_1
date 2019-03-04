/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;
import java.util.ArrayList;

import javax.sql.DataSource;
import modelo.DTOs.PersonaDTO;

/**
 *
 * @author sala8
 */
public interface PersonaDAO {
    
    public boolean insert(DataSource ds, PersonaDTO p);
    public ArrayList consulta(DataSource ds, String id, String nombre1, String apellido1);
    
}
