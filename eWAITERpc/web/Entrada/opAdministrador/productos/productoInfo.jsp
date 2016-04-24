<%-- 
    Document   : productoInfo
    Created on : 17-abr-2016, 18:50:30
    Author     : Adri
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eWAITER - Carta</title>
        <link rel="icon" href="http://ewaiter.netau.net/fotos/logo/logo%20definitivo%2045x45.png">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" href="../../css/dashboard.css">
        <link rel="stylesheet" href="../../css/cmxform.css">
        <link href="../../css/signin.css" rel="stylesheet">
        <link href="../../css/carta/carta.css" rel="stylesheet">
        <script type="text/javascript" src="./../../js/javascripto.js"></script>
        <script type="text/javascript" src="../../js/controlTamanoResultados.js"></script>
        <script type="text/javascript" src="../../js/Combos.js"></script>
        <script type="text/javascript" src="../../js/jquery-1.12.3.min.js"></script>
        <script type="text/javascript" src="../../js/controlListas.js"></script> 
    </head>      
    <body onload="controlTamano(this); myFunction()">
        <%
    String ID =  request.getQueryString();    
//SELECT * FROM ewaiter.Producto WHERE ID_Producto = " + tu_ID
/*
        Connection con;
        Statement set;
        ResultSet rs;
        String sURL = "jdbc:mysql://db4free.net";
        String userName = "ewaiter";
        String password = "ewaiterroot100";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(sURL, userName, password);
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM ewaiter.Producto WHERE ID_Producto = "+ID+";");
            while (rs.next()) {
                String Nombre = rs.getString("Nombre");
                out.println("<option>" + Nombre + "</option>");
            }
            con.close();
            set.close();
            rs.close();
        } catch (Exception e) {
            out.println("<option>No se encuentran resultados</option>");
        }
*/
    %> 


        <%

            if (session.getAttribute("nombreCliente") == null) {
                response.sendRedirect("../../index.html#NoTeHasLogeado");
                //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            } else {
                String nombre = session.getAttribute("nombreCliente").toString();
                out.println(
                        "<span class='Pcabecera'>Hola usuario " + nombre + " |<a href='../../../index.html'> Desconectar </a></span>");
            }


        %>
        <div class="zonaMenu">
            <table class="menu">
                <tr>
                    <td class="menuHomeOFF" onClick="location.href = '../../pcinicio.jsp'">
                        <image src="http://ewaiter.netau.net/fotos/logo/logo%20definitivo%2045x45.png" />
                    </td>
                    <td class="menuON">
                        Carta
                    </td>
                    <td class="menuOFF">
                        Menús
                    </td>
                    <td class="menuOFF">
                        Mesas
                    </td>
                    <td class="menuOFF">
                        Camareros
                    </td>
                    <td class="menuOFF">
                        Caja
                    </td>
                </tr>
            </table>
        </div>


        <fieldset class="fielseWa">
            <legend class="legeneWa">Carta</legend>
            <!--ZONA CONSULA-->
        </fieldset>
        
        
        
    </body>
</html>
