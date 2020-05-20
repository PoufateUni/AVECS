package utilidades;
import entidades.Genero;
import modelo.GeneroDao;
public class Prueba {

	public static void main(String[] args) {
		Genero g = new Genero();
		g.setIdGenero(9);
		g.setNombre("prueba");
		GeneroDao gd = new GeneroDao();
		
		System.out.println(gd.getEm().createQuery("from Grupo grupo where  grupo.profesor =667").getResultList().size());
		
		
	}

}
