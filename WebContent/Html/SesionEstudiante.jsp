<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="entidades.Asistencia"%>
 <%@page import="modelo.VisitaDao" %>
 <%@page import="java.util.List"%>
  <%@page import="java.text.SimpleDateFormat" %>
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
SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
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
                        <th>Aprobado</th>
                    </tr>
                    <%
	for(int i=0;i<asistencias.size();i++){
		%>
                     <tr>
                     <th> <%= asistencias.get(i).getVisita().getEmpresa().getNombreRazonSocial() %></th>
                     <th><%= format.format(asistencias.get(i).getVisita().getFechaVisitaInicio()) %></th>
                     
                     <th><%= asistencias.get(i).getVisita().getGrupo().getIdGrupo() %></th>
                     <th><%= asistencias.get(i).getVisita().getGrupo().getMateria().getNombre() %></th>
                     <th><% if(asistencias.get(i).getAprobado()!=0){ %> <span class=" glyphicon glyphicon-ok"></span>  <% }else{%><span class="glyphicon glyphicon-remove"></span>  <%}%></th>
                     <th><a href="DetallarVisita?<%=asistencias.get(i).getVisita().getIdVisita() %>">Ver más</a></th>
                  
                     <th><a href="#VF-Confirmacion" class="btn btn-danger " data-toggle="modal">Cancelar Asistencia</a></th>

                     </tr>
                  <div class="modal fade" id="VF-Confirmacion">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;&nbsp</button>
                            <!--MODAL-HEADER-->
                            <h4 style="text-align: center;">Está seguro de Suprimir esta Asistencia?</h4>

                            <div class="form-group container input-group" style="width: 50%">
                                
                                
                                <div class="form-group" style="margin: 50px;">
                                <p>recuerde que al cancelar su asistencia, otra persona puede registrarse en esta </p><br>
                                <p> asistencia agotando posiblemente los cupos disponibles o las fechas de inscripción </p><br>
                                 <p>caducan, no podrá inscribirse de nuevo     </p>
                                	
                                    
                                    <a href="EliminarInscripcionEstudiante?<%=asistencias.get(i).getIdAsistencia()%>"class="btn btn-danger">Confirmar</a>
                                    
                                </div>
                            </div>
                            

                        </div>
                    </div>
                </div>
	
                    <%
                    
		}%>
                </table>
                
            </div>
            </section>
            
        </div>
    </div>




	  
	
	
	
	
	

	</div>
	
	</div>
	<br></br>
	
	<%
		}else{%>
<h4>Actualmente no tienes asistencias inscritas</h4>
<%
}



%>
		

    
    
 <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>