package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Grupo;
import entidades.Materia;
import entidades.Profesor;
import modelo.GrupoDao;
import utilidades.Conexion;

/**
 * Servlet implementation class EliminarGrupo
 */
@WebServlet("/EliminarGrupo")
public class EliminarGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarGrupo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		boolean adminIn;
		if(sesion.getAttribute("tipo_usu").equals(null)){

			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert(' Debe iniciar sesion como administrador');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
			
		}else {
		adminIn=sesion.getAttribute("tipo_usu").equals(3);
		if(adminIn) {
			
			request.setAttribute("id", request.getQueryString());
			
			
			doDelete(request,response);
		
	}else {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('no ha iniciado sesion como administrador ');");
		 out.println("location='index.jsp';"); 
		out.println("</script>");
	  	}
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Grupo g = new Grupo();
		GrupoDao gd = new GrupoDao();
		g=gd.find((Integer.parseInt((String) request.getAttribute("id"))));
		try{
			gd.delete(g);
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Eliminacion exitosa ');");
			 out.println("history.back();"); 
			out.println("</script>");
		}catch(final  Exception e) {
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('este grupo se encuentra registrado previamente en una o varias visitas, debe eliminarlas primero ');");
			 out.println("history.back()';"); 
			out.println("</script>");
		  	}
		}
	}


