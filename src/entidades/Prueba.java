package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the prueba database table.
 * 
 */
@Entity
@Table(name="prueba")
@NamedQuery(name="Prueba.findAll", query="SELECT p FROM Prueba p")
public class Prueba implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int nombre;

	public Prueba() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNombre() {
		return this.nombre;
	}

	public void setNombre(int nombre) {
		this.nombre = nombre;
	}

}