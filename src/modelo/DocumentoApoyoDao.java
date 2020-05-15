package modelo;

import entidades.DocumentoApoyo;
import utilidades.Conexion;

public class DocumentoApoyoDao 
extends Conexion<DocumentoApoyo> 
implements GenericDao<DocumentoApoyo> {
	public DocumentoApoyoDao() {
		super(DocumentoApoyo.class);
	}
}