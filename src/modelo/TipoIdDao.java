package modelo;

import entidades.TipoId;
import utilidades.Conexion;

public class TipoIdDao 
extends Conexion<TipoId> 
implements GenericDao<TipoId> {
	public TipoIdDao() {
		super(TipoId.class);
	}
}