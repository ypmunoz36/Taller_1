<%-- 
    Document   : respuesta
    Created on : 4/02/2019, 07:33:56 PM
    Author     : sala8
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String miNombre =  (String) request.getAttribute("parametroservlet");
        %>
        <h1>Vengo de la servlet.....<%=miNombre%></h1>
        <a href="./index.html"> Volver</a>
    </body>
</html>
