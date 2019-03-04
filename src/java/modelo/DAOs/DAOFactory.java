/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;

/**
 *
 * @author sala8
 */
public abstract class DAOFactory {
    
  // List of DAO types supported by the factory
  public static final int MYSQL = 1;
  
  public abstract PersonaDAO getPersonaDAO();
  public abstract ClienteDAO getClienteDAO();
  public abstract VehiculoDAO getVehiculoDAO();
  public abstract VentaDAO getVentaDAO();
 
   public static DAOFactory getDAOFactory(int whichFactory) {
 
    switch (whichFactory) {
      case MYSQL: 
          return new MySQLDbDAOFactory();
     
      default: 
          return null;
    }
   }
}
