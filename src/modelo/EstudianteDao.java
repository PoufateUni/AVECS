package modelo;

import entidades.Estudiante;
import utilidades.Conexion;

public class EstudianteDao 
extends Conexion<Estudiante> 
implements GenericDao<Estudiante> {
	public EstudianteDao() {
		super(Estudiante.class);
	}
}