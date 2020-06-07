package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Persona;
import entidades.Empresa;
import modelo.EmpresaDao;
import modelo.GeneroDao;
import modelo.PersonaDao;
import modelo.TipoIdDao;

/**
 * Servlet implementation class RegistrarEmpresa
 */
@WebServlet("/RegistrarEmpresa")
public class RegistrarEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarEmpresa() {
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
			int representanteDoc=Integer.parseInt(request.getParameter("documento"));
			Persona representante = new Persona();
			 PersonaDao pd = new PersonaDao();
			

				
				 Persona temmp=pd.find(representanteDoc);
				 
				 if(temmp !=null){
				 PrintWriter out= response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('esta persona ya está registrada');");
					 out.println("history.back();"); 
					out.println("</script>");
				 }else {
				 GeneroDao gd = new GeneroDao();
				 TipoIdDao tp= new TipoIdDao();
				 int tipoDocumento= Integer.parseInt(request.getParameter("tipoDocumento"));
				 String nombres = request.getParameter("nombres");
				 String apellido1= request.getParameter("apellido1");
				 String apellido2= request.getParameter("apellido2");
				 int genero = Integer.parseInt(request.getParameter("genero"));
				 representante.setApellido1(apellido1);
				 representante.setApellido2(apellido2);
				 representante.setGenero(gd.find(genero));
				 representante.setNombre(nombres);
				 representante.setTipoId(tp.find(tipoDocumento));
				 representante.setId_Persona(representanteDoc);
				 pd.insert(representante);
				 
				 Empresa empresa= new Empresa();
				 EmpresaDao ed = new EmpresaDao();
						 
				 int nit=Integer.parseInt(request.getParameter("nit"));
				 String razon= request.getParameter("nombre");
				 int telefono=Integer.parseInt(request.getParameter("telefono"));
				 String direccion = request.getParameter("direccion");
				 int tipoPersona= Integer.parseInt(request.getParameter("tipoPersona"));
				 String correo= request.getParameter("correo");
				 empresa.setCorreo_contacto(correo);
				 empresa.setDireccion(direccion);
				 empresa.setNatural_juridica((byte) tipoPersona);
				 empresa.setNombreRazonSocial(razon);
				 empresa.setRut(nit);
				 empresa.setTelefono(telefono);
				 empresa.setPersona(representante);
				 try {
					 
					 ed.insert(empresa);
					 PrintWriter out= response.getWriter();
					 out.println("<script type=\"text/javascript\">");
						out.println("alert('Registro exitoso');");
						 out.println("location='index.jsp';"); 
						out.println("</script>");
				 }catch(Exception e){
					 PrintWriter out= response.getWriter();
					 out.println("<script type=\"text/javascript\">");
						out.println("alert('Empresa Ya registrada previamente');");
						out.println("history.back();"); 
						out.println("</script>");
				 }
				
				
				
			 }
		}else {
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('no ha iniciado sesion como administrador');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
		  //sesion no valida
		}

			//
		}}}
		