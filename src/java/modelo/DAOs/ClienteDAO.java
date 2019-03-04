/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;

import java.util.ArrayList;
import javax.sql.DataSource;
import modelo.DTOs.ClienteDTO;

/**
 *
 * @author Yury Muñoz
 */
public interface ClienteDAO {
    public boolean insertCliente(DataSource ds , ClienteDTO c);
    public ClienteDTO selectCliente(DataSource ds, ClienteDTO c );
    public boolean updateCliente(DataSource ds, ClienteDTO c);
}
