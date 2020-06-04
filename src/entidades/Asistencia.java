package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the asistencia database table.
 * 
 */
@Entity
@Table(name="asistencia")
@NamedQuery(name="Asistencia.findAll", query="SELECT a FROM Asistencia a")
public class Asistencia implements Serializable {
	private static final long serialVersionUID = 1L;
	
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int idAsistencia;

	private byte aprobado;



	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name="fecha_registro")
	private Date fechaRegistro;

	//bi-directional many-to-one association to Estudiante
	@ManyToOne
	@JoinColumn(name="Estudiante_Persona_id_Persona")
	private Estudiante estudiante;

	//bi-directional many-to-one association to Visita
	@ManyToOne
	@JoinColumn(name="Visita_idVisita")
	private Visita visita;

	public Asistencia() {
	}

	public int getIdAsistencia() {
		return this.idAsistencia;
	}

	public void setIdAsistencia(int idAsistencia) {
		this.idAsistencia = idAsistencia;
	}

	public byte getAprobado() {
		return this.aprobado;
	}

	public void setAprobado(byte aprobado) {
		this.aprobado = aprobado;
	}


	public Date getFechaRegistro() {
		return this.fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public Estudiante getEstudiante() {
		return this.estudiante;
	}

	public void setEstudiante(Estudiante estudiante) {
		this.estudiante = estudiante;
	}

	public Visita getVisita() {
		return this.visita;
	}

	public void setVisita(Visita visita) {
		this.visita = visita;
	}

}