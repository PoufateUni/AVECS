package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Asistencia;
import entidades.Visita;
import modelo.AsistenciaDao;
import modelo.EstudianteDao;
import modelo.VisitaDao;
import utilidades.Conexion;

/**
 * Servlet implementation class EliminarInscripcionEstudiante
 */
@WebServlet("/EliminarInscripcionEstudiante")
public class EliminarInscripcionEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarInscripcionEstudiante() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("id", request.getQueryString());
		doDelete(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AsistenciaDao aD= new AsistenciaDao();
		Asistencia a = new Asistencia();
		HttpSession sesion = request.getSession();
		if(!sesion.getAttribute("usuario").equals(null)&&sesion.getAttribute("tipo_usu").equals(0)) {
			int usuario=(int)sesion.getAttribute("usuario");
			Asistencia asistencia= new Asistencia();
			AsistenciaDao asistenciaDao = new AsistenciaDao();
			VisitaDao vd= new VisitaDao();
			Visita v= vd.find(request.getAttribute("idVisita"));
		    asistencia=(Asistencia) Conexion.getEm().createQuery("Select Asistencia where estudiante="+usuario+"And visita="+v.getIdVisita()+";").getSingleResult();
			if(!asistencia.equals(null)) {
				
				asistenciaDao.delete(asistencia);
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Eliminación Exitosa');");
				 out.println("History.back();");
				  out.println("</script>");
			}else {
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('error de acceso: id usuario no compatible con asistencia dada');");
				 out.println("History.back();");
				  out.println("</script>");
			}
	}

}}
