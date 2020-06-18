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

import entidades.Profesor;
import entidades.Materia;
import entidades.Grupo;
import modelo.ProfesorDao;
import utilidades.Conexion;
import modelo.MateriaDao;
import modelo.GrupoDao;
/**
 * Servlet implementation class RegistrarGrupo
 */
@WebServlet("/RegistrarGrupo")
public class RegistrarGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarGrupo() {
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
			out.println("alert('inicie sesion');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
			
		}else {
		adminIn=sesion.getAttribute("tipo_usu").equals(3);
		if(adminIn) {
			
		List<Profesor> ps= Conexion.getEm().createQuery("from Profesor").getResultList();
		List<Grupo> gs = Conexion.getEm().createQuery("from Grupo").getResultList();
		List<Materia> ms = Conexion.getEm().createQuery("from Materia").getResultList();
		request.setAttribute("grupos", gs);
		request.setAttribute("profesores", ps);
		request.setAttribute("materias", ms);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/RegistrarGrupo.jsp");
		rd.forward(request, response);
		
	}else {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('no ha iniciado sesion como administrador');");
		 out.println("location='index.jsp';"); 
		out.println("</script>");
	  	}
		}}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		boolean adminIn;
		if(sesion.getAttribute("tipo_usu").equals(null)){
			
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('inicie sesion');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
		}else {
		
		
			adminIn= sesion.getAttribute("tipo_usu").equals(3);
		if(adminIn) {
			ProfesorDao pd= new ProfesorDao();
			MateriaDao md= new MateriaDao();
			Grupo grupo = new Grupo();
			GrupoDao gd = new GrupoDao();
			int codigo=Integer.parseInt(request.getParameter("codigo"));
			Grupo tempgrupo=gd.find(codigo);
			if(tempgrupo!=null) {
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('un grupo con este codigo ya ha sido registrado, por favor verifique');");
				out.println("history.back();"); 
				out.println("</script>");
				
			}else {
			Materia materia=md.find(Integer.parseInt(request.getParameter("materia")));
			grupo.setMateria(materia);
			int periodo= Integer.parseInt(request.getParameter("periodo"));
			grupo.setPeriodo(periodo);
			int anio = Integer.parseInt(request.getParameter("anio"));
			grupo.setAnio(anio);
			Profesor profesor= pd.find(Integer.parseInt(request.getParameter("profesor")));
			grupo.setProfesor(profesor);
			grupo.setIdGrupo(codigo);
			gd.insert(grupo);
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registro Exitoso');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
			
			}
	}else {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('no ha iniciado sesion como administrador');");
		 out.println("location='index.jsp';"); 
		out.println("</script>");
	  //sesion no valida
	}

}
	}
}
