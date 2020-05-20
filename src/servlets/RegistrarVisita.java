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
		boolean usuarioIn=sesion.getAttribute("usuario")==null;
		//arreglar estos condicionales
		boolean tipoIn=false;
		if(sesion.getAttribute("tipo_usu"!=null);
		tipoIn =!sesion.getAttribute("tipo_usu").equals(1);
		if(usuarioIn||tipoIn)  {
			int usuario=(int) sesion.getAttribute("usuario");
		Grupo grupo = new Grupo();
		MateriaDao materiaDao = new MateriaDao();
		System.out.println(usuario);
		List<Empresa> empresas= MateriaDao.getEm().createQuery("from Empresa ").getResultList();
		List<Grupo> materias = MateriaDao.getEm().createQuery("from Grupo grupo where  grupo.profesor ="+usuario).getResultList();
	
		request.setAttribute("listaGrupos", materias);
	    request.setAttribute("listaEmpresas", empresas);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Html/RegistroVisita.jsp");
		
		rd.forward(request, response);
		response.getWriter().append("Served at: "+materias.size()).append(request.getContextPath());
		}else {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>Acceso Invalido, inicie con su usuario Docente</font>");
			rd.forward(request, response);
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
		municipio=7;
		Date fecha  = new Date();
		 try {
				fecha= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaInicio"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		 visita.setFechaVisitaInicio(fecha);
		 try {
				fecha= new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaFin"));
			} catch (ParseException e1) {
				
				e1.printStackTrace();
			}
		 
		 visita.setFechaVisitaSalida(fecha);
		 visita.setGrupo(grupoDao.find(grupo));
		 visita.setEmpresa(empresaDao.find(empresa));
		 
		 visita.setMunicipio(md.find(municipio));
		 visita.setCuposDisponibles(request.getParameter("cupos"));
		 visitaDao.insert(visita);
		 
		 
		 
		}else
		{
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=green>Registro Exitoso</font>");
			rd.include(request, response);
		}
	}

}
