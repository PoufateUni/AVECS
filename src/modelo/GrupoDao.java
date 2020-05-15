package modelo;

import entidades.Grupo;
import utilidades.Conexion;

public class GrupoDao 
extends Conexion<Grupo> 
implements GenericDao<Grupo> {
	public GrupoDao() {
		super(Grupo.class);
	}
}