/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.DAOs;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author sala8 fabrica concreta 
 */
public class MySQLDbDAOFactory extends DAOFactory {
  public static final String DRIVER=
    "oracle.jdbc.OracleDriver";
  public static final String DBURL=
    "jdbc:oracle:thin:@[host]:[port]:[sid]";
 
  // method to create Cloudscape connections
  public static Connection createConnection() throws SQLException {
    MysqlDataSource mysqlDS = null;
		try {
                        mysqlDS = new MysqlDataSource();
			mysqlDS.setURL("jdbc:mysql://localhost:3306/prueba1");
			mysqlDS.setUser("root");
			mysqlDS.setPassword("root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	return mysqlDS.getConnection();
  }
    
    

    @Override
    public ClienteDAO getClienteDAO() {
      return new ClienteMySQLDAO();
    }

    @Override
    public VehiculoDAO getVehiculoDAO() {
        return new VehiculoMySQLDAO();
    }

    @Override
    public VentaDAO getVentaDAO() {
        return new VentaMySQLDAO();
    }
    
}
