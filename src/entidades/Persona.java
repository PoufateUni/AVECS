package entidades;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the persona database table.
 * 
 */
@Entity
@Table(name="persona")
@NamedQuery(name="Persona.findAll", query="SELECT p FROM Persona p")
public class Persona implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id_Persona;

	private String apellido1;

	private String apellido2;

	@Column(name="correo_contacto")
	private String correoContacto;

	@Temporal(TemporalType.DATE)
	@Column(name="fecha_nacimiento")
	private Date fechaNacimiento;

	private String nombre;

	//bi-directional many-to-one association to Empresa
	@OneToMany(mappedBy="persona")
	private List<Empresa> empresas;

	//bi-directional one-to-one association to Estudiante
	@OneToOne(mappedBy="persona")
	private Estudiante estudiante;

	//uni-directional many-to-one association to Genero
	@ManyToOne
	@JoinColumn(name="Genero_idGenero")
	private Genero genero;

	//uni-directional many-to-one association to TipoId
	@ManyToOne
	@JoinColumn(name="Tipo_id_idTipo_id")
	private TipoId tipoId;

	//bi-directional one-to-one association to Profesor
	@OneToOne(mappedBy="persona")
	private Profesor profesor;

	//bi-directional one-to-one association to Usuario
	@OneToOne(mappedBy="persona")
	private Usuario usuario;

	public Persona() {
	}

	public int getId_Persona() {
		return this.id_Persona;
	}

	public void setId_Persona(int id_Persona) {
		this.id_Persona = id_Persona;
	}

	public String getApellido1() {
		return this.apellido1;
	}

	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}

	public String getApellido2() {
		return this.apellido2;
	}

	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}

	public String getCorreoContacto() {
		return this.correoContacto;
	}

	public void setCorreoContacto(String correoContacto) {
		this.correoContacto = correoContacto;
	}

	public Date getFechaNacimiento() {
		return this.fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Empresa> getEmpresas() {
		return this.empresas;
	}

	public void setEmpresas(List<Empresa> empresas) {
		this.empresas = empresas;
	}

	public Empresa addEmpresa(Empresa empresa) {
		getEmpresas().add(empresa);
		empresa.setPersona(this);

		return empresa;
	}

	public Empresa removeEmpresa(Empresa empresa) {
		getEmpresas().remove(empresa);
		empresa.setPersona(null);

		return empresa;
	}

	public Estudiante getEstudiante() {
		return this.estudiante;
	}

	public void setEstudiante(Estudiante estudiante) {
		this.estudiante = estudiante;
	}

	public Genero getGenero() {
		return this.genero;
	}

	public void setGenero(Genero genero) {
		this.genero = genero;
	}

	public TipoId getTipoId() {
		return this.tipoId;
	}

	public void setTipoId(TipoId tipoId) {
		this.tipoId = tipoId;
	}

	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}