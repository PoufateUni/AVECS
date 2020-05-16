package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the profesor database table.
 * 
 */
@Entity
@Table(name="profesor")
@NamedQuery(name="Profesor.findAll", query="SELECT p FROM Profesor p")
public class Profesor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Persona_id_Persona")
	private int persona_id_Persona;

	@Column(name="codigo_profesor")
	private String codigoProfesor;

	//bi-directional one-to-one association to Administrador
	@OneToOne(mappedBy="profesor")
	private Administrador administrador;

	//bi-directional many-to-one association to Grupo
	@OneToMany(mappedBy="profesor")
	private List<Grupo> grupos;

	//bi-directional one-to-one association to Persona
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="Persona_id_Persona")
	private Persona persona;

	public Profesor() {
	}

	public int getPersona_id_Persona() {
		return this.persona_id_Persona;
	}

	public void setPersona_id_Persona(int persona_id_Persona) {
		this.persona_id_Persona = persona_id_Persona;
	}

	public String getCodigoProfesor() {
		return this.codigoProfesor;
	}

	public void setCodigoProfesor(String codigoProfesor) {
		this.codigoProfesor = codigoProfesor;
	}

	public Administrador getAdministrador() {
		return this.administrador;
	}

	public void setAdministrador(Administrador administrador) {
		this.administrador = administrador;
	}

	public List<Grupo> getGrupos() {
		return this.grupos;
	}

	public void setGrupos(List<Grupo> grupos) {
		this.grupos = grupos;
	}

	public Grupo addGrupo(Grupo grupo) {
		getGrupos().add(grupo);
		grupo.setProfesor(this);

		return grupo;
	}

	public Grupo removeGrupo(Grupo grupo) {
		getGrupos().remove(grupo);
		grupo.setProfesor(null);

		return grupo;
	}

	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

}