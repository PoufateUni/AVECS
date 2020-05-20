package modelo;

import entidades.Municipio;
import utilidades.Conexion;

public class MunicipioDao
extends Conexion<Municipio> 
implements GenericDao<Municipio> {
	public MunicipioDao() {
		super(Municipio.class);
	}
}