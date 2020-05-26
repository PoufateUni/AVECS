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
import entidades.Asistencia;
import utilidades.Conexion;

/**
 * Servlet implementation class HistoricoAsistencias
 */
@WebServlet("/HistoricoAsistencias")
public class HistoricoAsistencias extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoricoAsistencias() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		boolean usuarioOut=sesion.getAttribute("usuario")!=null;
		RequestDispatcher rd;
		//arreglar estos condicionales
		boolean tipoIn=false;
		if(usuarioOut) {
		int tipoUsuario=(int) sesion.getAttribute("tipo_usu");
		tipoIn=tipoUsuario==0||tipoUsuario==3;
		if(usuarioOut&&tipoIn)  {
		int usuario=(int) sesion.getAttribute("usuario");
		List<Asistencia> asistencias;
		if(tipoUsuario==0) {
			asistencias=Conexion.getEm().createQuery("from Asistencia asistencia where asistencia.estudiante= '"+usuario+"' order by asistencia.fechaRegistro DESC").getResultList();
			
		}else {
			asistencias=Conexion.getEm().createQuery("from Asistencia asistencia order by asistencia.fechaRegistro DESC").getResultList();
		}
		request.setAttribute("listaAsistencias", asistencias);
		if(tipoUsuario==0) {
		 rd = getServletContext().getRequestDispatcher("/Html/SesionEstudiante.jsp");
		}else {
			 rd = getServletContext().getRequestDispatcher("/Html/SesionAministrador.jsp");
		
		}
		rd.forward(request, response);
		
		}}else {
		
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Error en las credenciales de usuario, asegurese que ha ingresado como estudiante o administrador');");
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
