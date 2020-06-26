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
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
    <title>Sesión Docente</title>
</head>

<body>
<%
SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
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
                <div class="col-xs-8 col-sm-8 col-md-9 col-lg-10"><a onclick="history.back()">VOLVER</a></div>
               <li class="col-xs-4 col-sm-3 col-md-2 col-lg-1"><form method="get" action="/avecs/IniciarSesion"><button type="submit">salir</button></form></li>
            </ul>
        </nav>
        <br>
    </div>

    <div class="container">
        <div class="row">
            <a href="${pageContext.request.contextPath}/RegistrarVisita" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nueva Visita</a>
            <a href="${pageContext.request.contextPath}/Html/RegistrarEmpresa.jsp" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nueva Empresa</a>
             <a href="${pageContext.request.contextPath}/RegistrarGrupo" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nuevo Grupo</a>
             <a href="${pageContext.request.contextPath}/RegistrarMateria" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Registrar Nuevo Materia</a>
              <a href="#" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Listado Estudiantes Inscritos para verificar</a>
            <a href="${pageContext.request.contextPath}/Html/SubirArchivo.jsp" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Subir Documentos</a>
             <a href="${pageContext.request.contextPath}/ListarEmpresas" class="btn btn-danger col-xs-5 col-sm-3 col-md-2 col-lg-2" style="margin: 0 10px;">Gestionar Documentos</a>
        </div>
    </div>

    
       
      <div class="catalogo" >
<%
if(visitas.size()>0){

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
                     <th><a href="DetallarVisitaAdmin?<%=visitas.get(i).getIdVisita() %>">Ver más</a></th>
                     <th><a href="EditarVisita?<%=visitas.get(i).getIdVisita()%>">Editar</a></th>
                    
                     <th><a href="EliminarVisita?<%=visitas.get(i).getIdVisita()%>" onclick="return confirmar()">Eliminar Visita</a></th>
					

                     </tr>
	
                    <%
                    
		}%>
                </table>
                
            </div>
            </section>
            
        </div>
    </div>
		<%
		}else{%>
<h4>Actualmente no tiene visistas asignadas</h4>
<%
}
%>
		
	
	
	</div>
	
       
       

<script>
function confirmar()
{
	if(confirm('¿Estas seguro de eliminar esta visita?'))
		return true;
	else
		return false;
}
</script>
    
 <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>