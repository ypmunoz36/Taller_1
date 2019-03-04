<%-- 
    Document   : crear
    Created on : 4/02/2019, 07:05:47 PM
    Author     : sala8
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <div>
            <div>
                <h1>CONSULTA</h1>
            </div>
            <div>
                <form method="POST" action="/taller_1/ControladorConsultaPersona">
                <div>    
                    <label for="name">Identificación: </label>
                    <input type="text" name="identificacion" />
                </div>
                <div>
                    <label for="name">Nombre 1:</label>
                    <input type="text" name="nombre1" />
                </div>
                                    
                <div>
                    <label for="name">Apellido 1:</label>
                    <input type="text" name="apellido1" />
                </div>                
                    
                <div>

                    <input type="submit">
                </div>
            </div>
            </form>
            <a href="../index.html"> Volver</a>
            </div>
        </div>
    </body>
</html>
