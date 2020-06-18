<%-- 
    Document   : documento
    Created on : 9/06/2020, 11:54:05 PM
    Author     : Miguel
--%>
<%@page import="entidades.TipoDocApoyo"%>
<%@page import="utilidades.Conexion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="java.util.List"%>
    <%@page import="entidades.Grupo"%>
     <%@page import="entidades.Empresa"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 

     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\component-chosen.css" /> 
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\component-chosen.min.css" /> 


    <title>Ingresar Documento</title>
    <script type="text/javascript">
    function showContent() {
        elementblock1 = document.getElementById("archivo");
        elementblock2 = document.getElementById("link");
        elementitem= document.getElementById("documento");
        elementitem2 = document.getElementById("url");
        check = document.getElementById("check");
        if (check.checked) {
        	elementblock1.style.display='block';
        	elementblock2.style.display='none';
        	elementitem.required=true;
        	elementitem2.required=false;
        	
        }
        else {
        	elementblock1.style.display='none';
        	elementblock2.style.display='block';
        	elementitem.required=false;
        	elementitem2.required=true;
        }
    }
  
</script>
</head>
<%
List<TipoDocApoyo> listaTipoDocApoyo =  Conexion.getEm().createQuery("from TipoDocApoyo ").getResultList();
 List <Empresa> empresas= Conexion.getEm().createQuery("from Empresa  ").getResultList();
%>

<body>
    <header>
        <div class="container">
            <h2>AVECS</h2>
            <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/js\municipios.js'></script>
  <script type="text/javascript"src="${pageContext.request.contextPath}/js\jquery-3.4.1.min.js"></script>
  <script type="text/javascript"src="${pageContext.request.contextPath}/js\chosen.jquery.js" type="text/javascript"></script>
        </div>
    </header>



    <div class="container" >

        <h2 class="text-center">Ingresar Documento</h2>
        <form action="../SubirArchivo" method="post" enctype = "multipart/form-data">
			<div class="form-group container input-group" style="width: 50%">
                <label>Nombre</label>
                <input class="form-control" required name="nombre" type="text"  />
            </div>
            <div class="form-group container input-group" style="width: 50%">
               
                <div class="form-check">
  <input  type="checkbox" name="check" id="check" value="1" onchange="javascript:showContent()" >
  <label class="form-check-label" for="subir" required>
    Marcar para cargar archivo localmente, desmarcar para guardar direccion web.
  </label>
</div>
                
                 <div class="form-group container input-group" style="display: block	;" id="archivo" style="display: none;">
                <label>Informacion</label>
                <input class="form-control" id="documento" required name="documento" type="file"  />
                </div> 
<div class="form-check">

 
</div> </div>
            
            
           
             <div class="form-group container input-group" style="display: none;" id="link">
                <label>Link</label>
                <input class="form-control" id="url"required name="link" type="text"  />
            </div> 
           
            
            
            
            <div class="form-group container input-group" style="width: 50%">
                <label>Empresa</label>
                 <select name="empresa" id="grupo_id" required> 
			<%
					for(int i=0;i<empresas.size();i++){
						%>
						<option value="<%=empresas.get(i).getRut() %>"><%=empresas.get(i).getNombreRazonSocial() %></option>
					<%	
					}
					
					%>		
                 </select> 
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Tipo Documento</label>
                 <select name="tipo" id="grupo_id" required> 
			<%
					for(int i=0;i<listaTipoDocApoyo.size();i++){
						%>
						<option value="<%=listaTipoDocApoyo.get(i).getIdTipo_doc_Apoyo() %>"><%=listaTipoDocApoyo.get(i).getNombre() %>-<%=listaTipoDocApoyo.get(i).getDescripcion() %></option>
					<%	
					}
					
					%>		
                 </select> 
            </div>


            <div class="form-group">
                <div class="col-xs-12" style="text-align: center;">
                    <a href="#" class="btn btn-danger" onclick="history.back()">Volver</a>
                    <button type="submit">Enviar</button>
                </div>
          
            </div>

        </form>
        <div class="form-group"><br><br></div>
    </div>

    <footer style="visibility: hidden;">
        <div>
            <p>Programa de Comunicación Social - Universidad Francisco de Paula Santander</p>
            <p>Teléfono (057)(7) 5776655</p>
            <p>Correo electrónico: oficinadeprensa@ufps.edu.co - oficinajuridica@ufps.edu.co</p>
        </div>
    </footer>

 <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/js\municipios.js'></script>
  <script src="${pageContext.request.contextPath}/js\jquery-3.4.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js\chosen.jquery.js" type="text/javascript"></script>
     
</body>