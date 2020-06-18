package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import entidades.Materia;
import modelo.MateriaDao;

/**
 * Servlet implementation class EliminarMateria
 */
@WebServlet("/EliminarMateria")
public class EliminarMateria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarMateria() {
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
		MateriaDao md = new MateriaDao();
		Materia m= md.find(Integer.parseInt((String) request.getAttribute("id")));
		try {

		md.delete(m);
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Eliminacion exitosa ');");
		 out.println("location='RegistrarMateria';"); 
		out.println("</script>");
	}catch(Exception e) {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('No es posible eliminar, esta materia se encuentra en uno o mas grupos ');");
		 out.println("location='RegistrarMateria';"); 
		out.println("</script>");
		throw e;
		
	}}
}


