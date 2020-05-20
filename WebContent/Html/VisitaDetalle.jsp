<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <title>Detalles de Visita</title>
</head>


<body>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>


    <div class="container">

        <h2 class="text-center">Visita Detallada</h2>
        <form action="RegistrarVisita" method="post">
			
			 <div class="form-group container input-group" style="width: 50%">
                <label>Titulo=</label>
                 <p><c:out value="${requestScope.titulo}"/></p>
        	
            </div>
			
			 <div class="form-group container input-group" style="width: 50%">
                <label>Descripcion=</label>
                 <p><c:out value="${requestScope.descripcion}"/></p>
        
            </div>
			
            <div class="form-group container input-group" style="width: 50%">
                <label>Grupo=</label>
                 <p><c:out value="${requestScope.grupo}"/></p>
        
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Nombre de la materia=</label>
               <p><c:out value="${requestScope.materia}"></c:out></p>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Docente</label>
              <p><c:out value="${requestScope.docente}"></c:out> codigo:<c:out value="${requestScope.docenteId}"></c:out></p>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Empresa que se visitará= <a href="DetallarEmpresa?<c:out value="${requestScope.empresaId}"></c:out>"><c:out value="${requestScope.empresa}"></c:out></a></label>
                <br>
                <p> direccion: <c:out value="${requestScope.empresaDireccion}"></c:out> </p>
                
				   </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Departamento= </label>
               <p><c:out value="${requestScope.departamento}"></c:out></p>
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
             <label>Municipio= </label>
               <p><c:out value="${requestScope.municipio}"></c:out></p>
          
            </div>
           
            <div class="form-group container input-group" style="width: 50%">
             <label>Fecha Inicio=</label>
               <p><c:out value="${requestScope.fechaIn}"></c:out></p>
             </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha fin= </label>
                <p><c:out value="${requestScope.fechaFinal}"></c:out></p>
                </div>
           
            <div class="form-group container input-group" style="width: 50%">
                <label>Duración(días)= </label>
                <p><c:out value="${requestScope.duracion}"></c:out></p>
                </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Cupos Disponibles=</label>
                <p><c:out value="${requestScope.cupos}"></c:out></p>
                </div>
           


            <div class="form-group">
                <div class="col-xs-12" style="text-align: center;">
                    <a href="/index.html" class="btn btn-danger" >Volver</a>
                   
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

