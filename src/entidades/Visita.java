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

	

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_visita_inicio")
	private Date fechaVisitaInicio;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_visita_salida")
	private Date fechaVisitaSalida;

	@Column(name="titulo")
	private String titulo;
	
	@Column(name="descripcion")
	private String descripcion;
	
	//bi-directional many-to-one association to Asistencia
	@OneToMany(mappedBy="visita")
	private List<Asistencia> asistencias;

	//bi-directional many-to-one association to Municipio
	@ManyToOne
	@JoinColumn(name="municipio")
	private Municipio municipio;
	@ManyToOne
	@JoinColumn(name="empresa_rut")
	private Empresa empresa;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="fecha_insercion")
	private Date fechaInsercion;
	
	//bi-directional many-to-one association to DocumentoApoyo
	@OneToMany(mappedBy="visita")
	private List<DocumentoApoyo> documentoApoyos;


	//bi-directional many-to-one association to Grupo
	@ManyToOne
	@JoinColumn(name="Grupo_idGrupo")
	private Grupo grupo;

	public Visita() {
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaInsercion() {
		return fechaInsercion;
	}

	public void setFechaInsercion(Date fechaInsercion) {
		this.fechaInsercion = fechaInsercion;
	}

	public int getIdVisita() {
		return this.idVisita;
	}

	

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
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


	public Grupo getGrupo() {
		return this.grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}

}