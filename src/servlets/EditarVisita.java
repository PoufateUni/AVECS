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
 * Servlet implementation class EditarVisita
 */
@WebServlet("/EditarVisita")
public class EditarVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarVisita() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		
		if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("tipo_usu").equals(1)||sesion.getAttribute("tipo_usu").equals(3)) {
			 VisitaDao vd= new VisitaDao();
			    Visita v= vd.find(Integer.parseInt(request.getQueryString()));
			boolean acceso=false;
			int usuario=(int) sesion.getAttribute("usuario");
			if(sesion.getAttribute("tipo_usu").equals(1)){
				acceso=(sesion.getAttribute("usuario").equals(v.getGrupo().getProfesor().getPersona_id_Persona()))?true:false;
			}else {
				acceso=true;
			}
			if(acceso) {
				 
				request.setAttribute("grupoid", v.getGrupo().getIdGrupo());
				
				request.setAttribute("materia", v.getGrupo().getMateria().getNombre());
				request.setAttribute("empresaNombre",v.getEmpresa().getNombreRazonSocial());
				request.setAttribute("empresaRut",v.getEmpresa().getRut());
				request.setAttribute("empresaDireccion",v.getEmpresa().getDireccion());
				request.setAttribute("municipio", v.getMunicipio().getMunicipio());
				request.setAttribute("departamento", v.getMunicipio().getDepartamento().getDepartamento());
				request.setAttribute("fechaIn",v.getFechaVisitaInicio().toString());
				request.setAttribute("fechaFinal", v.getFechaVisitaSalida().toString());
				request.setAttribute("cupos",v.getCuposDisponibles());
				request.setAttribute("empresaId",v.getEmpresa().getRut());
				request.setAttribute("titulo", v.getTitulo());
				request.setAttribute("descripcion", v.getDescripcion());
				request.setAttribute("idVisita", v.getIdVisita());
				List<Grupo> grupos ;
				List<Empresa> empresas= MateriaDao.getEm().createQuery("from Empresa ").getResultList();
				if(sesion.getAttribute("tipo_usu").equals(3)) {
				grupos = Conexion.getEm().createQuery("from Grupo").getResultList();	
				}else {
				grupos = Conexion.getEm().createQuery("from Grupo grupo where  grupo.profesor ="+usuario).getResultList();
				}
				
				request.setAttribute("listaGrupos", grupos);
			    request.setAttribute("listaEmpresas", empresas);
				
			    
			    
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/ModificarVisita.jsp");
				rd.forward(request, response);
			}else {
				PrintWriter out= response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('error interno: no es docente encargado de esta visita');");
				 out.println("location='index.jsp';"); 
				out.println("</script>");
			}
			
		  
			
		}else {
			PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('credenciales de inicio de sesion incorrectas, no es detectado como usuario docente');");
			 out.println("location='index.jsp';"); 
			out.println("</script>");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		
		VisitaDao vd= new VisitaDao();
		EmpresaDao empresaDao= new EmpresaDao();
		GrupoDao grupoDao=new GrupoDao();
		MunicipioDao municipioDao = new MunicipioDao();
	    Visita v= vd.find(Integer.parseInt(request.getParameter("idVisita")));
	    v.setTitulo(request.getParameter("titulo"));
	    v.setDescripcion(request.getParameter("descripcion"));
	    v.setCuposDisponibles(Integer.parseInt(request.getParameter("cupos")));

	    v.setEmpresa(empresaDao.find((Integer.parseInt(request.getParameter("empresa")))));
	    Date fechaIn  = new Date();
		Date fechaFin  = new Date();
		
		 try {
				fechaIn= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaInicio"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		 v.setFechaVisitaInicio(fechaIn);
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
			
		 }
		 
		 v.setFechaVisitaSalida(fechaFin);
	    v.setGrupo(grupoDao.find(Integer.parseInt((request.getParameter("grupo")))));
	    v.setMunicipio(municipioDao.find(Integer.parseInt(request.getParameter("municipio"))));
	   
	    
	    vd.update(v);
	   
	    
	    PrintWriter out= response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('cambio Exitoso');");
		 out.println("location='index.jsp';");
		  out.println("</script>");
	    
	}

}
