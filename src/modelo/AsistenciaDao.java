package modelo;

import entidades.Asistencia;
import utilidades.Conexion;

public class AsistenciaDao 
extends Conexion<Asistencia> 
implements GenericDao<Asistencia> {
	public AsistenciaDao() {
		super(Asistencia.class);
	}
}