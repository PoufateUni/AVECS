package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Empresa;
import entidades.Grupo;

import entidades.Visita;
import modelo.EmpresaDao;
import modelo.GrupoDao;
import modelo.MateriaDao;
import modelo.MunicipioDao;
import modelo.VisitaDao;
import utilidades.Conexion;

/**
 * Servlet implementation class RegistrarVisita
 */
@WebServlet("/RegistrarVisita")
public class RegistrarVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarVisita() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in");
		HttpSession sesion = request.getSession();
		
		boolean usuarioOut=sesion.getAttribute("usuario")!=null;
		
		boolean tipoIn=false;
		if(sesion.getAttribute("tipo_usu")!=null) {
		tipoIn=sesion.getAttribute("tipo_usu").equals(1)||sesion.getAttribute("tipo_usu").equals(3);}
		if(usuarioOut&&tipoIn)  {
		int usuario=(int) sesion.getAttribute("usuario");
		Grupo grupo = new Grupo();
		MateriaDao materiaDao = new MateriaDao();
		System.out.println(usuario);
		List<Grupo> grupos ;
	
		List<Empresa> empresas= MateriaDao.getEm().createQuery("from Empresa ").getResultList();
		if(sesion.getAttribute("tipo_usu").equals(3)) {
		grupos = Conexion.getEm().createQuery("from Grupo").getResultList();	
		}else {
		grupos = Conexion.getEm().createQuery("from Grupo grupo where  grupo.profesor ="+usuario).getResultList();
		}
		request.setAttribute("listaGrupos", grupos);
	    request.setAttribute("listaEmpresas", empresas);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/RegistroVisita.jsp");
		
		rd.forward(request, response);
		
		}else {
	
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error en las credenciales de usuario, asegurese que ha ingresado como docente o Administrador');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
			
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Visita visita = new Visita();
		VisitaDao  visitaDao = new VisitaDao ();
		GrupoDao grupoDao= new GrupoDao();
		EmpresaDao empresaDao= new EmpresaDao();
		HttpSession sesion = request.getSession();
		MunicipioDao md= new MunicipioDao();	
		if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo_usu")!="1") {
		int usuario = (Integer)sesion.getAttribute("usuario");
		
		int grupo=Integer.parseInt((request.getParameter("grupo")));
		int empresa =Integer.parseInt(request.getParameter("empresa"));
		int municipio=Integer.parseInt(request.getParameter("municipio"));
		
		Date fechaIn  = new Date();
		Date fechaFin  = new Date();
		
		 try {
				fechaIn= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaInicio"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		 visita.setFechaVisitaInicio(fechaIn);
		 try {
			 fechaFin= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaFin"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		
		 
		 if(fechaFin.before(fechaIn)) {
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('ha insertado una fecha de finalización antes de la fecha de incio, rectifique');");
				 out.println("location='index.jsp';"); 
				out.println("</script>");
				  this.destroy();
			
		 }else{
		 
		 visita.setFechaVisitaSalida(fechaFin);
		 visita.setGrupo(grupoDao.find(grupo));
		 visita.setEmpresa(empresaDao.find(empresa));
		 visita.setTitulo((request.getParameter("titulo")));
		 visita.setDescripcion((request.getParameter("descripcion")));
		 visita.setMunicipio(md.find(municipio));
		 visita.setCuposDisponibles(Integer.parseInt(request.getParameter("cupos")));
		 visita.setCuposAprobadosDisponibles(Integer.parseInt(request.getParameter("cupos2")));
		 System.out.println("activo"+Conexion.getEm().getTransaction().isActive());
		 Conexion.getEm().clear();
		 visitaDao.insert(visita);
		 System.out.println("activo"+Conexion.getEm().getTransaction().isActive());
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Registro Exitoso');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		 
		 
		}}else
		{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('error en los credenciales de usuario');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		}
	}}


