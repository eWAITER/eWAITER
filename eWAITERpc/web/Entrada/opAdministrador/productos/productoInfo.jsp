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
            rs = set.executeQuery("SELECT ID_Producto, Nombre, Imagen, Descripcion, Ingredientes, Precio FROM ewaiter.Producto WHERE ID_Producto = "+ID+";");
            while (rs.next()) {
                String idproducto = rs.getString("ID_Producto");
                String nombre = rs.getString("Nombre");
                String imagen = rs.getString("Imagen");
                String descripcion = rs.getString("Descripcion");
                String ingredientes = rs.getString("Ingredientes");
                String precio = rs.getString("Precio");                
           

    %> 


        <%

            if (session.getAttribute("nombreCliente") == null) {
                response.sendRedirect("../../index.html#NoTeHasLogeado");
                //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            } else {
                String nombreS = session.getAttribute("nombreCliente").toString();
                out.println(
                        "<span class='Pcabecera'>Hola usuario " + nombreS + " |<a href='../../../index.html'> Desconectar </a></span>");
            }


        %>
        <div class="zonaMenu">
            <table class="menu">
                <tr>
                    <td class="menuHomeOFF" onClick="location.href = '../../pcinicio.jsp'">
                        <image src="http://ewaiter.netau.net/fotos/logo/logo%20definitivo%2045x45.png" />
                    </td>
                    <td class="menuON" onClick="location.href = '../carta/carta.jsp'">
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
            <legend class="legeneWa"><%out.println(nombre);%></legend>
            <!--ZONA CONSULA-->
            
            <table class="tablaGeneralInfo">
                <tr>
                    <td rowspan="4" width="40%" height="40%">
                        <%
                        if (imagen != null) {
                            out.println("<img class='imgInfo' src='"+imagen+"'/>");
                        }else{
                            %>
                            <img class='imgInfo' src="../../../img/imgpred.png"/>
                        <%
                        }
                        %>
                    </td>
                    <td class="titulosInfo" colspan="2">Descripción</td>
                </tr>
                <tr>
                    <td width="60%" height="30%" colspan="2">
                        <div class="cajaScrollInfo" id="tabla">
                            <p><%out.println(descripcion);%></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="titulosInfo" colspan="2">Ingredientes</td>
                </tr>
                <tr>
                    <td width="60%" height="30%" colspan="2">
                         <div class="cajaScrollInfo" id="tabla">
                            <p><%out.println(ingredientes);%></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="Infolateral" id="nombreAlert"><%out.println(nombre);%></td>
                    <td rowspan="2" class="InfoBotones">
                        
                        <table class="infoEdit"> <!-- Edit -->
                            <tr>
                                <td><img class="infoImgEditarCarta" src="http://ewaiter.netau.net/fotos/botones/edit.png"></td>
                                <td class="txtInfoEdityDelete">Editar</td>
                            </tr>
                        </table>
                        
                    </td>
                    <td rowspan="2" class="InfoBotones">
                        
                        <table class="infoBorrar" onclick="abrir()"> <!-- Delete -->
                            <tr>
                                <td><img class="infoImgEliminarCarta" src="http://ewaiter.netau.net/fotos/botones/borrar.png"></td>
                                <td class="txtInfoEdityDelete">Borrar</td>
                            </tr>   
                        </table>
                        
                    </td>    
                        
                                                  
                    
                </tr>
                <tr>
                    <td class="Infolateral" colspan="2"><%out.println(precio+"€");%></td>
                    
                </tr>
            </table>
        </fieldset>
        
        
<%
        }
            con.close();
            set.close();
            rs.close();
        } catch (Exception e) {
            out.println("<p>Error inesperado, contacte con el administrador</p>");
        }
%>
    </body>
</html>
