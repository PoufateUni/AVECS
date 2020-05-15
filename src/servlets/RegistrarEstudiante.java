package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Persona;
import modelo.PersonaDao;

/**
 * Servlet implementation class RegistrarEstudiante
 */
@WebServlet("/registrarestudiante")
public class RegistrarEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarEstudiante() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 Persona p= new Persona();
	 PersonaDao  pd = new PersonaDao();
	 try {
		 p.setId_Persona(Integer.parseInt(request.getParameter("id")));
		 pd.insert(p);
		 
	 }catch(NullPointerException e) {
		 request.getRequestDispatcher("../jsp/errorLogin.jsp");
		 
	 }
		
		response.getWriter().append();
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("tipoid"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("genero"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("fecha_nacimiento"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("nombres"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("ap1"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("ap2"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("correo"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("codigo"));
		response.getWriter().append("/n");
		response.getWriter().append(request.getParameter("pass"));
		
		
	}

}
