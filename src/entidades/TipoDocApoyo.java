package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tipo_doc_apoyo database table.
 * 
 */
@Entity
@Table(name="tipo_doc_apoyo")
@NamedQuery(name="TipoDocApoyo.findAll", query="SELECT t FROM TipoDocApoyo t")
public class TipoDocApoyo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idTipo_doc_Apoyo;

	private String descripcion;

	private String nombre;

	public TipoDocApoyo() {
	}

	public int getIdTipo_doc_Apoyo() {
		return this.idTipo_doc_Apoyo;
	}

	public void setIdTipo_doc_Apoyo(int idTipo_doc_Apoyo) {
		this.idTipo_doc_Apoyo = idTipo_doc_Apoyo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}