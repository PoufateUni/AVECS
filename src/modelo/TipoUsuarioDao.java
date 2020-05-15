package modelo;

import entidades.TipoUsuario;
import utilidades.Conexion;

public class TipoUsuarioDao 
extends Conexion<TipoUsuario> 
implements GenericDao<TipoUsuario> {
	public TipoUsuarioDao() {
		super(TipoUsuario.class);
	}
}