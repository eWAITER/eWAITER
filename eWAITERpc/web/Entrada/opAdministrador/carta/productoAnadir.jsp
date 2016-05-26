<%-- 
    Document   : productoAnadir
    Created on : 22-may-2016, 20:47:55
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
        <script type="text/javascript" src="../../js/carta/controlTamanoResultados.js"></script>
        <script type="text/javascript" src="../../js/carta/Combos.js"></script>
        <script type="text/javascript" src="../../js/jquery-1.12.3.min.js"></script>
        <script type="text/javascript" src="../../js/carta/cartaControl.js"></script>
    </head>
    <body>
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

        <form action="../../../GuardarNuevoPlato" id="data" method="post">
            <fieldset class="fielseWa">
                <legend class="legeneWa">Nuevo plato</legend>

                <table class="tablaGeneralEdit"><!--tabla general que contiene todo-->
                    <tr class="zonaImgPre">
                        <td><!--img y precio-->
                            <table>
                                <tr>
                                    <td>
                                        <fieldset class="fielseWa">
                                            <legend class="legeneWa">Imagen</legend>
                                            <img class='imgInfoanadir' alt="PLATO" src="http://ewaiter.netau.net/fotos/carta/Heladodet%e9verde.png"/>
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
                                                <input type="number" min="0" max="99999" step="0.01" value="0.00" name="precio"> €
                                            </span>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <td class="zonaDesBot">

                            <div style="width: 100%">
                                <fieldset class="fielseWaEdit">
                                    <legend class="legeneWa">Nombre</legend>
                                    <input class="editNombre" type="text" name="nombre" maxlength="90" value="">
                                </fieldset>   
                            </div>

                            <div style="height: 30%;">
                                <fieldset class="fielseWaEditDescripcion">
                                    <legend class="legeneWa">Descripción</legend>
                                    <textarea name="descripcion" class="editDescr"></textarea>
                                </fieldset>
                            </div>

                            <div style="width: 100%">
                                <fieldset class="fielseWaEdit">
                                    <legend class="legeneWa">Ingredientes</legend>
                                    <input class="editNombre" type="text" name="descripcion" maxlength="90" value="">
                                </fieldset>   
                            </div>    

                            <div style="width: 100%">

                                <fieldset class="fielseWaEdit">
                                    <legend class="legeneWa">Categoría</legend>
                                    <table class="tablaCategoria">
                                        <tr>
                                            <td class="nombreCat">Cat.Principal</td>
                                            <td class="catCombo">
                                                <select name="CatPrin" onchange="comboSubCat()">
                                                    <option>Cat principal</option>
                                                    <%                                                        Connection con;
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
                                                                    + "SELECT Nombre FROM ewaiter.Categoria"
                                                            );
                                                            while (rs.next()) {
                                                                String NombreCP = rs.getString("Nombre");
                                                                out.println("<option>" + NombreCP + "</option>");
                                                            }
                                                        } catch (Exception e) {
                                                            out.println("<option>No se encuentran resultados</option>");
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td class="anadirSubCat"></td>
                                        </tr>
                                        <tr>
                                            <td class="nombreCat">Tipo</td>
                                            <td class="catCombo" id="subcat">
                                                <select name="CatSub">
                                                    <option>Subcategorias</option>
                                                    <%
                                                        try {
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                            con = DriverManager.getConnection(sURL, userName, password);
                                                            set = con.createStatement();
                                                            rs = set.executeQuery(""
                                                                    + "SELECT Nombre FROM ewaiter.Subcategoria"
                                                            );
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
                                                    %>     
                                                </select>
                                            </td>
                                            <td class="anadirSubCat">
                                                <button>añadir</button>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </div>
                            <div style="width: 100%; margin-top: 1%; margin-bottom: 1%;"><!--botnes-->
                                <span style="width: 50%; text-align: center;">
                                    <input class="btnGuardar" type="submit" value="Guardar">
                                </span>
                                <span style="width: 50%; text-align: center;">
                                    <input class="btnCancelar" type="submit" value="Cancelar" onclick="location.href = '../carta/carta.jsp'">
                                </span>
                            </div>
                        </td>
                    </tr>
                </table>


            </fieldset>
        </form>
    </body>
</html>
