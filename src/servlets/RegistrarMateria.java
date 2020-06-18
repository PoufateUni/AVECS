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
@WebServlet("/RegistrarMateria")
public class RegistrarMateria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarMateria() {
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
		
		List<Materia> ms = Conexion.getEm().createQuery("from Materia").getResultList();

		request.setAttribute("materias", ms);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/RegistrarMateria.jsp");
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
			
			MateriaDao md= new MateriaDao();
			
			int codigo=Integer.parseInt(request.getParameter("codigo"));
			Materia tempgrupo=md.find(codigo);
			if(tempgrupo!=null) {
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('una materia con este codigo ya ha sido registrada, por favor verifique');");
				out.println("history.back();"); 
				out.println("</script>");
				
			}else {
			Materia materia= new Materia();
			String nombre= request.getParameter("nombre");
			int semestre = Integer.parseInt(request.getParameter("semestre"));
		materia.setIdMateria(codigo);
		materia.setNombre(nombre);
		materia.setSemestre(semestre);
			md.insert(materia);
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
