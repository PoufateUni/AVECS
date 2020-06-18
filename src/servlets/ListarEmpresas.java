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

import entidades.DocumentoApoyo;
import entidades.Empresa;
import modelo.EmpresaDao;

/**
 * Servlet implementation class ListarEmpresas
 */
@WebServlet("/ListarEmpresas")
public class ListarEmpresas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarEmpresas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		
		
		 EmpresaDao ed= new EmpresaDao();
		List<Empresa> empresas= ed.list();
		boolean acceso=false;
		int usuario=(int) sesion.getAttribute("usuario");
		if(sesion.getAttribute("tipo_usu").equals(3)){
			acceso=true;
		}else {
			acceso=false;
		}
		if(acceso) {
			
			
		
			
			request.setAttribute("listaEmpresas", empresas);
			

			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/DocumentosEmpresas.jsp");
			rd.forward(request, response);

	}else {
		PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('credenciales de inicio de sesion incorrectas, no es detectado como usuario Administrador');");
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
