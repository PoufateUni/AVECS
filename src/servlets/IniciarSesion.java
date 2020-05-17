package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.TipoUsuario;
import entidades.Usuario;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("usuario")!=null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('ya has iniciado');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		}
		else {
		Usuario usu= new Usuario();
		sesion.setAttribute("usuario", usu);
		
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
				Usuario usutemp= new Usuario();
				usutemp.setCorreoUsuario(usu.getCorreoUsuario());
				usutemp.setIdUsuario(usu.getIdUsuario());
				usutemp.setPersona(usu.getPersona());
				usutemp.setTipoUsuario(usu.getTipoUsuario());
				usutemp.setVerificado(usu.getVerificado());
				sesion.setAttribute("usuario", usu);
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
