<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="entidades.Visita"%>
 <%@page import="modelo.VisitaDao" %>
 <%@page import="java.util.List"%>
 <%@page import="java.text.SimpleDateFormat" %>
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
   

SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
    VisitaDao vd = new VisitaDao();
   	
    
    List <Visita> visitas= vd.getEm().createQuery("from Visita order by fechaInsercion  DESC ").getResultList();
    
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
            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-4"></div>
    	     <li class="col-xs-4 col-sm-3 col-md-2 col-lg-3"><a href=""><%=session.getAttribute("nombre") %></a></li>
    	<% 
    	int tipo= (Integer)session.getAttribute("tipo_usu");
         if(tipo==0||tipo==2){
    
    %>
    <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="HistoricoAsistencias">Listado de Asistencias</a></li>
    
    <%	//separacion hecha para posibles cambios en el futuro	
    }else if(session.getAttribute("tipo_usu").equals(1)){//CUANDO EL TIPO DE USUARIO ES PROFESOR
    	%>
    	 <li class="col-xs-4 col-sm-3 col-md-2 "><a href="HistoricoVisitas">Administrar Perfil</a></li>
    	  <li class="col-xs-4 col-sm-3 col-md-2 "><a href="RegistrarVisita">Crear Visita</a></li>
    	<%
    }else if(session.getAttribute("tipo_usu").equals(3)){//CUANDO EL TIPO DE USUARIO ES ADMINISTRADOR
    	%>
   		<li class="col-xs-4 col-sm-3 col-md-2 "><a href="HistoricoVisitas">Administrar Perfil</a></li>
    	<li class="col-xs-4 col-sm-3 col-md-2 "><a href="RegistrarVisita">Crear Visita</a></li>
   	<%
    }
         %>
            
            <li class="col-xs-4 col-sm-3 col-md-2 "> <a href="#VF-OlvidasteContraseña" class="btn btn-danger " data-toggle="modal">Cerrar Sesion</a></li>
        </ul>
    </nav>
        <div class="modal fade" id="VF-OlvidasteContraseña">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;&nbsp</button>
                            <!--MODAL-HEADER-->
                            <h4 style="text-align: center;">Está seguro de cerrar Sesión?</h4>

                            <div class="form-group container input-group" style="width: 50%">
                                
                                
                                <div class="form-group" style="margin: 50px;">
                                    <div class="col-xs-1 col-lg-3"></div>
                                    <a href='IniciarSesion'class="btn btn-danger">Salir</a>
                                    <div class="col-xs-1 col-lg-3"></div>
                                </div>
                            </div>
                            

                        </div>
                    </div>
                </div>
    </div><% 
    }
    %>
    
    
    
    
    <div class="container">
        <div class="row">
        
        
            <section class="col-xs-12 col-lg-12">
                <div id="global">
                <table class="table table-striped table-bordered table-hover table-responsive">
                    <tr>
                        <th>Empresa</th>
                        <th>Fecha inicio</th>
                        <th>Código grupo</th>
                        <th>Asignatura</th>
                        <th>Cupos disponibles</th>
                    </tr>
                    <%
	for(int i=0;i<visitas.size();i++){
		%>
                     <tr>
                     <th> <%= visitas.get(i).getEmpresa().getNombreRazonSocial() %></th>
                     <th><%= format.format(visitas.get(i).getFechaVisitaInicio()) %></th>
                     
                     <th><%= visitas.get(i).getGrupo().getIdGrupo() %></th>
                     <th><%= visitas.get(i).getGrupo().getMateria().getNombre() %></th>
                     <th><%= visitas.get(i).getCuposDisponibles()%></th>
                     <th><a href="DetallarVisita?<%=visitas.get(i).getIdVisita() %>">Ver más</a></th>
                        
                     
                     
                     
                     </tr>
                    <%
                    
		}%>
                </table>
            </div>
            </section>
        </div>
    </div>
    



    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>