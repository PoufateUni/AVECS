package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the administrador database table.
 * 
 */
@Entity
@Table(name="administrador")
@NamedQuery(name="Administrador.findAll", query="SELECT a FROM Administrador a")
public class Administrador implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Profesor_Persona_id_Persona")
	private int profesor_Persona_id_Persona;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_entrada")
	private Date fechaEntrada;

	@Column(name="fecha_salida")
	private String fechaSalida;

	@Column(name="contrasena")
	private String contrasena;
	
	//bi-directional one-to-one association to Profesor
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="Profesor_Persona_id_Persona")
	private Profesor profesor;

	
	public Administrador() {
	}

	public int getProfesor_Persona_id_Persona() {
		return this.profesor_Persona_id_Persona;
	}

	public void setProfesor_Persona_id_Persona(int profesor_Persona_id_Persona) {
		this.profesor_Persona_id_Persona = profesor_Persona_id_Persona;
	}

	public Date getFechaEntrada() {
		return this.fechaEntrada;
	}

	public void setFechaEntrada(Date fechaEntrada) {
		this.fechaEntrada = fechaEntrada;
	}

	public String getFechaSalida() {
		return this.fechaSalida;
	}

	public void setFechaSalida(String fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}


	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	

}