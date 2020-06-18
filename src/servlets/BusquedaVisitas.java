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
import entidades.Visita;
import utilidades.Conexion;

/**
 * Servlet implementation class BusquedaVisitas
 */
@WebServlet("/BusquedaVisitas")
public class BusquedaVisitas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaVisitas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request,response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direccion=request.getParameter("direccion");
		String termino=request.getParameter("termino");
		String termino2=request.getParameter("termino2");
		String tipo= request.getParameter("tipo");
		String cantidad=" de ";
		int inicial=0;
		
		
			
		
		
		
		List <Visita> listaVisitas;
		 long total=0;
		

		 
		if(direccion==null && termino==null) {
			  listaVisitas=Conexion.getEm().createQuery("from Visita").setMaxResults(15).getResultList();
			 
			  total=(long) Conexion.getEm().createQuery("select count(*)from Visita").getResultList().get(0);
		}else {
			inicial=Integer.parseInt(request.getParameter("inicial"));
			if(termino.equals("")) {
				 listaVisitas=Conexion.getEm().createQuery(" from Visita").setFirstResult(inicial).setMaxResults(15).getResultList();
				 total=(long) Conexion.getEm().createQuery("select count(*)from Visita").getResultList().get(0);
				 
			}
			else if(tipo.equals("fechaInicio")){
				listaVisitas=Conexion.getEm().createQuery(" from Visita v where fechaVisitaInicio >'"+termino+"'and fechaVisitaInicio<'"+termino2+"'").setFirstResult(inicial).setMaxResults(15).getResultList();
				 total=(long) listaVisitas.size();
			
			}else if(tipo.equals("fechaFinal")) {
				listaVisitas=Conexion.getEm().createQuery(" from Visita v where fechaVisitaSalida >'"+termino+"'and fechaVisitaSalida<'"+termino2+"'").setFirstResult(inicial).setMaxResults(15).getResultList();
				total=(long) listaVisitas.size();
			
			}else {
				listaVisitas=Conexion.getEm().createQuery(" from Visita v where empresa.nombreRazonSocial='"+termino+"'").setFirstResult(inicial).setMaxResults(15).getResultList();
				total=(long) listaVisitas.size();
			}
			inicial=Integer.parseInt(request.getParameter("inicial"));
	}
				
		
		
		request.setAttribute("total", total);
		request.setAttribute("inicial", inicial);
		request.setAttribute("listaVisitas", listaVisitas);
		request.setAttribute("cantidad",inicial+ cantidad + total);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/Busquedas.jsp");
		rd.forward(request, response);
	
	}
}
