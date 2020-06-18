package servlets;

import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

import entidades.DocumentoApoyo;
import modelo.DocumentoApoyoDao;
import modelo.EmpresaDao;
import modelo.TipoDocApoyoDao;

/**
 * Servlet implementation class SubirArchivo
 */
@WebServlet("/SubirArchivo")
public class SubirArchivo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubirArchivo() {
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
	
	public void temporal(HttpServletRequest request, HttpServletResponse response){
Map a= request.getParameterMap();
		
		System.out.println(a);
		int check=Integer.parseInt(request.getParameter("check"));
		String nombre=request.getParameter("nombre");
		String empresa=request.getParameter("empresa");
		int tipo=Integer.parseInt(request.getParameter("tipo"));
		
		if(check==1) {
			int externo=0;
		String url=guardar(request,response);
		}else {
			String url=request.getParameter("link");
			int externo=1;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DocumentoApoyo da = new DocumentoApoyo();
		DocumentoApoyoDao dad= new DocumentoApoyoDao();
		String ruta="";
		   File file ;
		   int maxFileSize = 500 * 1024;
		   int maxMemSize = 500 * 1024;
		   //obtiene variable almacenada en pomxml para usar como ruta de guardado
		   
		   ServletContext context = this.getServletConfig().getServletContext();
		   String filePath = context.getInitParameter("file-upload");
		   File repository = (File) context.getAttribute("javax.servlet.context.tempdir");
		   
		   
		   String contentType = request.getContentType();
		   
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {
		      DiskFileItemFactory factory = new DiskFileItemFactory();
		      
		
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(repository);

		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );
		      
		      try { 
		         // Parse the request to get file items.
		    	  boolean verificador= true;
		         List fileItems = upload.parseRequest(request);
		         System.out.println(fileItems.size());
		         if(fileItems.size()==6) {
             		da.setExterno(0);
             		verificador=true;
             		
             	}else {
             		da.setExterno(1);
             		verificador=false;
             		
             	}
		         
		         
		         // Process the uploaded file items
		         Iterator i = fileItems.iterator();
		         
		        
		         
		         while ( i.hasNext () ) {
		            FileItem fi = (FileItem)i.next();
		            if (verificador && !fi.isFormField ()  ) {
		            	
		               // Get the uploaded file parameters
		               String fieldName = fi.getFieldName();
		               String fileName = fi.getName();
		               boolean isInMemory = fi.isInMemory();
		               long sizeInBytes = fi.getSize();
		            
		               // Write the file
		               if( fileName.lastIndexOf("\\") >= 0 ) {
		                  file = new File( filePath + 
		                  fileName.substring( fileName.lastIndexOf("\\"))) ;
		               } else {
		                  file = new File( filePath + 
		                  fileName.substring(fileName.lastIndexOf("\\")+1)) ;
		               }
		               fi.write( file ) ;
		               ruta=filePath + 
		               fileName;
		            }else {
		            	
		            	String name = fi.getFieldName();
		                String value = fi.getString();
		                if(name.equals("nombre")) {
		                	da.setNombre(value);
		                }else if(name.equals("tipo")){
		                	TipoDocApoyoDao tdad= new TipoDocApoyoDao();
		                	da.setTipoDocApoyo(tdad.find(Integer.parseInt(value)));
		                }else if(name.equals("empresa")) {
		                	EmpresaDao ed = new EmpresaDao();
		                	da.setEmpresa(ed.find(Integer.parseInt(value)));
		                	
		                }else if((name.equals("link"))){
		                	if(!verificador) ruta=value;
		                		
		                	
		                }
		            }
		         }
		         da.setDireccionUrl(ruta);
		        dad.insert(da);
		      } catch(Exception ex) {
		         System.out.println(ex);
		      }
		   } else {
		     //no se ha subido
		   }
		
		   PrintWriter out= response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('archivo guardado correctamente');");
			 out.println("location='index.jsp';");
			  out.println("</script>");
		
		
		
		
	}
	
	private String guardar(HttpServletRequest request, HttpServletResponse response) {
		String direccion=null;
		
		
		
		
		return direccion;
	}

}
