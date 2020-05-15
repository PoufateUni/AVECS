package modelo;

import entidades.Semestre;
import utilidades.Conexion;

public class SemestreDao 
extends Conexion<Semestre> 
implements GenericDao<Semestre> {
	public SemestreDao() {
		super(Semestre.class);
	}
}