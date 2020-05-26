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
    <link rel="stylesheet" href="css/bootstrap.css" />

    <title>Visitas Empresariales</title>
</head>

<body>
 
    <%
    VisitaDao vd = new VisitaDao();
    List <Visita> visitas= vd.getEm().createQuery("from Visita order by fechaInsercion  DESC ").setMaxResults(10).getResultList();
    %>
    <header style="background: #dd4b39">
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>
    <div class="container-fluid">
    
    <% 
    
    if(session.getAttribute("usuario")==null){
    	
    	%><nav style=" text-align: right;">
        <ul class="menu row">
            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-8"></div>
            <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/Login.html">Iniciar Sesión</a></li>
            <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/Registrarse.jsp">Registrarse</a></li>
            
        </ul>
    </nav>
    
    <%}else{
    	%>
    	<nav style=" text-align: right;">
        <ul class="menu row">
            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-6"></div>
    	     <li class="col-xs-4 col-sm-3 col-md-2 col-lg-3"><a href=""><%=session.getAttribute("nombre") %></a></li>
    	<% 
    	int tipo= (Integer)session.getAttribute("tipo_usu");
         if(tipo==0||tipo==2){
    
    %>
    <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><a href="HistoricoAsistencias">Listado de Asistencias</a></li>
    
    <%	//separacion hecha para posibles cambios en el futuro	
    }else if(session.getAttribute("tipo_usu").equals(1)){//CUANDO EL TIPO DE USUARIO ES PROFESOR
    	%>
    	 <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><a href="HistoricoVisitas">Administrar Perfil</a></li>
    	  <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><a href="RegistrarVisita">Crear Visita</a></li>
    	<%
    }else if(session.getAttribute("tipo_usu").equals(3)){//CUANDO EL TIPO DE USUARIO ES ADMINISTRADOR
    	%>
   		<li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><a href="HistoricoVisitas">Administrar Perfil</a></li>
    	<li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><a href="RegistrarVisita">Crear Visita</a></li>
   	<%
    }
         %>
             <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><form method="get" action="/avecs/IniciarSesion"><button type="submit">salir</button></form></li>
        </ul>
    </nav>
    </div><% 
    }
    %>
    
    
    
    <!-- listado de ultimas 10 Visitas registradas -->
         
	<div class="container-fluid">
<div class="catalogo" >
	<%
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
	
	</div>
	
	</div>
	<br></br>
	</div>
	<%
		}%>
		</div>

	
	</div>


    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>