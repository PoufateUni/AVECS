package utilidades;
import java.util.List;

import entidades.Genero;
import modelo.GeneroDao;
public class Prueba {

	public static void main(String[] args) {
		List grupos=Conexion.getEm().createQuery("from Visita visita where  visita.grupo.profesor.persona_id_Persona ="+998).getResultList();
		System.out.println(grupos.size()>0);

	}

}
