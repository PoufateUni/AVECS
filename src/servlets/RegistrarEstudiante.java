package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.RollbackException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Estudiante;
import entidades.Genero;
import entidades.Persona;
import entidades.TipoId;
import entidades.TipoUsuario;
import entidades.Usuario;
import modelo.EstudianteDao;
import modelo.GeneroDao;
import modelo.PersonaDao;
import modelo.TipoIdDao;
import modelo.UsuarioDao;

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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 Persona p= new Persona();
	 PrintWriter out = response.getWriter();
	 Estudiante es= new Estudiante();
	 EstudianteDao esd= new EstudianteDao();
	 Usuario usuario= new Usuario();
	 UsuarioDao usd= new UsuarioDao();
	 Integer idP= Integer.parseInt(request.getParameter("id"));
	 PersonaDao  pd = new PersonaDao();
	 Persona tempp= pd.find(idP);
	 int repetidos=	esd.findByCodigoEstudiante(request.getParameter("codigo"));
	 if(tempp !=null ) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('esta persona ya ha sido registrada previamente');");
			 
			  out.println("</script>");
	 }else {
			
		
			if(repetidos==1) {out.println("<script type=\"text/javascript\">");
			out.println("alert(' el codigo estudiantil ha sido registrado en otro usuario');");
			  out.println("location='index.jsp';");
			  out.println("</script>");}
			
			else {
		 TipoId ti= new TipoId();
		 TipoIdDao tid= new TipoIdDao();
		 ti=tid.find(Integer.parseInt(request.getParameter("tipoid")));
		 Genero g = new Genero();
		 GeneroDao gd= new GeneroDao();
		 g=gd.find(Integer.parseInt(request.getParameter("genero")));	 
		 p.setId_Persona(idP);
		
		 
		 Date fecha  = new Date();
		 try {
				fecha= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha_nacimiento"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		 p.setFechaNacimiento(fecha);
		 p.setTipoId(ti);
		 p.setGenero(g);
		 p.setNombre(request.getParameter("nombres"));
		 p.setApellido1(request.getParameter("ap1"));
		 p.setApellido2(request.getParameter("ap2"));
		 p.setCorreoContacto(request.getParameter("correo"));
		 
		
					pd.insert(p);	
					usuario.setContrasena(request.getParameter("pass"));
					 usuario.setCorreoUsuario(request.getParameter("correo"));
					 usuario.setVerificado((byte) 0);
					 usuario.setIdUsuario(idP);
					 TipoUsuario tiu = new TipoUsuario();
					 tiu.setIdTipo_usuario(0);
					 tiu.setNombre("Estudiante");
					 usuario.setTipoUsuario(tiu);
					 usuario.setPersona(p);
					 es.setCodigo(request.getParameter("codigo"));
					 es.setPersona(p);
					 es.setPersona_id_Persona(idP);

					usd.insert(usuario);
					esd.insert(es);
					  out.println("<script type=\"text/javascript\">");
						out.println("alert('La persona ha sido registrada exitosamente');");
						  out.println("location='index.jsp';");
						  out.println("</script>");
					  }
					
					
						
					
					
				
		
	
		
	 }
}}
