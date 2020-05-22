package modelo;

import entidades.Eps;
import utilidades.Conexion;

public class EpsDao 
extends Conexion<Eps> 
implements GenericDao<Eps> {
	public EpsDao() {
		super(Eps.class);
	}
}