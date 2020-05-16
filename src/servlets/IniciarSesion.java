package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		Usuario usu= new Usuario();
		UsuarioDao usud= new UsuarioDao();
		TipoUsuario tu= new TipoUsuario();
		int tipousuario=Integer.parseInt( request.getParameter("tipoUsuario"));
		TipoUsuarioDao tud = new TipoUsuarioDao();
		tu=tud.find(tipousuario);
		
		int repetidos=	usud.findByCodigoEstudiante(request.getParameter("codigo"));
		
		
		
		
	}

}
