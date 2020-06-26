<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@page import="java.text.SimpleDateFormat" %>
  <%@page import=" java.util.Date" %>
 <%@page import="java.util.List" %>
   <%@page import="entidades.Asistencia" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
    <title>Detalles de Visita</title>
</head>


<body>

<%

SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

List<Asistencia> inscritos=(List)request.getAttribute("estudiantesinscritosactuales");

%>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>


    <div class="container">

        <h2 class="text-center">Visita Detallada</h2>
       
			
			 <div class="form-group container input-group" style="width: 50%">
                <label>Titulo=</label>
                 <p><c:out value="${requestScope.titulo}"/></p>
        	
            </div>
			
			 <div class="form-group container input-group" style="width: 50%">
                <label>Descripcion= <c:out value="${requestScope.descripcion}"/></label>
                 
        
            </div>
			
            <div class="form-group container input-group" style="width: 50%">
                <label>Grupo= <c:out value="${requestScope.grupo}"/></label>
                 
        
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Nombre de la materia= <c:out value="${requestScope.materia}"></c:out></label>
               <c:out value="${requestScope.materia}"></c:out>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Docente</label>
              <p><c:out value="${requestScope.docente}"></c:out> codigo:<c:out value="${requestScope.docenteId}"></c:out></p>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Empresa que se visitará= <a href="DetallarEmpresa?<c:out value="${requestScope.empresaId}"></c:out>"><c:out value="${requestScope.empresa}"></c:out></a></label>
                <br>
                <p> direccion: <c:out value="${requestScope.empresaDireccion}"></c:out> </p>
                
				   </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Departamento= </label>
               <p><c:out value="${requestScope.departamento}"></c:out></p>
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
             <label>Municipio= </label>
               <p><c:out value="${requestScope.municipio}"></c:out></p>
          
            </div>
           
            <div class="form-group container input-group" style="width: 50%">
             <label>Fecha Inicio=<c:out value="${requestScope.fechaIn}"></c:out></label>
              
             </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha fin= <c:out value="${requestScope.fechaFinal}"></c:out> </label>
    
                </div>
           
            <div class="form-group container input-group" style="width: 50%">
                <label>Duración(días)= <c:out value="${requestScope.duracion}"></c:out></label>
               
                </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Cupos Disponibles= <c:out value="${requestScope.cupos}"></c:out></label>
                </div>
                  <div class="form-group container input-group" style="width: 50%">
                <label>Cupos Disponibles para Autorizar= <%=((int)(request.getAttribute("cuposAutorizar"))-inscritos.size()) %>></label>
                </div>
           


         		<%
         		
         		
         		if(inscritos.size()==0){ %>
				<p>Por el momento no hay ningún estudiante registrado </p>
<%}else{ %>		
				<button onclick="Activar()">Editar</button>
				<form action="AutorizarEstudiantes" method="POST">
				<input type="hidden" name="Hexa"value="<%=request.getAttribute("idVisita")%>" >
      			<table>
      			<tr>
      			<th>Código de estudiante</th>
      			<th>Fecha de registro</th>
      			<th>Estado de aprobación</th>
      			
      			</tr>
      			<%for(int i=0;i<inscritos.size();i++){ %>
      			<tr>
      			<th><%=inscritos.get(i).getEstudiante().getCodigo()%></th>
      			<th><%=inscritos.get(i).getFechaRegistro()%></th>
      			<th><%if(inscritos.get(i).getAprobado()==0){ %>
      			<input type="checkbox" id="aprobado" name="asistencia<%=inscritos.get(i).getIdAsistencia()%>" value="true" />
      			<%}else{ %>
      			<input type="checkbox" id="aprobado" name="asistencia<%=inscritos.get(i).getIdAsistencia()%>" value="true" checked/>
      			<%} %>
      			</th>
      			</tr>
      			<%} %>
      			</table>
      			<button type="submit">guardar cambios</button>
       </form>
      <%} %>
     
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
    <script type="text/javascript">
    
    function Activar(){
    	
    	if(){
    		document.getElementById("aprobado")
    	}else{
    		
    	}
   	
   	
   }
    </script>
</body>

