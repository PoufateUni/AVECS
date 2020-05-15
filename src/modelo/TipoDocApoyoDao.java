package modelo;

import entidades.TipoDocApoyo;
import utilidades.Conexion;

public class TipoDocApoyoDao 
extends Conexion<TipoDocApoyo> 
implements GenericDao<TipoDocApoyo> {
	public TipoDocApoyoDao() {
		super(TipoDocApoyo.class);
	}
}