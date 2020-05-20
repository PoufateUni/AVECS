package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Estudiante;
import entidades.Genero;
import entidades.Persona;
import entidades.Profesor;
import entidades.TipoId;
import entidades.TipoUsuario;
import entidades.Usuario;
import modelo.EstudianteDao;
import modelo.GeneroDao;
import modelo.PersonaDao;
import modelo.ProfesorDao;
import modelo.TipoIdDao;
import modelo.TipoUsuarioDao;
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
private Persona crearPersonaSimple(int id, TipoId tipoId, String nombres, String apellido1, String apellido2,String correo, Genero Genero, Date fechan) {
	Persona p= new Persona();
	p.setApellido1(apellido1);
	p.setApellido2(apellido2);
	p.setCorreoContacto(correo);
	p.setFechaNacimiento(fechan);
	p.setId_Persona(id);
	p.setTipoId(tipoId);
	p.setGenero(Genero);
	p.setNombre(nombres);
	return p;
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	 PrintWriter out = response.getWriter();
	 TipoUsuario tiu = new TipoUsuario();
	 TipoId ti= new TipoId();
	 TipoIdDao tid= new TipoIdDao();
	 Genero g = new Genero();
	 GeneroDao gd= new GeneroDao();
	 TipoUsuarioDao tiud= new TipoUsuarioDao();
	 Usuario usuario= new Usuario();
	 UsuarioDao usd= new UsuarioDao();
	 PersonaDao  pd = new PersonaDao();
	 //asignacion de variables para objeto persona usado
	 Integer idP= Integer.parseInt(request.getParameter("id"));
	 String nombres=request.getParameter("nombres");
	 String apellido1=request.getParameter("ap1");
	 String apellido2=request.getParameter("ap2");
	 String correo=request.getParameter("correo");
	 int tipoUsuario=Integer.parseInt(request.getParameter("tipoUsuario"));
	 tiu=tiud.find(tipoUsuario);
	 int tipoId=Integer.parseInt(request.getParameter("tipoid"));
	 int genero =Integer.parseInt(request.getParameter("genero"));
	 String contrasena=request.getParameter("pass");
	 String codigo=request.getParameter("codigo");
	 Date fecha  = new Date();
	 try {
			fecha= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha_nacimiento"));
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
	 //verificacion por primera iteracion
	 
	 if(tipoUsuario==2||tipoUsuario==3) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Aun no es posible registrar estos usuarios');");
			 out.println("location='Html/Registrarse.html';");
			  out.println("</script>");
	 }else {
	 
	 //verificacion de repetidos en persona
	 Persona tempp= pd.find(idP);
	 if(tempp !=null ) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('esta persona ya ha sido registrada previamente');");
			 out.println("location='Html/Registrarse.html';");
			  out.println("</script>");
	 }else {
		 //verificacion de repetidos en estudiante
		 if(tipoUsuario==0) {
		 int repetidos=	pd.findByCodigoEstudiante(request.getParameter("codigo"));
			if(repetidos==1) {out.println("<script type=\"text/javascript\">");
			out.println("alert(' el codigo estudiantil ha sido registrado en otro usuario');");
			 out.println("location='Html/Registrarse.html';");
			  out.println("</script>");}
			else {
		 ti=tid.find(tipoId);
		 g=gd.find(genero);	 
		
		 
		
					pd.insert(crearPersonaSimple(idP, ti, nombres, apellido1, apellido2, correo, g, fecha));	
					 usuario.setContrasena(contrasena);
					 usuario.setCorreoUsuario(correo);
					 usuario.setVerificado((byte) 0);
					 usuario.setPersona(pd.find(idP));
					 usuario.setIdUsuario(idP);
					 
					 
						 Estudiante es= new Estudiante();
						 EstudianteDao esd= new EstudianteDao();
						 es.setCodigo(request.getParameter("codigo"));
						 es.setPersona(pd.find(idP));
						 es.setPersona_id_Persona(idP);
						 tiu.setIdTipo_usuario(0);
						 tiu.setNombre("Estudiante");
						 usuario.setTipoUsuario(tiu);
						 esd.insert(es);
						 usd.insert(usuario);
							
						  out.println("<script type=\"text/javascript\">");
							out.println("alert('El/La estudiante ha sido registrad@ exitosamente');");
							  out.println("location='index.jsp';");
							  out.println("</script>");
					 
					 
					  }
			 //verificacion de repetidos en profesor
	 }else if(tipoUsuario==1) {
		
		 int repetidos=	pd.findByCodigoProfesor(request.getParameter("codigo"));
			if(repetidos==1) {out.println("<script type=\"text/javascript\">");
			out.println("alert(' el codigo de Docente ha sido registrado en otro usuario');");
			 out.println("location='Html/Registrarse.html';");
			  out.println("</script>");}
			else {
				 Profesor profesor = new Profesor();
				 ProfesorDao profesorD = new ProfesorDao();
				 profesor.setAdministrador(null);
				 profesor.setCodigoProfesor(request.getParameter("codigo"));
				 profesor.setGrupos(null);
				 System.out.println(idP);
				
				 ti=tid.find(tipoId);
				 g=gd.find(genero);	 

				 pd.insert(crearPersonaSimple(idP, ti, nombres, apellido1, apellido2, correo, g, fecha));
				 
					 usuario.setContrasena(contrasena);
					 usuario.setCorreoUsuario(correo);
					 usuario.setVerificado((byte) 0);
					 usuario.setPersona(pd.find(idP));
					 usuario.setIdUsuario(idP);
					
						 tiu.setIdTipo_usuario(1);
						 tiu.setNombre("Profesor");
						 usuario.setTipoUsuario(tiu);
						 usd.insert(usuario);
						 profesor.setPersona(pd.find(idP));
						 profesor.setPersona_id_Persona(idP);
						 profesorD.insert(profesor);
						profesorD.insert(profesor);
						 
							
						  out.println("<script type=\"text/javascript\">");
							out.println("alert('El/La Docente ha sido registrad@ exitosamente');");
							  out.println("location='index.jsp';");
							  out.println("</script>");
					 
					 
					  }
	 }
}}}}
