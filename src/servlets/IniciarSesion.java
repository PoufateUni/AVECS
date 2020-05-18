package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Persona;
import entidades.TipoUsuario;
import entidades.Usuario;
import modelo.PersonaDao;
import modelo.TipoUsuarioDao;
import modelo.UsuarioDao;

/**
 * Servlet implementation class IniciarSesion
 */

@WebServlet("/IniciarSesion")
public class IniciarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IniciarSesion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doDelete(request, response);
	}
	
	
	/**
	 * @see HttpServlet#doDelete(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();
		s.invalidate();
		out.println("<script type=\"text/javascript\">");
		 out.println("location='index.jsp';");
		  out.println("</script>");
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
				HttpSession sesion = request.getSession();
				
		if(sesion.getAttribute("usuario")!=null) {
			Usuario ost= (Usuario)sesion.getAttribute("usuario");
			System.out.println(ost.getIdUsuario());
			out.println("<script type=\"text/javascript\">");
			out.println("alert('ya has iniciado');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		}
		else {
		Usuario usu= new Usuario();
		UsuarioDao usud= new UsuarioDao();
		TipoUsuario tu= new TipoUsuario();
		String pass=request.getParameter("pass");
		int tipoUsuario=Integer.parseInt( request.getParameter("tipoUsuario"));
		int id= Integer.parseInt( request.getParameter("id"));

		
		TipoUsuarioDao tud = new TipoUsuarioDao();
		boolean encontrado=false;
		tu=tud.find(tipoUsuario);
		if(usud.usuarioExists(id, tipoUsuario)==1)encontrado=true;

		if(!encontrado) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('no se encuentra este usuario');");
			 out.println("location='Html/Login.html';");
			  out.println("</script>");
		}else {
			usu=usud.find(id);
			if(pass.equals(usu.getContrasena())) {
				int identificador=usu.getIdUsuario();
				int tipoUsuario1=usu.getTipoUsuario().getIdTipo_usuario();
				String nombre = usu.getPersona().getNombre();
				byte verificado=usu.getVerificado();
				
				sesion.setAttribute("usuario", identificador);
				sesion.setAttribute("nombre", nombre);
				sesion.setAttribute("tipo_usu",tipoUsuario);
				sesion.setAttribute("verificado",verificado);
				
				
				
			out.println("<script type=\"text/javascript\">");
			
			 out.println("location='index.jsp';");
			  out.println("</script>");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('contrasena incorrecta');");
				 out.println("location='Html/Login.html';");
				  out.println("</script>");
			}
		}
		
		}
		
	}

}
