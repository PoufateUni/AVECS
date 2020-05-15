package modelo;

import entidades.Genero;
import utilidades.Conexion;

public class GeneroDao 
extends Conexion<Genero> 
implements GenericDao<Genero> {
	public GeneroDao() {
		super(Genero.class);
	}
}