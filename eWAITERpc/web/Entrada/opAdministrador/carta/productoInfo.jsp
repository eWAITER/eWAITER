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
        <script type="text/javascript" src="../../js/javascripto.js"></script>
        <script type="text/javascript" src="../../js/controlTamanoResultados.js"></script>
        <script type="text/javascript" src="../../js/Combos.js"></script>
        <script type="text/javascript" src="../../js/jquery-1.12.3.min.js"></script>
        <script type="text/javascript" src="../../js/controlListas.js"></script> 
    </head>      
    <body onload="controlTamano(this); myFunction()">
        <%
            String ID = request.getQueryString();

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
                rs = set.executeQuery("SELECT p.ID_Producto, p.Nombre, p.Imagen, p.Descripcion, p.Ingredientes, p.Precio, s.Nombre, c.Nombre FROM ewaiter.Producto p, ewaiter.Subcategoria s, ewaiter.Categoria c WHERE p.ID_Producto = " + ID + " AND p.ID_Subcategoria = s.ID_Subcategoria AND s.ID_Categoria = c.ID_Categoria");
                while (rs.next()) {
                    String idproducto = rs.getString("p.ID_Producto");
                    String nombre = rs.getString("p.Nombre");
                    String imagen = rs.getString("p.Imagen");
                    String descripcion = rs.getString("p.Descripcion");
                    String ingredientes = rs.getString("p.Ingredientes");
                    String precio = rs.getString("p.Precio");
                    String subcategoria = rs.getString("s.Nombre");
                    String categoriaPrincipal = rs.getString("c.Nombre");

        %> 


        <%            if (session.getAttribute("nombreCliente") == null) {
                response.sendRedirect("../../index.html#NoTeHasLogeado");
                //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            } else {
                String nombreS = session.getAttribute("nombreCliente").toString();
                out.println(
                        "<span class='Pcabecera'>Hola " + nombreS + " |<a href='../../../index.html'> Desconectar </a></span>");
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
                    <td class="menuOFF" onClick="location.href = '../menus/menus.jsp'">
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

        <fieldset class="fielseWa">
            <legend class="legeneWa"><%out.println(nombre);%></legend>

            <table class="tablaGeneralEdit"><!--tabla general que contiene todo-->
                <tr class="zonaImgPre">
                    <td><!--img y precio-->
                        <table>
                            <tr>
                                <td>
                                    <fieldset class="fielseWa">
                                        <legend class="legeneWa">Imagen</legend>

                                        <%
                                            if (imagen != null) {
                                                out.println("<img class='imgEdit' src='" + imagen + "'/>");
                                            } else {
                                        %>
                                        <img class='imgInfo' src="../../../img/imgpred.png"/>
                                        <%
                                            }
                                        %>

                                    </fieldset>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <fieldset class="fielseWa">
                                        <legend class="legeneWa">Datos</legend>
                                        <p>Nombre: <%out.println(nombre);%></p>
                                        <p>Precio: <%out.println(precio);%>€</p>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    </td>

                    <td class="zonaDesBot">
                        <fieldset class="infoFieldseWaInfDesc">
                            <legend class="legeneWaEdit">Descripción</legend>
                            <div class="cajaScrollInfo">
                                <p class="editDescr"><%out.println(descripcion);%></p>
                            </div>
                        </fieldset>

                        <fieldset class="infoFieldseWaInfIng">
                            <legend class="legeneWaEdit">Ingredientes</legend>
                            <div class="cajaScrollInfoIng">
                                <p class="InfIng"><%out.println(ingredientes);%></p>
                            </div>
                        </fieldset>    


                        <div style="width: 100%">
                            <fieldset class="fielseWaEdit">
                                <legend class="legeneWa">Categoría</legend>
                                <span class="nombreCatInf">Cat.Principal: <%out.println(categoriaPrincipal);%></span>
                                <span class="nombreCatInf">SubCategoria : <%out.println(subcategoria);%></span>  
                            </fieldset>
                        </div>
                        <div style="width: 100%; margin-top: 1%; margin-bottom: 1%;"><!--botnes-->

                            <table>
                                <tr>
                                    <td>
                                        <table class="infoEdit" onclick="location.href = 'productoEdit.jsp?<%out.print(ID);%>'">
                                            <tr>
                                                <td><img class="infoImgEditarCarta" src="http://ewaiter.netau.net/fotos/botones/edit.png"></td>
                                                <td class="txtInfoEdityDelete">Editar</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="margin-left: 50px;">
                                        <table class="infoBorrar" onclick="abrir()"> <!-- Delete -->
                                            <tr>
                                                <td><img class="infoImgEliminarCarta" 
                                                         src="http://ewaiter.netau.net/fotos/botones/borrar.png"></td>
                                                <td class="txtInfoEdityDelete">Borrar</td>
                                            </tr>   
                                        </table>

                                    </td>
                                </tr>
                            </table>
                                            
                        </div>
                    </td>
                </tr>
            </table>


        </fieldset>

        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
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
