package modelo.DAOs;

import java.util.ArrayList;
import javax.sql.DataSource;
import modelo.DTOs.VentaDTO;

/**
 *
 * @author Yury Muñoz
 */
public interface VentaDAO {
    public boolean insertVenta(DataSource ds , VentaDTO v);
    public ArrayList selectVentas(DataSource ds, VentaDTO v );
    public boolean updateVenta(DataSource ds, VentaDTO v);
}
