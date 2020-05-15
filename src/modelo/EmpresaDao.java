package modelo;

import entidades.Empresa;
import utilidades.Conexion;

public class EmpresaDao 
extends Conexion<Empresa> 
implements GenericDao<Empresa> {
	public EmpresaDao() {
		super(Empresa.class);
	}
}