package modelo;

import entidades.Persona;
import utilidades.Conexion;

public class PersonaDao 
extends Conexion<Persona> 
implements GenericDao<Persona> {
	public PersonaDao() {
		super(Persona.class);
	}
}