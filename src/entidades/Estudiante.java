package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the estudiante database table.
 * 
 */
@Entity
@Table(name="estudiante")
@NamedQuery(name="Estudiante.findAll", query="SELECT e FROM Estudiante e")
public class Estudiante implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Persona_id_Persona")
	private int persona_id_Persona;

	private String codigo;

	//bi-directional many-to-one association to Asistencia
	@OneToMany(mappedBy="estudiante")
	private List<Asistencia> asistencias;

	//bi-directional one-to-one association to Persona
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="Persona_id_Persona")
	private Persona persona;
	
	private int Eps;
	
	public int getEps() {
		return Eps;
	}

	public void setEps(int eps) {
		Eps = eps;
	}

	public Estudiante() {
	}

	public int getPersona_id_Persona() {
		return this.persona_id_Persona;
	}

	public void setPersona_id_Persona(int persona_id_Persona) {
		this.persona_id_Persona = persona_id_Persona;
	}

	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public List<Asistencia> getAsistencias() {
		return this.asistencias;
	}

	public void setAsistencias(List<Asistencia> asistencias) {
		this.asistencias = asistencias;
	}

	public Asistencia addAsistencia(Asistencia asistencia) {
		getAsistencias().add(asistencia);
		asistencia.setEstudiante(this);

		return asistencia;
	}

	public Asistencia removeAsistencia(Asistencia asistencia) {
		getAsistencias().remove(asistencia);
		asistencia.setEstudiante(null);

		return asistencia;
	}

	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

}