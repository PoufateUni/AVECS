<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Visita"%>
 <%@page import="modelo.VisitaDao" %>
 <%@page import="java.util.List"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />

    <title>Busqueda De Visitas</title>
</head>

<body>
    <header>
   <% SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy"); %>  
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>

    <div class="container">
        

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
          
          
        
        <div><br></div>
        <form action="${pageContext.request.contextPath}/BusquedaVisitas" id="form" method="post">
        <h2 class="text-center">Busqueda de visitas empresariales</h2><div><br></div>
        <h3 class="text-center">Recuerde que las visitas son buscadas a partir de rangos de fecha, esto es, puede seleccionar una fecha antes y despues de la fecha puntual que recuerde para ayudarle por si su memoria falla por poco</h3>
        <div class="container form-group  input-group">
            <div class="row">
                <h4 class="col-xs-5 col-lg-2">Buscar por:</h4>
                <select name="tipo" id="tipo" class="form-control" style="width: 50%;" onchange="cambioTipo()">
                    <option value="fechaInicio">fecha de inicio de visita</option>
                    <option value="fechaFinal">fecha de finalizacion de visita</option>
                    <option value="nombre">Nombre de la empresa</option>
                </select>
            </div>
        </div>
        <div class="container-fluid form-group ">
            <div class="row">
                <div class="col-xs-0"></div>
                <input name="termino" id="termino" type="date" placeholder="Busqueda" required class="col-xs-12 col-lg-12">
                <input name="termino2" id="termino2" type="date" placeholder="Busqueda" required class="col-xs-12 col-lg-12">
                <button onclick="buscar()">Buscar</button>
            </div>
            
        </div>
        
        
        
        <div><br><br></div>
        <h3>Listado de visitas</h3>
	<%List <Visita> visitas;
    visitas= (List) request.getAttribute("listaVisitas"); %>
   
        
            <div id="global">
            <%if(request.getAttribute("cantidad").equals("All")){ %>
            <p>Mostrando todas las visitas</p>
            <%}else if(request.getAttribute("cantidad").equals("null")){ %>
            
            <%}else{ %>
            <p>Mostrando <%=request.getAttribute("cantidad") %></p>
            <%} %>
       
                <table class="table table-striped table-bordered table-hover table-responsive"
                    style="scroll-behavior: auto;">
                    <tr>
                        <th style="text-align: center;">Empresa</th>
                        <th style="text-align: center;">Fecha inicio</th>
                        <th style="text-align: center;">Código grupo</th>
                        <th style="text-align: center;">Asignatura</th>
                        <th style="text-align: center;">Cupos disponibles</th>
                        
                        
                        
                    </tr>
           <%
           if(visitas!=null){
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
	}}else{
%>
<tr>
<th>no se encontraron resultados</th>
</tr>
<%} %>
                </table>
            </div>
            <div><br><br></div>
             <input type="hidden" id="direccion" name="direccion" value="1">
             <%if(request.getAttribute("inicial")==null){ %>
             <input type="hidden" id="inicial" name="inicial" value="0">
             <%}else{ %>
              <input type="hidden" id="inicial" name="inicial" value="<%=request.getAttribute("inicial")  %>">
             <%} %>
             <input type="hidden" id="total" name="total" value="<%=request.getAttribute("total")  %>">
        </form>

		
	

        <div class="col-xs-1 col-sm-1 col-lg-3"></div>
        <button id="atras" class="btn btn-danger col-xs-4 col-lg-2" onclick="enviar(0)">Retroceder</button>
        <div  class="col-xs-2 col-sm-2 col-lg-1"></div>
        <button id="adelante" class="btn btn-danger col-xs-4 col-lg-2" onclick="enviar(1)">Avanzar</button>
        <div class="col-xs-1 col-sm-1 col-lg-3"></div>

    </div><br>

    <footer style="visibility: hidden;">
        <div>
            <p>Programa de Comunicación Social - Universidad Francisco de Paula Santander</p>
            <p>Teléfono (057)(7) 5776655</p>
            <p>Correo electrónico: oficinadeprensa@ufps.edu.co - oficinajuridica@ufps.edu.co</p>
        </div>
    </footer>

  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    
    
    <script >
   
    window.onload=botones;
    function botones(){
    	
    	var inicial,fina,resta;
    	
    	inicial=document.getElementById('inicial').value;
    
    	fina=document.getElementById('total').value;
 
    	resta=parseInt(fina) - parseInt(inicial)
    	console.log(resta);
    	
    	if(document.getElementById("inicial").value=="0"){
    		document.getElementById('atras').style.display = 'none';
    	}else{
    		document.getElementById('atras').style.display = 'block';
    	}

    	if(resta<=15){
    		document.getElementById('adelante').style.display = 'none';
    	}else{
    		document.getElementById('adelante').style.display = 'block';
    	}
    		
    }
    </script>
    
    <script>
    function cambioTipo(){
    	
    	 var eleccion

    	  eleccion=document.getElementById("tipo");
    	  termino=document.getElementById("termino");
    	  termino2=document.getElementById("termino2");
    	
    	
    	if(eleccion.value=="nombre"){
    		
    		termino.type='text';
    		termino2.type="hidden";
    	}else if(eleccion.value=="fechaFinal"){
    		
    		termino2.type='date';
    		termino.type='date';
    	}else{
    		termino2.type='date';
    		termino.type='date';
    	}
    	
    }
    </script>
</body>
<script>
    function enviar(a) {
        document.getElementById("direccion").value=a;
        if( document.getElementById("direccion").value=="1"){
        	$('#inicial').val(parseInt($('#inicial').val()) + 15);
        }else{
        	$('#inicial').val(parseInt($('#inicial').val()) - 15);
        }
        document.getElementById("form").submit();
    }
    
    function buscar(){
    	 document.getElementById("inicial").value="0";
    	document.getElementById("form").submit();
    }
    
    </script>
</html>