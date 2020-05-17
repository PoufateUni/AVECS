package utilidades;
import entidades.Genero;
import modelo.GeneroDao;
public class Prueba {

	public static void main(String[] args) {
		Genero g = new Genero();
		g.setIdGenero(9);
		g.setNombre("prueba");
		GeneroDao gd = new GeneroDao();
		System.out.println(gd.findByCodigoEstudiante("002"));
		System.out.println(gd.usuarioExists(1,2));
		
		Email email = new Email();
		email.enviarCorreo("anotheragofe@gmail.com","Locos$7983", "poutecermi", "prueba", "prueba");
		
	}

}
