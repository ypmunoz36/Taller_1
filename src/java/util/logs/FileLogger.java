/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.logs;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import org.apache.log4j.Logger;

/**
 *
 * @author Yury Muñoz
 */
public class FileLogger implements LoggerInterface{

    @Override
    public void log(String msg) {
        
    try{
       
        File dir = new File("C:\\LogVA");

        if (!dir.exists())
            dir.mkdir();
       
        File file =new File("C:\\LogVA\\Filelog1.log");
 
        //crea archivo log si no existe
         if(!file.exists())
        {
            file.createNewFile();
        }
 
        final Logger logg = Logger.getLogger("FL");
        logg.debug("Log Factory "+msg);
     
    }
    catch(IOException e)
    {
        e.printStackTrace();
    }
        System.out.println("Mensaje escrito en log : " + msg);
    }
}