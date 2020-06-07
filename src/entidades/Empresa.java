package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the empresa database table.
 * 
 */
@Entity
@Table(name="empresa")
@NamedQuery(name="Empresa.findAll", query="SELECT e FROM Empresa e")
public class Empresa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int rut;
	@Column(name="correo")
	private String correo;
	
	private byte natural_juridica; 
	
	private String direccion;

	@Column(name="nombre_razon_social")
	private String nombreRazonSocial;

	private int telefono;

	//bi-directional many-to-one association to Persona
	@ManyToOne
	@JoinColumn(name="representante_legal")
	private Persona persona;

	public Empresa() {
	}

	public int getRut() {
		return this.rut;
	}

	public void setRut(int rut) {
		this.rut = rut;
	}

	public byte getNatural_juridica() {
		return natural_juridica;
	}

	public void setNatural_juridica(byte natural_juridica) {
		this.natural_juridica = natural_juridica;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCorreo_contacto() {
		return this.correo;
	}

	public void setCorreo_contacto(String correo_contacto) {
		this.correo = correo_contacto;
	}

	public String getNombreRazonSocial() {
		return this.nombreRazonSocial;
	}

	public void setNombreRazonSocial(String nombreRazonSocial) {
		this.nombreRazonSocial = nombreRazonSocial;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public Persona getPersona() {
		return this.persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

}