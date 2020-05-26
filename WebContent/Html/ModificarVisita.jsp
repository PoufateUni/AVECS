<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@page import="java.util.List"%>
    <%@page import="entidades.Grupo"%>
    <%@page import="entidades.Empresa"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 


    <title>Editar Visita</title>
</head>


<body>
<% List<Grupo> listaGrupos = (List)request.getAttribute("listaGrupos");
List<Empresa> listaEmpresa =(List)request.getAttribute("listaEmpresas");%>

    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>


    <div class="container">

        <h2 class="text-center">Modificando Visita</h2>
             <form action="EditarVisita" method="post">
			<div class="form-group container input-group" style="width: 50%">
                <label>Titulo de visita</label>
                <input type="hidden" name ="idVisita"value="${requestScope.idVisita }">
                <input class="form-control" required name="titulo" type="text" required placeholder="<c:out value="${requestScope.titulo}"/>"/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Descripcion</label>
                <input class="form-control" required name="descripcion" type="text" required placeholder="<c:out value="${requestScope.descripcion}"/>" />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Grupo</label>
                
                
                
                 <select name="grupo" id="grupo_id" required> 
				<option selected value="<c:out value="${requestScope.grupoId}"/>" > Anterior:<c:out value="${requestScope.grupoId}"/>- <c:out value="${requestScope.materia}"/>  <option>
					
					<%
					for(int i=0;i<listaGrupos.size();i++){
						%>
						<option value="<%=listaGrupos.get(i).getIdGrupo() %>"><%=listaGrupos.get(i).getMateria().getNombre() %>-<%=listaGrupos.get(i).getIdGrupo() %></option>
					<%	
					}
					
					%>

				   </select> 
        
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Empresa a la que visitará</label>
                 <select name="empresa" id="listaEmpresa"required> 
				
					<option selected value="<c:out value="${requestScope.empresaRut}"/>" > Anterior: <c:out value="${requestScope.empresaNombre}"/>  <option>
					<%
					for(int i=0;i<listaEmpresa.size();i++){
						%>
						<option value="<%=listaEmpresa.get(i).getRut()%>"><%=listaEmpresa.get(i).getNombreRazonSocial() %></option>
						
					<%	
					}
					
					%>

				   </select> 
				   </div>
				   
				  
				   
				   
            <div class="form-group container input-group" style="width: 50%">
                <label>Departamento</label>
                <select name="departamento" id="" class="form-control">
                    <option value="">Seleccionar Departamento</option>
                </select>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Municipio</label>
                <select name="municipio" id="" class="form-control">
                    <option value="66">Seleccionar Municipio</option>
                </select>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha Inicio</label>
                <input class="form-control" name="fechaInicio" type="date" placeholder="<c:out value="${requestScope.fechaIn}"/>" />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha fin</label>
                <input class="form-control" name="fechaFin"type="date"placeholder="<c:out value="${requestScope.fechaFinal}"/>"/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Cupo Maximo</label>
                <input class="form-control" name="cupos" type="number" required placeholder="número de cupos maximos Anteriores: ${requestScope.cupos}" />
            </div>
           


            <div class="form-group">
                <div class="col-xs-12" style="text-align: center;">
                    <a href="#" class="btn btn-danger" onclick="history.back()">Volver</a>
                    <button type="submit">Modificar</button>
                </div>
                <!--     <div class="modal fade" id="VF-DATOSENVIADOS">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;&nbsp
                            </button>
                            <h4 style="text-align: center;">Datos enviados</h4>
                        </div>
                    </div>
                </div> -->
                
          
            </div>

        </form>
        <div class="form-group"><br><br></div>
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
</body>

