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

import entidades.Grupo;
import entidades.Visita;

import utilidades.Conexion;

/**
 * Servlet implementation class HistoricoAdministrador
 */
@WebServlet("/HistoricoAdministrador")
public class HistoricoAdministrador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoricoAdministrador() {
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
		System.out.println("1");
		if(sesion.getAttribute("tipo_usu")!=null) {
			System.out.println("2");
		tipoIn=sesion.getAttribute("tipo_usu").equals(3);}
		System.out.println("3");
		if(usuarioOut&&tipoIn)  {
			System.out.println("4");
		int usuario=(int) sesion.getAttribute("usuario");
		Grupo grupo = new Grupo();
		
		
		List<Visita> visitas ;
		visitas = Conexion.getEm().createQuery("from Visita visita  order by fechaInsercion  DESC").getResultList();
		
		request.setAttribute("listaVisitas", visitas);
		System.out.println("5");
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/SesionAdministrador.jsp");
		System.out.println("6");
		rd.forward(request, response);
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Redireccionando');");
		 out.println("location='/Html/SesionAdministrador.jsp';");
		  out.println("</script>");
		  System.out.println("7");
		}else {
	
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error en las credenciales de usuario, asegurese que ha ingresado como Administrador');");
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
