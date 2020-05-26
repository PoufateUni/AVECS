package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.NoResultException;
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
 * Servlet implementation class InscripcionEstudiante
 */
@WebServlet("/InscripcionEstudiante")
public class InscripcionEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscripcionEstudiante() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("id", request.getQueryString());
		
	    doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//validaciones
		HttpSession sesion = request.getSession();
		if(!sesion.getAttribute("usuario").equals(null)&&sesion.getAttribute("tipo_usu").equals(0)) {
			int usuario=(int)sesion.getAttribute("usuario");
			Asistencia asistencia= new Asistencia();
			AsistenciaDao asistenciaDao = new AsistenciaDao();
			VisitaDao vd= new VisitaDao();
			EstudianteDao estudianteDao = new EstudianteDao();
		    Visita v= vd.find(Integer.parseInt((String) request.getAttribute("id")));
		    
		    try {
		    	asistencia=(Asistencia) Conexion.getEm().createQuery("from Asistencia asistencia where asistencia.estudiante="+usuario+" and asistencia.visita="+v.getIdVisita()+"").getSingleResult();	
		    	PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Ya está registrado previamente en esta visita');");
				out.println("location='index.jsp';");
				  out.println("</script>");
		    }catch(NoResultException e) {
		    	asistencia.setAprobado((byte) 0);
				asistencia.setEstudiante(estudianteDao.find(usuario));
				asistencia.setVisita(v);
				asistenciaDao.insert(asistencia);
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registro Exitoso');");
				 out.println("location='index.jsp';");
				  out.println("</script>");
		    }
		    
		    
			
			
		}
	}

}
