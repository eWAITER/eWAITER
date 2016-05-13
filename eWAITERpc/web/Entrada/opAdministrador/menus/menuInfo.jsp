<%-- 
    Document   : menuInfo
    Created on : 09-may-2016, 11:06:13
    Author     : Adri
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script type="text/javascript" src="../../js/menu/controlTamanoResultadosInfo.js"></script>
        <script type="text/javascript" src="../../js/javascripto.js"></script>                                                                                          
    </head>
    <body onload="controlTamanoInfo(this); myFunction()"><!-- aqui se controla el tamaño de la pantalla para definir tamaños concretos y avisar al usuario en el caso que sea una resolución no optima -->
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
                    <td class="menuON">
                        Menús
                    </td>
                    <td class="menuOFF" onClick="location.href = '../mesas/mesas.jsp'">
                        Mesas
                    </td>
                    <td class="menuOFF" onClick="location.href = '../camareros/camareros.jsp'">
                        Camareros
                    </td>
                    <td class="menuOFF" onClick="hola()"><!--  "location.href = '../caja/caja.jsp'" -->
                        Caja
                    </td>
                </tr>
            </table>
        </div>
        <!--zona de seleccion-->
        <fieldset class="fielseWa">
            <legend class="legeneWa">Nombre Menú</legend>
            <table style="width: 100%; height: 100%;">
                <tr><!--zpma nombre y botones-->
                    <td class="textoNombre">
                        nombre:
                    </td>
                    <td class="textoVarNombre">
                        varnombre
                    </td>
                    <td class="zonaBotonEditar">
                        <table class="infoEdit" onclick="location.href = 'productoEdit.jsp?+ID'">
                            <tr>
                                <td><img class="infoImgEditarCarta" src="http://ewaiter.netau.net/fotos/botones/edit.png"></td>
                                <td class="txtInfoEdityDelete">Editar</td>
                            </tr>
                        </table>
                    </td>
                    <td class="zonaBotonEliminar">
                        <table class="infoBorrar" onclick="abrir()"> <!-- Delete -->
                            <tr>
                                <td><img class="infoImgEliminarCarta" 
                                         src="http://ewaiter.netau.net/fotos/botones/borrar.png"></td>
                                <td class="txtInfoEdityDelete">Borrar</td>
                            </tr>   
                        </table>
                    </td>
                </tr>
                <tr><!--zona cajascroll-->
                    <td colspan="4">

                        <!------------------------------------------------------------------------------->

                        <div class="cajaScroll" id="tabla">
                            
                           <div class="seccionesMenu">
                                <table style="width: 100%; height: 100%;">
                                    <tr class="nombreSeccionTabla">
                                        <td>
                                            titulo
                                        </td>
                                    </tr>
                                    <tr class="zonaSeccionPlatos">
                                        <td>
                                            <div class="miniScrollPlatos">
                                                <!--ahora aqui estará otro bucle con los platos-->
                                                <div class="platoMiniTabla">
                                                    <span class="imgPlatoMiniTabla">
                                                        <img class="imgPlato" src="http://ewaiter.netau.net/fotos/carta/Ensaladacampesina.png">
                                                    </span>
                                                    <span class="nombrePlatoMiniTabla">
                                                        Comida buena
                                                    </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            

                            
                            
                            
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
                                            + "SELECT Nombre, Imagen, Precio, ID_Producto FROM ewaiter.Producto"
                                    );
                                    while (rs.next()) {
                                        String Nombre = rs.getString("Nombre");
                                        String Imagen = rs.getString("Imagen");
                                        String Precio = rs.getString("Precio");
                                        String id = rs.getString("ID_Producto");
                            %>
                           <!--tablas-->
                            <%
                                    }
                                    con.close();
                                    set.close();
                                    rs.close();
                                } catch (Exception e) {
                                    out.println("<p>No se encuentran resultados</p>");
                                }
                            %>

                        <!------------------------------------------------------------------------------->


                    </td>
                </tr>
                <tr><!--zona precio-->
                    <td colspan="3" class="textoPrecio">precio:</td>
                    <td class="textoVarPrecio">varprecio</td>
                </tr>
            </table>
        </fieldset>
        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
