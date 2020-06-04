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

import entidades.Administrador;
import entidades.Persona;
import entidades.TipoUsuario;
import entidades.Usuario;
import modelo.AdministradorDao;
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
			System.out.println("intento de inicio:"+ost.getIdUsuario());
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
		System.out.print("tipo de usuario="+tipoUsuario);
		int id= Integer.parseInt( request.getParameter("id"));
		int tipoUsuarioBusqueda=tipoUsuario;
		if(tipoUsuario==3)tipoUsuarioBusqueda=1;
		
		TipoUsuarioDao tud = new TipoUsuarioDao();
		boolean encontrado=false;
		tu=tud.find(tipoUsuario);
		if(usud.usuarioExists(id, tipoUsuarioBusqueda)==1)encontrado=true;

		if(!encontrado) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('no se encuentra este usuario');");
			 out.println("location='Html/Login.html';");
			  out.println("</script>");
		}else {
			if(tipoUsuario==3) {
				Administrador administrador= new Administrador();
				AdministradorDao administradorDao = new AdministradorDao();
				administrador= administradorDao.find(id);
				try {
					if(administrador.getContrasena().equals(pass)) {
						sesion.setAttribute("usuario", administrador.getProfesor().getPersona_id_Persona());
						sesion.setAttribute("nombre", "administrador: "+administrador.getProfesor().getPersona().getNombre());
						sesion.setAttribute("tipo_usu",3);
						sesion.setAttribute("verificado",0);
						sesion.setMaxInactiveInterval(10*60);
						out.println("<script type=\"text/javascript\">");
						
						 out.println("location='index.jsp';");
						  out.println("</script>");
					}
				}catch(NullPointerException e) {
					e.printStackTrace();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('no se encuentra este Administrador');");
					 out.println("location='Html/Login.html';");
					  out.println("</script>");
				}
				
			}else {
			
			
			usu=usud.find(id);
			System.out.println(id);
			
			if(pass.equals(usu.getContrasena())) {
				int identificador=usu.getIdUsuario();
				int tipoUsuario1=usu.getTipoUsuario().getIdTipo_usuario();
				String nombre = usu.getPersona().getNombre();
				byte verificado=usu.getVerificado();
				
				sesion.setAttribute("usuario", identificador);
				sesion.setAttribute("nombre", nombre);
				sesion.setAttribute("tipo_usu",tipoUsuario);
				sesion.setAttribute("verificado",verificado);
				sesion.setMaxInactiveInterval(10*60);
				
				
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

}
