<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%@page import="java.util.List"%>
    <%@page import="entidades.Materia"%>
    <%@page import="entidades.Grupo"%>
    <%@page import="entidades.Profesor"%>
<!DOCTYPE html>

<html lang="en">

<head>
	
	

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 

    <title>Registro de nuevos grupos</title>
</head>

<body>
<% List<Grupo> grupos = (List)request.getAttribute("grupos");
List<Materia> materias =(List)request.getAttribute("materias");
List<Profesor> profesores=(List)request.getAttribute("profesores");%>
 <jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>

    <div class="container">
        <h2 class="text-center">Administración de  grupos</h2>
		<table border="" class="table table-striped table-bordered table-hover table-responsive"
                    style="scroll-behavior: auto;">
                    <tr>
                        <th>Codigo grupo</th>
                        <th>Código materia y nombre</th>                       
                        <th>Semestre de Materia</th>
                        <th>Código y nombre de profesor a cargo</th>
                        <th>Año y periodo de grupo</th>
                        

                    </tr>
						<%for(int i=0; i<grupos.size();i++){ %>
						<tr>
						<th><%=grupos.get(i).getIdGrupo() %></th>
						
						<th><%=grupos.get(i).getMateria().getIdMateria() %>-<%=grupos.get(i).getMateria().getNombre() %></th>
						<th><%=grupos.get(i).getMateria().getSemestre() %></th>
						
							<%if(grupos.get(i).getProfesor()==null){ %>
							<th><strong>
								No hay profesor asignado
							</strong></th>
							
							<%}else{%>
							<th><%=grupos.get(i).getProfesor().getCodigoProfesor() %>-<%=grupos.get(i).getProfesor().getPersona().getNombre() %></th>
							<%} %>
							<th><%=grupos.get(i).getAnio() %> Periodo:<%=grupos.get(i).getPeriodo() %></th>
							<th><a class="btn btn-danger " href="EliminarGrupo?<%=grupos.get(i).getIdGrupo()%>" onclick="return confirmar()">Eliminar grupo</a></th>
						</tr>
		<%} %>
		
		
		 

                </table>

        <form action="${pageContext.request.contextPath}/RegistrarGrupo" method="post">
            <div id="global">
               
            </div>
            <div><br><br></div>
            <div class="container form-group  input-group">
                <div class="row">
                    <h4 class="col-xs-6 col-lg-2">Materia</h4>
                    <select name="materia" id="" class="form-control" >
                      <%if(materias.size()<1){%>
                      <option value="-1">no hay materias disponibles</option>
                      <% }else{%>

                      <%for(int i=0;i<materias.size();i++){ %>
                      	<option value="<%=materias.get(i).getIdMateria()%>"><%=materias.get(i).getNombre()%></option>
                      <%} %>
                       <%} %>
                    </select>
                </div>
            </div>
            
            <div><br><br><br></div>
				
				 <div class="container form-group  input-group ">
                <div class="row">
                	
			
                    <div class="col-xs-1 col-lg-0"></div>
                    <label class="col-xs-2 col-lg-1">Año</label>
                    <input class="col-xs-2 col-lg-1" name="anio"type="number" placeholder="${year}" min="1880" required>
                    <div class="col-xs-1 col-lg-2"></div>
                    <label class="col-xs-2 col-lg-1">Periodo</label>
                    <select name="periodo">
                    	<option value="1">Periodo 1 o A</option>
                    	<option value="2">Periodo 2 o B</option></select>
                </div>
            </div>
				
            <div class="container form-group  input-group">
                <div class="row">
                    <h4 class="col-xs-6 col-lg-2">Profesor</h4>
                    <select name="profesor" id="" class="form-control"  data-placeholder="- Seleccione profesor -">
                       
                        <%for(int i=0;i<profesores.size();i++){ %>
                      	<option value="<%=profesores.get(i).getPersona_id_Persona()%>"><%=profesores.get(i).getCodigoProfesor()%>-<%=profesores.get(i).getPersona().getNombre()%></option>
                      <%} %>
                       
                    </select>
                </div>
                <div class="col-xs-1 col-lg-0"></div>
                    <label class="col-xs-2 ">Codigo de Grupo</label>
                    <input class="col-xs-2" name="codigo"type="number" placeholder="ej 1166123"  required>
            </div>




            

            <div class="col-xs-0 col-lg-3"></div>
            <button id="registrar" type="submit" class="btn btn-danger col-xs-5 col-lg-2">Registrar</button>
            <div class="col-xs-2 col-lg-1"></div>
            <button class="btn btn-danger col-xs-5 col-lg-2">Volver</button>
            <div class="col-xs-0 col-lg-4"></div>
        </form>

    </div><br>

    <footer style="visibility: hidden;">
        <div>
            <p>Programa de Comunicación Social - Universidad Francisco de Paula Santander</p>
            <p>Teléfono (057)(7) 5776655</p>
            <p>Correo electrónico: oficinadeprensa@ufps.edu.co - oficinajuridica@ufps.edu.co</p>
        </div>
    </footer>
<script>
function confirmar()
{
	if(confirm('¿Estas seguro de eliminar este grupo?'))
		return true;
	else
		return false;
}
</script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>

</html>