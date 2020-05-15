package modelo;

import entidades.Profesor;
import utilidades.Conexion;

public class ProfesorDao 
extends Conexion<Profesor> 
implements GenericDao<Profesor> {
	public ProfesorDao() {
		super(Profesor.class);
	}
}