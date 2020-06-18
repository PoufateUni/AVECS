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

    <title>Registro de nuevas Materias</title>
</head>

<body>
<% 
List<Materia> materias =(List)request.getAttribute("materias");
%>
	

    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>

    <div class="container">
        <h2 class="text-center">Administración de materias</h2>
		<table border="" class="table table-striped table-bordered table-hover table-responsive"
                    style="scroll-behavior: auto;">
                    <tr>
                        <th>Codigo Materia</th>
                        <th>Nombre</th>                       
                        <th>Semestre de Materia</th>
                      
                        

                    </tr>
						<%for(int i=0; i<materias.size();i++){ %>
						<tr>
						<th><%=materias.get(i).getIdMateria() %></th>
						
						<th><%=materias.get(i).getNombre() %></th>
						<th><%=materias.get(i).getSemestre() %></th>
						 <th><a class="btn btn-danger " href="EliminarMateria?<%=materias.get(i).getIdMateria()%>" onclick="return confirmar()">Eliminar</a></th>
						
						</tr>
		<%} %>
		
		
		 

                </table>

        <form action="${pageContext.request.contextPath}/RegistrarMateria" method="post">
            <div id="global">
               
            </div>
            <div><br><br></div>
            <div class="container form-group  input-group">
                <div class="row">
                   
                </div>
            </div>
            
            <div><br><br><br></div>
				
				 <div class="container form-group  input-group ">
                <div class="row">
                	
			
                    <div class="col-xs-1 col-lg-0"></div>
                    <label class="col-xs-2 col-lg-0">semestre</label>
                    <input class="col-xs-2 col-lg-0" name="semestre"type="number" placeholder="7" min="0" max="12" required>
                   <div class="col-xs-1 col-lg-0"></div>
                    <label class="col-xs-2 ">Codigo de Materia</label>
                    <input class="col-xs-2" name="codigo"type="number" placeholder="ej 1166123"  required>
            </div><div class="col-xs-1 col-lg-0"></div>
                    <label class="col-xs-2 ">Nombre de Materia</label>
                    <input class="col-xs-2" name="nombre"type="text" placeholder= "ejemplo"  required>
            </div>
                 
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
	if(confirm('¿Estas seguro de eliminar esta materia?'))
		return true;
	else
		return false;
}
</script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>

</html>