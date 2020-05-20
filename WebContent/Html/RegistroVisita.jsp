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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


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
                <label>Grupo</label>
                 <select name="grupo" id="grupo_id"> 
					<option selected>Seleccione</option>
					
					<%
					for(int i=0;i<listaGrupos.size();i++){
						%>
						<option value="<%=listaGrupos.get(i).getIdGrupo() %>"><%=listaGrupos.get(i).getMateria().getNombre() %>- <%=listaGrupos.get(i).getIdGrupo() %></option>
						
					<%	
					}
					
					%>

				   </select> 
        
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Empresa a la que visitará</label>
                 <select name="empresa" id="listaEmpresa"> 
					<option selected>Seleccione</option>
					
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

