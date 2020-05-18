package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the visita database table.
 * 
 */
@Entity
@Table(name="visita")
@NamedQuery(name="Visita.findAll", query="SELECT v FROM Visita v")
public class Visita implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idVisita;

	@Column(name="cupos_disponibles")
	private String cuposDisponibles;

	private String duracion;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_visita_inicio")
	private Date fechaVisitaInicio;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_visita_salida")
	private Date fechaVisitaSalida;

	//bi-directional many-to-one association to Asistencia
	@OneToMany(mappedBy="visita")
	private List<Asistencia> asistencias;

	//bi-directional many-to-one association to Municipio
	@ManyToOne
	@JoinColumn(name="municipio")
	private Municipio municipio;

	
	//bi-directional many-to-one association to DocumentoApoyo
	@OneToMany(mappedBy="visita")
	private List<DocumentoApoyo> documentoApoyos;

	//bi-directional many-to-one association to Administrador
	@ManyToOne
	@JoinColumn(name="Administrador_Profesor_Persona_id_Persona")
	private Administrador administrador;

	//bi-directional many-to-one association to Grupo
	@ManyToOne
	@JoinColumn(name="Grupo_idGrupo")
	private Grupo grupo;

	public Visita() {
	}

	public int getIdVisita() {
		return this.idVisita;
	}

	public void setIdVisita(int idVisita) {
		this.idVisita = idVisita;
	}

	public String getCuposDisponibles() {
		return this.cuposDisponibles;
	}

	public void setCuposDisponibles(String cuposDisponibles) {
		this.cuposDisponibles = cuposDisponibles;
	}

	public String getDuracion() {
		return this.duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	public Date getFechaVisitaInicio() {
		return this.fechaVisitaInicio;
	}

	public void setFechaVisitaInicio(Date fechaVisitaInicio) {
		this.fechaVisitaInicio = fechaVisitaInicio;
	}

	public Date getFechaVisitaSalida() {
		return this.fechaVisitaSalida;
	}

	public void setFechaVisitaSalida(Date fechaVisitaSalida) {
		this.fechaVisitaSalida = fechaVisitaSalida;
	}



	public Municipio getMunicipio() {
		return municipio;
	}

	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}

	public List<Asistencia> getAsistencias() {
		return this.asistencias;
	}

	public void setAsistencias(List<Asistencia> asistencias) {
		this.asistencias = asistencias;
	}

	public Asistencia addAsistencia(Asistencia asistencia) {
		getAsistencias().add(asistencia);
		asistencia.setVisita(this);

		return asistencia;
	}

	public Asistencia removeAsistencia(Asistencia asistencia) {
		getAsistencias().remove(asistencia);
		asistencia.setVisita(null);

		return asistencia;
	}

	public List<DocumentoApoyo> getDocumentoApoyos() {
		return this.documentoApoyos;
	}

	public void setDocumentoApoyos(List<DocumentoApoyo> documentoApoyos) {
		this.documentoApoyos = documentoApoyos;
	}

	public DocumentoApoyo addDocumentoApoyo(DocumentoApoyo documentoApoyo) {
		getDocumentoApoyos().add(documentoApoyo);
		documentoApoyo.setVisita(this);

		return documentoApoyo;
	}

	public DocumentoApoyo removeDocumentoApoyo(DocumentoApoyo documentoApoyo) {
		getDocumentoApoyos().remove(documentoApoyo);
		documentoApoyo.setVisita(null);

		return documentoApoyo;
	}

	public Administrador getAdministrador() {
		return this.administrador;
	}

	public void setAdministrador(Administrador administrador) {
		this.administrador = administrador;
	}

	public Grupo getGrupo() {
		return this.grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}

}