package modelo;

import entidades.Materia;
import utilidades.Conexion;

public class MateriaDao
extends Conexion<Materia> 
implements GenericDao<Materia> {
	public MateriaDao() {
		super(Materia.class);
	}
}