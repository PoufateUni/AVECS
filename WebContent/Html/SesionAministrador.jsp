<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="entidades.Visita"%>
 <%@page import="modelo.VisitaDao" %>
 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
    <title>Sesión Docente</title>
</head>

<body>
<%
   
	List <Visita> visitas;
    visitas= (List) request.getAttribute("listaVisitas");
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
            <a href="RegistrarVisita" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nueva Visita</a>
            <a href="#" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nueva Empresa</a>
             <a href="#" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nuevo Grupo</a>
             <a href="#" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nuevo Materia</a>
              <a href="#" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Listado Estudiantes Inscritos para verificar</a>
            <button class="btn btn-danger col-xs-6 col-sm-4 col-md-3 col-lg-2" style="margin: 0 10px;">Subir Listado de estudiantes</button>
              
        </div>
    </div>

    <div class="container">
       
       <div class="catalogo" >
<%
if(visitas.size()>0){

	for(int i=0;i<visitas.size();i++){
		%>
	<div class="visita_individual">
	<div>
	<p>Empresa =
	  <%= visitas.get(i).getEmpresa().getNombreRazonSocial() %>
	</p>
	<p>Fecha de inicio=
	  <%= visitas.get(i).getFechaVisitaInicio() %>
	</p>
	
	<div>
	<p>codigo grupo=
	  <%= visitas.get(i).getGrupo().getIdGrupo() %>
	</p>
	<p>Asignatura=
	  <%= visitas.get(i).getGrupo().getMateria().getNombre() %>
	</p>
	<p>cupos disponibles=
	  <%= visitas.get(i).getCuposDisponibles() %>
	</p>
	<a href="DetallarVisita?<%=visitas.get(i).getIdVisita() %>">Ver más</a>
	<a href="EditarVisita?<%=visitas.get(i).getIdVisita()%>">Editar</a>
	//COMPROBACION DE Eliminacion PENDIENTE
	<a href="EliminarVisita?<%=visitas.get(i).getIdVisita()%>">Eliminar</a>
	</div>
	
	</div>
	<br></br>
	</div>
	<%
		}}else{%>
<h4>Actualmente no existen visistas asignadas</h4>
<%
}



%>
		</div>
       
       
       
    </div>

    
    
 <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>