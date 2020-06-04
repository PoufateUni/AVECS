 	
package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import modelo.UsuarioDao;
import utilidades.Conexion;
import utilidades.ServicioEmail;

/**
 * Servlet implementation class RecuperarContraseña
 */
@WebServlet("/RecuperarContraseña")
public class RecuperarContraseña extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarContraseña() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuario = new Usuario();
		UsuarioDao usuDao= new UsuarioDao();
		
		
		try {
		usuario=(Usuario) Conexion.getEm().createQuery("from Usuario usuario where correoUsuario='"+request.getParameter("correo")+ " ' ").getSingleResult();
		String emailUsuarioEmisor = "nogipe00@gmail.com";
        String clave = "00nogipe";
        //Cambia el valor de la variable emailReceptor por el email que desee enviarle mensajes
        String emailReceptor = usuario.getCorreoUsuario();
        ServicioEmail email = new ServicioEmail(emailUsuarioEmisor, clave);
        email.enviarEmail(emailReceptor, "Cambio de Contraseña (Prueba AVECS)", "SU CONTRASEÑA ES=" +usuario.getContrasena());
    	PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('se ha enviado el correo, por favor revisar');");
		 out.println("location='index.jsp';");
		  out.println("</script>");
		}catch(Exception e){
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('correo introducido no coincide con ningun usuario');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		}
	
		
	}

}
