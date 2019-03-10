/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.sql.DataSource;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class MyDataSourceFactorys {

    public static DataSource getMySQLDataSource() {

        MysqlDataSource mysqlDS = null;
        try {
                mysqlDS = new MysqlDataSource();
                mysqlDS.setURL("jdbc:mysql://localhost:3306/vehialpes");
                mysqlDS.setUser("root");
                mysqlDS.setPassword("root");
        } catch (Exception e) {
                e.printStackTrace();
        }
        return mysqlDS;
    }	
		
}