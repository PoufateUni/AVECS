package utilidades;
import entidades.Genero;
import modelo.GeneroDao;
public class Prueba {

	public static void main(String[] args) {
		 String emailUsuarioEmisor = "nogipe00@gmail.com";
	        String clave = "00nogipe";
	        //Cambia el valor de la variable emailReceptor por el email que desee enviarle mensajes
	        String emailReceptor = "eduardojosepc@ufps.edu.co";
	        ServicioEmail email = new ServicioEmail(emailUsuarioEmisor, clave);
	        email.enviarEmail(emailReceptor, "Esto estrhghdfghd un ejemplo", "Mi cuerpo del mensaje");

	}

}
