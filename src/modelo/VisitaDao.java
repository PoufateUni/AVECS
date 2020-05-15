package modelo;

import entidades.Visita;
import utilidades.Conexion;

public class VisitaDao 
extends Conexion<Visita> 
implements GenericDao<Visita> {
	public VisitaDao() {
		super(Visita.class);
	}
}