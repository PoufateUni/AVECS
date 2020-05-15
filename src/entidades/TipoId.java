package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tipo_id database table.
 * 
 */
@Entity
@Table(name="tipo_id")
@NamedQuery(name="TipoId.findAll", query="SELECT t FROM TipoId t")
public class TipoId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idTipo_id;

	private String nombre;

	public TipoId() {
	}

	public int getIdTipo_id() {
		return this.idTipo_id;
	}

	public void setIdTipo_id(int idTipo_id) {
		this.idTipo_id = idTipo_id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}