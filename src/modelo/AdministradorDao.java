package modelo;

import entidades.Administrador;
import utilidades.Conexion;

public class AdministradorDao 
extends Conexion<Administrador> 
implements GenericDao<Administrador> {
	public AdministradorDao() {
		super(Administrador.class);
	}
}