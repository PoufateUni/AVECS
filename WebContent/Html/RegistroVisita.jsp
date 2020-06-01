<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="java.util.List"%>
    <%@page import="entidades.Grupo"%>
    <%@page import="entidades.Empresa"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 


    <title>Registrar Visita</title>
</head>


<body>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>

<%
List<Grupo> listaGrupos = (List)request.getAttribute("listaGrupos");
List<Empresa> listaEmpresa =(List)request.getAttribute("listaEmpresas");
%>

    <div class="container">

        <h2 class="text-center">Registrar Visita</h2>
        <form action="RegistrarVisita" method="post">
			<div class="form-group container input-group" style="width: 50%">
                <label>Titulo de visita</label>
                <input class="form-control" required name="titulo" type="text" required />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Descripcion</label>
                <input class="form-control" required name="descripcion" type="text" required />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Grupo</label>
                 <select name="grupo" id="grupo_id" required> 
					
					
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
                <input class="form-control" name="fechaInicio" type="date" />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha fin</label>
                <input class="form-control" name="fechaFin"type="date"/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Cupo Maximo</label>
                <input class="form-control" name="cupos" type="number" required placeholder="numero de cupos maximos" />
            </div>
           


            <div class="form-group">
                <div class="col-xs-12" style="text-align: center;">
                    <a href="#" class="btn btn-danger" onclick="history.back()">Volver</a>
                    <button type="submit">Enviar</button>
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

