package modelo.DAOs;

import java.util.ArrayList;
import javax.sql.DataSource;
import modelo.DTOs.VentaDTO;
import util.Conexion;

/**
 *
 * @author Yury Muñoz
 */
public interface VentaDAO {
    public boolean insertVenta(Conexion conexion , VentaDTO v);
    public ArrayList selectVentas(Conexion conexion, VentaDTO v );
    public boolean updateVenta(Conexion conexion, VentaDTO v);
}
