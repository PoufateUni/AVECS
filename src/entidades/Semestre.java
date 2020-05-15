package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the semestre database table.
 * 
 */
@Entity
@Table(name="semestre")
@NamedQuery(name="Semestre.findAll", query="SELECT s FROM Semestre s")
public class Semestre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idSemestre;

	private String anio;

	private String periodo;

	public Semestre() {
	}

	public int getIdSemestre() {
		return this.idSemestre;
	}

	public void setIdSemestre(int idSemestre) {
		this.idSemestre = idSemestre;
	}

	public String getAnio() {
		return this.anio;
	}

	public void setAnio(String anio) {
		this.anio = anio;
	}

	public String getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

}