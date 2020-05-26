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

import entidades.Empresa;
import entidades.Grupo;
import entidades.Visita;
import modelo.MateriaDao;
import utilidades.Conexion;

/**
 * Servlet implementation class HistoricoProfesor
 */
@WebServlet("/HistoricoVisitas")
public class HistoricoVisitas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoricoVisitas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		boolean usuarioOut=sesion.getAttribute("usuario")!=null;
		
		//arreglar estos condicionales
		boolean tipoIn=false;
		if(usuarioOut) {
		tipoIn=sesion.getAttribute("tipo_usu").equals(1)||sesion.getAttribute("tipo_usu").equals(3);}
		if(usuarioOut&&tipoIn)  {
		int usuario=(int) sesion.getAttribute("usuario");
		Grupo grupo = new Grupo();
	
	
		List<Visita> visitas ;
		if(sesion.getAttribute("tipo_usu").equals(1)) {
			visitas = Conexion.getEm().createQuery("from Visita visita where  visita.grupo.profesor.persona_id_Persona ="+usuario +"order by fechaInsercion  DESC").getResultList();
		}else {
			visitas = Conexion.getEm().createQuery("from Visita visita  order by fechaInsercion  DESC").getResultList();
		}
		if(sesion.getAttribute("tipo_usu").equals(0)) {
			
		}
		
		RequestDispatcher rd;
		request.setAttribute("listaVisitas", visitas);
		if(sesion.getAttribute("tipo_usu").equals(1)) {
		 rd = getServletContext().getRequestDispatcher("/Html/SesionDocente.jsp");
		}else {
			 rd = getServletContext().getRequestDispatcher("/Html/SesionAministrador.jsp");
		
		}
		rd.forward(request, response);
		
		}else {
	
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error en las credenciales de usuario, asegurese que ha ingresado como docente o administrador');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
			
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
