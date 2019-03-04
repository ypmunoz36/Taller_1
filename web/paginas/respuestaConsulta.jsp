<%-- 
    Document   : respuesta
    Created on : 4/02/2019, 07:33:56 PM
    Author     : sala8
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList lista =  (ArrayList) request.getAttribute("listaDatos");
            
            String result = "";
            for(int i = 0;i<lista.size() ;  i++){
                result= result+"<br/>"+lista.get(i)  ;
            }
        %>
        <h1>Ventas </h1>
        <h2> <%=result%> </h2>
        <a href="./index.html"> Volver</a>
    </body>
</html>
