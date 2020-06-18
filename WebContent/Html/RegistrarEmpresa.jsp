<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
 
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" /> 
    

    <title>Registro de EmpresaEmpresa</title>
</head>

<body>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>

    <div class="container">
        <h2 class="text-center">Registro de Empresa</h2>


        <form action="${pageContext.request.contextPath}/RegistrarEmpresa" method="post">

            <div class="form-group container input-group" style="width: 60%">
                <label>Datos de la empresa</label>
                <p>_______________________________</p>
                <label>NIT <span class=""></span> </label>
                <input class="form-control" name="nit" type="text" maxlength="9" placeholder="NIT" required />
            </div>

            <div class="form-group container input-group" style="width: 60%">
                <label>Nombre <span class=""></span> </label>
                <input class="form-control" name="nombre" type="text" placeholder="Razón social de la empresa" required />
            </div>

			  <div class="form-group container input-group" style="width: 60%">
                <label>E-mail <span class="glyphicon glyphicon-envelope"></span> </label>
                
                <input type="email" name="correo" required>
        
            </div>

            <div class="form-group container input-group" style="width: 60%">
                <label>Teléfono <span class="glyphicon glyphicon-earphone"></span> </label>
                <input class="form-control" name="telefono" type="number" placeholder="Teléfono" required />
            </div>
  
             

            <div class="form-group container input-group" style="width: 60%">
                <label>Dirección <span class="glyphicon glyphicon-home"></span> </label>
                <input class="form-control" name="direccion" type="text" placeholder="Dirección de la empresa" required />

            </div>
            <div class="form-group container input-group" style="width: 60%"></div>
            <div class="form-group container input-group" style="width: 60%"></div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Datos de Contacto</label>
                <p>_______________________________</p>
            </div>

            <div class="form-group container input-group" style="width: 60%">
                <label>Tipo de documento</label>
                <select class="form-control" data-placeholder="- Seleccione Tipo -" name="tipoDocumento" id="" required>
                   
                    <option value="1">Cedula de ciudadania</option>
                    <option value="3">Cedula de extranjeria</option>
                    <option value="4">Pasaporte</option>
                </select>
            </div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Número de documento</label>
                <input class="form-control" name="documento" type="number" placeholder="Número de documento" required />
            </div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Nombres</label>
                <input class="form-control" name="nombres" type="text" placeholder="Nombres" required />
            </div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Primer apellido</label>
                <input class="form-control" name="apellido1" type="text" placeholder="Primer apellido" required />
            </div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Segundo apellido</label>
                <input class="form-control" name="apellido2" type="text" placeholder="Segundo apellido" required />
            </div>
              <div class="form-group container input-group" style="width: 50%">
                <label>Género<span class="glyphicon glyphicon-user"></span></label>

                 <select name="genero" id="genero"  data-placeholder="- Seleccione Genero -"> 

					<option value="1" >Masculino
					<option value="2">Femenino
					<option value="3">Otro
				 </select> 
			</div>
            <div class="form-group container input-group" style="width: 60%">
                <label>Tipo de Persona <span class="glyphicon glyphicon-user"></span></label>
                <select class="form-control" data-placeholder="- Seleccione Tipo -" name="tipoPersona" id="">
                    
                    <option value="0">Persona natural</option>
                    <option value="1">Persona juridica</option>
                </select>
            </div>



            <div class="form-group">
                <div class="col-xs-12" style="text-align: center">
                    <a class="btn btn-danger" href="#" onclick="history.back()">Volver</a>
                    <button type="submit" class="btn btn-danger">Registrar</button>
                </div>
            </div>

            <div class="form-group"><br><br><br></div>




        </form>
    </div><br>

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

</html>