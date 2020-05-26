<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="entidades.Asistencia"%>
 <%@page import="modelo.VisitaDao" %>
 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
    <title>Sesión Estudiante</title>
</head>

<body>
<%
   
	List <Asistencia> asistencias;
    asistencias= (List) request.getAttribute("listaAsistencias");
    %>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>
    <div class="container">
        <nav class="row">
            <ul class="menu">
                <div class="col-xs-8 col-sm-8 col-md-9 col-lg-10"></div>
               <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><form method="get" action="/avecs/IniciarSesion"><button type="submit">salir</button></form></li>
            </ul>
        </nav>
        <br>
    </div>

    <div class="container">
        <div class="row">
           
              
        </div>
    </div>

    <div class="container">
       
       <div class="catalogo" >
<%
if(asistencias.size()>0){

	for(int i=0;i<asistencias.size();i++){
		%>
	<div class="asistencia_individual">
	<div>
	<p>Empresa =
	  <%= asistencias.get(i).getVisita().getEmpresa().getNombreRazonSocial() %>
	</p>
	<p>Fecha de inicio=
	  <%= asistencias.get(i).getVisita().getFechaVisitaInicio() %>
	</p>
	
	<div>
	<p>codigo grupo=
	  <%= asistencias.get(i).getVisita().getGrupo().getIdGrupo() %>
	</p>
	<p>Nombre de la Materia=
	  <%= asistencias.get(i).getVisita().getGrupo().getMateria().getIdMateria() %>
	</p>
	<p>
	  <%if(asistencias.get(i).getAprobado()==0){
		  %>
		 no Aprobado
	<%}else{ %>
		 Aprobado
	  <%} %>
	  
	</p>
	
	
	
	//COMPROBACION DE Eliminacion PENDIENTE
	<a class="btn btn-danger" href="EliminarAsistencia?<%=asistencias.get(i).getIdAsistencia()%>">Eliminar</a>
	</div>
	
	</div>
	<br></br>
	</div>
	<%
		}}else{%>
<h4>Actualmente no tienes visistas inscritas</h4>
<%
}



%>
		</div>
       
       
       
    </div>

    
    
 <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>