<%-- 
    Document   : productoEdit
    Created on : 17-abr-2016, 18:50:12
    Author     : Adri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            
        String parametro = request.getParameter("parametrito");
        out.println("<option>" + parametro+ "</option>");
        
        %>
    </body>
</html>
