package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Visita;
import modelo.VisitaDao;

/**
 * Servlet implementation class AutorizarEstudiantes
 */
@WebServlet("/AutorizarEstudiantes")
public class AutorizarEstudiantes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutorizarEstudiantes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession sesion = request.getSession();
		
		if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo_usu").equals(1)||sesion.getAttribute("tipo_usu").equals(3)) {
			 VisitaDao vd= new VisitaDao();
			    Visita v= vd.find(Integer.parseInt(request.getQueryString()));
			boolean acceso=false;
			int usuario=(int) sesion.getAttribute("usuario");
			if(sesion.getAttribute("tipo_usu").equals(1)){
				acceso=(sesion.getAttribute("usuario").equals(v.getGrupo().getProfesor().getPersona_id_Persona()))?true:false;
			}else {
				acceso=true;
			}
			if(acceso) {
		response.getWriter().append("parametros:").append((CharSequence) request.getParameterNames());}else {}}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession sesion = request.getSession();
		
		if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo_usu").equals(1)||sesion.getAttribute("tipo_usu").equals(3)) {
			
			   
			boolean acceso=false;
			int usuario=(int) sesion.getAttribute("usuario");
			if(sesion.getAttribute("tipo_usu").equals(1)){
				acceso=(sesion.getAttribute("usuario").equals(v.getGrupo().getProfesor().getPersona_id_Persona()))?true:false;
			}else {
				acceso=true;
			}
			if(acceso) {
		doGet(request, response);}
			
	}else {
		
	}

}}
