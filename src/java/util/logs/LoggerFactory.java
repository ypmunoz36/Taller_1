/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.logs;

import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Yury Muñoz
 */
public class LoggerFactory {
    public boolean isFileLoggingEnabled() {
    return true;
}
    //Factory Method
    public LoggerInterface getLogger() {
        if (isFileLoggingEnabled()) {
            return new FileLogger();
        } else {
            return new ConsoleLogger();
        }
    }
}
