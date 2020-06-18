package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.DocumentoApoyo;
import modelo.DocumentoApoyoDao;

/**
 * Servlet implementation class DescargarDocumento
 */
@WebServlet("/DescargarDocumento")
public class DescargarDocumento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DescargarDocumento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      int id = Integer.parseInt(request.getQueryString());
	      	DocumentoApoyo doc= new DocumentoApoyo();
	        DocumentoApoyoDao docd= new DocumentoApoyoDao(); 
	        doc=docd.find(id);
	        String nombre=doc.getNombre();
	        int beginIndex=nombre.indexOf('.');
	        //String tipo="/"+nombre.substring(beginIndex);
	         // Find this file id in database to get file name, and file type

	         // You must tell the browser the file type you are going to send
	         // for example application/pdf, text/plain, text/html, image/jpg
	        response.setContentType(doc.getTipoDocApoyo().getNombre());
	         
	         // Make sure to show the download dialog
	         response.setHeader("Content-Disposition","attachment; filename="+nombre);

	         // Assume file name is retrieved from database
	         // For example D:\\file\\test.pdf

	         File my_file = new File(doc.getDireccionUrl());

	         // This should send the file to browser
	         OutputStream out = response.getOutputStream();
	         
	         FileInputStream in = new FileInputStream(my_file);
	         byte[] buffer = new byte[4096];
	         int length;
	         while ((length = in.read(buffer)) > -1){
	            out.write(buffer, 0, length);
	         }
	         in.close();
	         out.flush();

			
	         
	    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
