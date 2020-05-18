<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="../css/bootstrap.css" />

    <title>Registrar Visita</title>
</head>

<body>
    <header>
        <div class="container">
            <h2>AVECS</h2>
        </div>
    </header>


    <div class="container">

        <h2 class="text-center">Registrar Visita</h2>
        <form action="">

            <div class="form-group container input-group" style="width: 50%">
                <label>Asignatura required</label>
                <input class="form-control" type="text" placeholder="" />
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>CÃ³digo Asignatura required</label>
                <input class="form-control" maxlength="7" type="text" placeholder=""/>
            </div>
         
            <div class="form-group container input-group" style="width: 50%">
                <label>Cantidad de estudiantes que asistirÃ¡n</label>
                <input class="form-control" type="number" required placeholder="Valor numÃ©rico" required/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Dirección de la visita </label>
                <input class="form-control" type="email" required/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Departamento</label>
                <select name="" id="" class="form-control">
                    <option value="">Seleccionar Departamento</option>
                </select>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Municipio</label>
                <select name="" id="" class="form-control">
                    <option value="">Seleccionar Municipio</option>
                </select>
            </div>
            
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha Inicio</label>
                <input class="form-control" type="date" required/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>Fecha fin</label>
                <input class="form-control" type="date"required/>
            </div>
            <div class="form-group container input-group" style="width: 50%">
                <label>DuraciÃ³n</label>
                <input class="form-control" type="number" placeholder="En dÃ­as"required />
            </div>


            <div class="form-group">
                <div class="col-xs-12" style="text-align: center;">
                    <a href="#" class="btn btn-danger" onclick="history.back()">Volver</a>
                    <a href="#VF-DATOSENVIADOS" class="btn btn-danger" data-toggle="modal"> Enviar</a>
                </div>
                <div class="modal fade" id="VF-DATOSENVIADOS">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;&nbsp
                            </button>
                            <h4 style="text-align: center;">Datos enviados</h4>
                        </div>
                    </div>
                </div>
            </div>

        </form>
        <div class="form-group"><br><br></div>
    </div>

    <footer style="visibility: hidden;">
        <div>
            <p>Programa de ComunicaciÃ³n Social - Universidad Francisco de Paula Santander</p>
            <p>TelÃ©fono (057)(7) 5776655</p>
            <p>Correo electrÃ³nico: oficinadeprensa@ufps.edu.co - oficinajuridica@ufps.edu.co</p>
        </div>
    </footer>

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</body>

</html>