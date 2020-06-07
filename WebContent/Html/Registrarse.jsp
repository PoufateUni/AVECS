<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="entidades.Eps"%>
 <%@page import="modelo.EpsDao" %>
 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="../css/bootstrap.css" />


    <title>Registro</title>
</head>


<body>

<%   EpsDao epsDao = new EpsDao();
	List<Eps> epss=epsDao.getEm().createQuery("from Eps").getResultList();

    %>
    <header>
        <div class="container">
            <h2>AVECS</h2>
            <h4>aunque algunos campos no sean relevantes para su tipo de perfil (ejemplo fecha de nacimiento y eps para docentes), 
             puede escoger cualquiera de estos, no se guardarán, lamentamos las molestias </h4>
        </div>
    </header>
    <div class="container">
	
	
	
	
        <h2 class="text-center">Registrarse</h2>
        <form method="post" action="../registrarestudiante">
            <div class="form-group"><br></div>
                <div class="form-group container input-group" style="width: 50%">
                <label>Seleccionar tipo de usuario</label>
                <select class="form-control" name="tipoUsuario" id="">
                    <option value="0" selected>Estudiante</option>
                    <option value="1">Docente</option>
                    <option value="2">Empresa</option>
                    <option value="3">Administrador</option>
                </select>
            </div>
            
            <!-- -informaciÃ³n personal -->
            <div class="form-group container input-group" style="width: 50%">
                <label>Número de identificación <span class="glyphicon glyphicon-asterisk"></span></label>

                <input class="form-control" name="id"type="number" maxlength="10" placeholder="#"required>
                  <select name="tipoid" id="id"> 
                
					
					<option value="1" selected>Cedula de Ciudadaní­a
					<option value="2">Tarjeta De Identidad
					<option value="3">Cedula de Extranjeria
					<option value="4">Pasaporte
				   </select> 
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
                <label>Género<span class="glyphicon glyphicon-user"></span></label>

                 <select name="genero" id="genero"> 
                
					
					<option value="1" >Masculino
					<option value="2">Femenino
					<option value="3"selected>Otro
				 </select> 
			</div>
		<div class="form-group container input-group" style="width: 50%">
				 <label>Fecha de Nacimiento</label>
				  <input  name="fecha_nacimiento"type="date" maxlength="10" required>
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
                <label>Nombres</label>

                <input class="form-control" name="nombres"type="text" maxlength="45"required>
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
                <label>Primer Apellido</label>
                
                <input class="form-control" name="ap1"type="text" maxlength="45" required>
            </div>
              <div class="form-group container input-group" style="width: 50%">
                <label>Segundo Apellido</label>
                
                <input class="form-control" name="ap2" type="text" maxlength="45" required>
            </div>
            
            <div class="form-group container input-group" style="width: 50%">
                <label>E-mail <span class="glyphicon glyphicon-envelope"></span> </label>
                
                <input type="email" name="correo" pattern=".+@[uU][fF][pP][sS][.][eE][dD][uU][.][cC][oO]" title="Solo se permiten cuentas de ufps.edu.co" required>
        
            </div>


        
		
		
			
			   <div class="form-group container input-group" style="width: 50%">
                <label>Seleccionar Eps</label>
                 <select name="eps" id="lista_eps" required> 
					
					
					<%
					for(int i=0;i<epss.size();i++){
						%>
						<option value="<%=epss.get(i).getId() %>"><%=epss.get(i).getNombre()%></option>
					<%	
					}
					
					%>

				   </select> 
        
            </div>
		
			

            <div class="form-group container input-group" style="width: 50%">
                <label>Código<span class="glyphicon glyphicon-education" ></span></label>
		
                <input class="form-control" type="number" name="codigo" maxlength="7" placeholder="Codigo"required>
            </div>

            <div class="form-group container input-group" style="width: 50%">
                <label>Contraseñaa <span class="glyphicon glyphicon-lock"></span> </label>
                <input class="form-control" name="pass" type="password" placeholder="ContraseÃ±a" required/>
            </div>
            <div class="form-group">
                <div class="container-fluid" style="text-align: center;">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right">
                        <a class="btn btn-danger" onclick="history.back()">&nbsp&nbsp&nbspVolver&nbsp&nbsp&nbsp</a>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: left">
                        <button type="submit"class="btn btn-danger">Registrar</button>
                    </div>
                </div>
            </div>

            <div class="form-group"><br></div>

        </form>
    </div>

   

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>