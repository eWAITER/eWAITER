<%-- 
    Document   : menus
    Created on : 25-abr-2016, 19:44:09
    Author     : Adri
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eWAITER - Menús</title>
        <link rel="icon" href="http://ewaiter.netau.net/fotos/logo/logo%20definitivo%2045x45.png">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" href="../../css/dashboard.css">
        <link rel="stylesheet" href="../../css/cmxform.css">
        <link href="../../css/signin.css" rel="stylesheet">
        <script type="text/javascript" src="../../js/jquery-1.12.3.min.js"></script>
        <!--propiedad ewaiter-->
        <link rel="stylesheet" href="../../css/menu/menubase.css">      
        <script type="text/javascript" src="../../js/menu/controlTamanoResultados.js"></script>
        <script type="text/javascript" src="../../js/javascripto.js"></script> 
    </head>
    <body onload="controlTamano(this); myFunction()"><!-- aqui se controla el tamaño de la pantalla para definir tamaños concretos y avisar al usuario en el caso que sea una resolución no optima -->
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
                    <td class="menuOFF" onClick="location.href = '../carta/carta.jsp'">
                        Carta
                    </td>
                    <td class="menuON" onClick="location.href = '../menus/menus.jsp'">
                        Menús
                    </td>
                    <td class="menuOFF" onClick="location.href = '../mesas/mesas.jsp'">
                        Mesas
                    </td>
                    <td class="menuOFF" onClick="location.href = '../camareros/camareros.jsp'">
                        Camareros
                    </td>
                    <td class="menuOFF" onClick="location.href = '../caja/caja.jsp'">
                        Caja
                    </td>
                </tr>
            </table>
        </div>
        <!--zona de seleccion-->
        <fieldset class="fielseWa">
            <legend class="legeneWa">Menús</legend>
            <div class="cajaScroll" id="tabla">

                <%
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
                        rs = set.executeQuery(""
                                + "SELECT ID_Menu, Nombre, Precio FROM ewaiter.Menu;"
                        );
                        while (rs.next()) {
                            String ID = rs.getString("ID_Menu");
                            String Nombre = rs.getString("Nombre");
                            String Precio = rs.getString("Precio");
                %>
                <table class="tablaExistente">
                    <tr>
                        <!--zona info del producto-->
                        <td rowspan="2" class="cuerpoCarta" onclick="location.href = 'menuInfo.jsp?<%out.print(ID);%>'">

                            <table width="100%">
                                <tr>
                                    <td class="nombreCarta" id="nombreProduc"><%out.println(Nombre);%>
                                        <div style="visibility: hidden">
                                            <form id="envio" method="post" >
                                                <a name="parametrito"></a><!-- esto nos sirve apra cojer el nombre para la variable de sesion y mandarlo a la siguiene pagina-->
                                            </form>
                                        </div>
                                    </td>
                                    <td class="precioCarta"><%out.println(Precio + "€");%></td>
                                </tr>
                            </table>

                        </td>
                        <!--FIN ZONA INFO PRODUCTO-->

                        <td class="editarCarta" onclick="location.href = 'productoEdit.jsp?<%out.print(ID);%>'">
                            <img class="imgEditarCarta" src="http://ewaiter.netau.net/fotos/botones/edit.png">
                        </td>
                    </tr>
                    <tr>
                        <td class="eliminarCarta" onclick="borrarPosCarta()()">
                            <img class="imgEliminarCarta" src="http://ewaiter.netau.net/fotos/botones/borrar.png">
                        </td>
                    </tr>
                </table>

                <%
                        }
                        con.close();
                        set.close();
                        rs.close();
                    } catch (Exception e) {
                        out.println("<p>No se encuentran resultados</p>");
                    }
                %>



                <!-- tabla final, para añadir-->
                <table class="tablaNueva">
                    <tr>
                        <td width="100%">+</td> 
                    </tr>
                </table>
            </div>
        </fieldset>
        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
