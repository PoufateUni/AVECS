package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tipo_usuario database table.
 * 
 */
@Entity
@Table(name="tipo_usuario")
@NamedQuery(name="TipoUsuario.findAll", query="SELECT t FROM TipoUsuario t")
public class TipoUsuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idTipo_usuario;

	@Column(name="Nombre")
	private String nombre;

	public TipoUsuario() {
	}

	public int getIdTipo_usuario() {
		return this.idTipo_usuario;
	}

	public void setIdTipo_usuario(int idTipo_usuario) {
		this.idTipo_usuario = idTipo_usuario;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}