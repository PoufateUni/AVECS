package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Visita;
import modelo.VisitaDao;

/**
 * Servlet implementation class EliminarVisita
 */
@WebServlet("/EliminarVisita")
public class EliminarVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarVisita() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getQueryString());
		request.setAttribute("id",id);
		doDelete(request,response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();   
		VisitaDao vd= new VisitaDao();
		   Visita v= vd.find(request.getAttribute("id"));
		   //validaciones
		   
			   //validacion de credenciales
			   boolean acceso=false;
				int usuario=(int) sesion.getAttribute("usuario");
				if(sesion.getAttribute("tipo_usu").equals(1)){
					acceso=(sesion.getAttribute("usuario").equals(v.getGrupo().getProfesor().getPersona_id_Persona()))?true:false;
				}else {
					acceso=true;
				}
				if(acceso) {
					if(v.equals(null)) {
						PrintWriter out= response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('error interno: visita a eliminar no encontrada');");
						 out.println("location='index.jsp';"); 
						out.println("</script>");
					}else {
						PrintWriter out= response.getWriter();
						vd.delete(v);
						out.println("<script type=\"text/javascript\">");
						out.println("alert('visita Eliminada');");
						 out.println("location='index.jsp';"); 
						out.println("</script>");
					}
	}else {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('error interno: credenciales incorrectas');");
		 out.println("location='index.jsp';"); 
		out.println("</script>");
	}

}}
