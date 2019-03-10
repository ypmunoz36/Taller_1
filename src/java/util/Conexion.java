/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Yury Muñoz
 */

/**
*  Clase responsable de crear la única instancia.
*/
public class Conexion {
    
    private static Conexion conexion = null;
    public static Connection conn = null;  //  variable estática que almacenará la conexión 
    
    /**
     * Constructor privado
     */
    private Conexion(){
         try{
         
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehialpes","root","root");
            System.out.print("entro al if... se crea conexion ");
               
           
        }catch(ClassNotFoundException | SQLException e){
            throw new RuntimeException("fallo la conexion ",e);
        }
    };
    
    /**
     * si la conexion es nula, vuelva a levantar el driver y crear una conexión
     * llamando al constructor privado
     * @return Retorna la conexión para trabajar con ella.
     */
    public static  synchronized Conexion getConnection(){
        if (conexion == null){
            conexion = new Conexion();
        }
        return conexion;
    }
}
