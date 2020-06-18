package servlets;

import java.io.File;
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
import modelo.DocumentoApoyoDao;


/**
 * Servlet implementation class EliminarDocumentosEmpresa
 */
@WebServlet("/EliminarDocumentosEmpresa")
public class EliminarDocumentosEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarDocumentosEmpresa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
	    DocumentoApoyo doc= new DocumentoApoyo();
	    DocumentoApoyoDao docd= new DocumentoApoyoDao();

		boolean acceso=false;
		int usuario=(int) sesion.getAttribute("usuario");
		if(sesion.getAttribute("tipo_usu").equals(3)){
			acceso=true;
		}else {
			acceso=false;
		}
		if(acceso) {
			
			
			doc=docd.find(Integer.parseInt(request.getQueryString()));
			if(doc.getExterno()==1) {
			docd.delete(docd.find((Integer.parseInt(request.getQueryString()))));
			}else {
			File archivo= new File(doc.getDireccionUrl()+doc.getNombre());
			try{archivo.delete();
			docd.delete(docd.find((Integer.parseInt(request.getQueryString()))));}catch(Exception e) {e.printStackTrace();}
			
			}

			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Archivo eliminado exitosamente');");
			 out.println("history.back()"); 
			out.println("</script>");
			RequestDispatcher rd= getServletContext().getRequestDispatcher("/HistoricoVisitas");
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
