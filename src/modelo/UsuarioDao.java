package modelo;

import entidades.Usuario;
import utilidades.Conexion;

public class UsuarioDao 
extends Conexion<Usuario> 
implements GenericDao<Usuario> {
	public UsuarioDao() {
		super(Usuario.class);
	}
}