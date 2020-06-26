package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Asistencia;
import entidades.Visita;
import modelo.AsistenciaDao;
import modelo.VisitaDao;

/**
 * Servlet implementation class DetallarVisita
 */
@WebServlet("/DetallarVisitaAdmin")
public class DetallarVisitaAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetallarVisitaAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    VisitaDao vd= new VisitaDao();
	    Visita v= vd.find(Integer.parseInt(request.getQueryString()));
	    
	    List estudiantesinscritosactuales=v.getAsistencias();
	    
		request.setAttribute("grupo", v.getGrupo().getIdGrupo());
		request.setAttribute("materia", v.getGrupo().getMateria().getNombre());
		request.setAttribute("docente",v.getGrupo().getProfesor().getPersona().getNombre() );
		request.setAttribute("docenteId",v.getGrupo().getProfesor().getPersona_id_Persona());
		request.setAttribute("empresa",v.getEmpresa().getNombreRazonSocial());
		request.setAttribute("empresaDireccion",v.getEmpresa().getDireccion());
		request.setAttribute("municipio", v.getMunicipio().getMunicipio());
		request.setAttribute("departamento", v.getMunicipio().getDepartamento().getDepartamento());
		request.setAttribute("fechaIn",v.getFechaVisitaInicio().toString());
		request.setAttribute("fechaFinal", v.getFechaVisitaSalida().toString());
		request.setAttribute("cupos",v.getCuposDisponibles());
		request.setAttribute("empresaId",v.getEmpresa().getRut());
		request.setAttribute("titulo", v.getTitulo());
		request.setAttribute("descripcion", v.getDescripcion());
		request.setAttribute("idVisita",v.getIdVisita());
		request.setAttribute("cuposAutorizar", v.getCuposAprobadosDisponibles());
		request.setAttribute("estudiantesinscritosactuales",estudiantesinscritosactuales );
		Date fechaIn  = v.getFechaVisitaInicio();
		Date fechaFin  = v.getFechaVisitaSalida();
		Long diasI=fechaIn.getTime();
		Long diasF=fechaFin.getTime();
		
		request.setAttribute("duracion", ((diasF-diasI)/(86400000)));
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/VisitaDetalleAdministrador.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo_usu")!="1") {
			System.out.println("aun no registramos XD");
		
		
		
		}else {
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('No deberías estar aquí');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
			
		}
		
		
		
		
	}

}
