<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="css/bootstrap.css" />

    <title>Visitas Empresariales</title>
</head>

<body>
 
    
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>
    <div class="container-fluid">
    
    <% 
    
    if(session.getAttribute("usuario")==null){
    	
    	%><nav style=" text-align: right;">
        <ul class="menu row">
            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-8"></div>
            <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/Login.html">Iniciar Sesión</a></li>
            <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/Registrarse.html">Registrarse</a></li>
            
        </ul>
    </nav>
    
    <%}else{
    	%>
    	<nav style=" text-align: right;">
        <ul class="menu row">
            <div class="col-xs-4 col-sm-6 col-md-8 col-lg-8"></div>
    	     <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href=""><%=session.getAttribute("nombre") %></a></li>
    	<% 
    	int tipo= (Integer)session.getAttribute("tipo_usu");
         if(tipo==0||tipo==2){
    
    %>
    
    
    <%	
    }else if(session.getAttribute("tipo_usu").equals(1)){
    	%>
    	 <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/SesionDocente.jsp">Crear Visita</a></li>
    	<%
    }else{
    	%>
   	 <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><a href="Html/RegistroVisitas.jsp">Administrar</a></li>
   	<%
    }
         %>
             <li class="col-xs-4 col-sm-3 col-md-2 col-lg-2"><form method="get" action="/avecs/IniciarSesion"><button type="submit">salir</button></form></li>
        </ul>
    </nav>
    </div><% 
    }
    %>
         


	
    <footer>
        <div>
            <p>Programa de ComunicaciÃ³n Social - Universidad Francisco de Paula Santander</p>
            <p>TelÃ©fono (057)(7) 5776655</p>
            <p>Correo electrÃ³nico:  oficinadeprensa@ufps.edu.co - oficinajuridica@ufps.edu.co</p>
        </div>
    </footer>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>