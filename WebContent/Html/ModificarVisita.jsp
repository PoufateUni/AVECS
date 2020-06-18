<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@page import="java.util.List"%>
    <%@page import="entidades.Grupo"%>
    <%@page import="entidades.Empresa"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\component-chosen.css" /> 
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\component-chosen.min.css" /> 


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
				   
				  
				   
				   
           
                <label>Departamentos</label>
                <select name="departamento" id="Departamento" data-placeholder="- Seleccione Departamento -" class="form-control chosenDepartamento" onchange="change(this.id, 'mun')">
               
                 
<option value="5 " >ANTIOQUIA </option>
<option value="8 " >ATLÁNTICO </option>
<option value="11">BOGOTÁ, D.C. </option>
<option value="13">BOLÍVAR </option>
<option value="15">BOYACÁ </option>
<option value="17">CALDAS </option>
<option value="18">CAQUETÁ </option>
<option value="19">CAUCA </option>
<option value="20">CESAR </option>
<option value="23">CÓRDOBA </option>
<option value="25">CUNDINAMARCA </option>
<option value="27">CHOCÓ </option>
<option value="41">HUILA </option>
<option value="44">LA GUAJIRA </option>
<option value="47">MAGDALENA </option>
<option value="50">META </option>
<option value="52">NARIÑO </option>
<option value="54">NORTE DE SANTANDER </option>
<option value="63">QUINDIO </option>
<option value="66">RISARALDA </option>
<option value="68">SANTANDER </option>
<option value="70">SUCRE </option>
<option value="73">TOLIMA </option>
<option value="76">VALLE DEL CAUCA </option>
<option value="81">ARAUCA </option>
<option value="85">CASANARE </option>
<option value="86">PUTUMAYO </option>
<option value="88">ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA </option>
<option value="91">AMAZONAS </option>
<option value="94">GUAINÍA </option>
<option value="95">GUAVIARE </option>
<option value="97">VAUPÉS </option>
<option value="99">VICHADA </option>
                </select>

           
                <label>Municipio</label>
                  <select id="mun" name="municipio" data-placeholder="- Seleccione Municipio -" class="form-control chosenMunicipio">
      
      <option value=""></option>
      </select>
      
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
              <div class="form-group container input-group" style="width: 50%">
                <label>Cupo Maximo de estudiantes que pueden ser aprobados</label>
                <input class="form-control" name="cupos2" type="number" required placeholder="numero de cupos maximos aprobados anteriores: ${requestScope.cupos2}" />
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/js\municipios.js'></script>
  <script src="${pageContext.request.contextPath}/js\jquery-3.4.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js\chosen.jquery.js" type="text/javascript"></script>
     <script>
    //chosen institución
    $('.chosenDepartamento, .chosenMunicipio').chosen({ no_results_text: "No hay resultados...", allow_single_deselect: true });
    $(".chosenDepartamento").chosen().on("change", function (event) {
      document.getElementById('mun').value = "";
      $(".chosenMunicipio").trigger('chosen:updated');
    });
    $(".chosenMunicipio").chosen().on("chosen:showing_dropdown", function (event) {
      $(".chosenMunicipio").trigger('chosen:updated');
    });
  </script>
</body>

