<%-- 
    Document   : productoEdit
    Created on : 17-abr-2016, 18:50:12
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

        <form>
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
                                        <div class="colocInput"><input class="imputImg" type="file" name="foto"></div>
                                    </fieldset>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <fieldset class="fielseWa">
                                            <legend class="legeneWa">Precio</legend>
                                            <span>Coste:</span>
                                            <span>
                                                <input type="number" min="0" max="99999" step="0.01" <%out.println("value='"+precio+"'");%> name="precio"> €
                                            </span>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <td class="zonaDesBot">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <fieldset class="fielseWaEdit">
                                            <legend class="legeneWa">Nombre</legend>
                                            <input class="editNombre" type="text" name="nombre" maxlength="90" <%out.println("value='"+nombre+"'");%>>
                                        </fieldset>    
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <fieldset class="fielseWaEdit">
                                            <legend class="legeneWa">Descripción</legend>
                                        <textarea name="descripcion" class="editDescr"><%out.println(descripcion);%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>


            </fieldset>
        </form>
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
