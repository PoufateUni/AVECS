package entidades;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the documento_apoyo database table.
 * 
 */
@Entity
@Table(name="documento_apoyo")
@NamedQuery(name="DocumentoApoyo.findAll", query="SELECT d FROM DocumentoApoyo d")
public class DocumentoApoyo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_doc")
	private int idDoc;

	@Column(name="direccion_url")
	private String direccionUrl;


	private String nombre;
	@Column(name="externo")
	private int externo;
	
	//uni-directional many-to-one association to TipoDocApoyo
	@ManyToOne
	@JoinColumn(name="Tipo_doc_Apoyo_idTipo_doc_Apoyo")
	private TipoDocApoyo tipoDocApoyo;

	//bi-directional many-to-one association to Empresa
	@ManyToOne
	@JoinColumn(name="empresa_nit")
	private Empresa empresa;

	public DocumentoApoyo() {
	}

	public int getIdDoc() {
		return this.idDoc;
	}

	public void setIdDoc(int idDoc) {
		this.idDoc = idDoc;
	}

	public int getExterno() {
		return externo;
	}

	public void setExterno(int externo) {
		this.externo = externo;
	}

	public String getDireccionUrl() {
		return this.direccionUrl;
	}

	public void setDireccionUrl(String direccionUrl) {
		this.direccionUrl = direccionUrl;
	}

	

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public TipoDocApoyo getTipoDocApoyo() {
		return this.tipoDocApoyo;
	}

	public void setTipoDocApoyo(TipoDocApoyo tipoDocApoyo) {
		this.tipoDocApoyo = tipoDocApoyo;
	}

	public Empresa getEmpresa() {
		return this.empresa;
	}

	public void setEmpresa(Empresa visita) {
		this.empresa = visita;
	}

}