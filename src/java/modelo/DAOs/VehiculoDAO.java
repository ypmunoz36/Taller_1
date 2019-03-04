package modelo.DAOs;

import javax.sql.DataSource;
import modelo.DTOs.VehiculoDTO;

/**
 *
 * @author Yury Muñoz
 */
public interface VehiculoDAO {
    public boolean insertVehiculo(DataSource ds , VehiculoDTO v);
    public VehiculoDTO selectVehiculo(DataSource ds, VehiculoDTO v );
    public boolean updateVehiculo(DataSource ds, VehiculoDTO v);
}
