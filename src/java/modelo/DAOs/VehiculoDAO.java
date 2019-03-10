package modelo.DAOs;

import javax.sql.DataSource;
import modelo.DTOs.VehiculoDTO;
import util.Conexion;

/**
 *
 * @author Yury Muñoz
 */
public interface VehiculoDAO {
    public boolean insertVehiculo(Conexion c , VehiculoDTO v);
    public VehiculoDTO selectVehiculo(Conexion c, VehiculoDTO v );
    public boolean updateVehiculo(Conexion c, VehiculoDTO v);
}
