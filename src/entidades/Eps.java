package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the eps database table.
 * 
 */
@Entity
@Table(name="eps")
@NamedQuery(name="Ep.findAll", query="SELECT e FROM Eps e")
public class Eps implements Serializable {
	private static final long serialVersionUID = 1L;

	
	
	
	@Id
	private int id;

	private String nombre;

	public Eps() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}