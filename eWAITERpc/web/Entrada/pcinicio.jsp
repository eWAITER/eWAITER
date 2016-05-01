<%-- 
    Document   : pcinicio
    Created on : 12-mar-2016, 18:42:01
    Author     : Adri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eWAITER - Login</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="stylesheet" href="css/cmxform.css">
        <link href="./css/signin.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/messages_es.js"></script>
        <script type="text/javascript" src="./js/javascripto.js"></script>

    </head>
    <body onload="myFunction()">
     
        <%  
     
            if(session.getAttribute("nombreCliente") == null){
            response.sendRedirect("../index.html#NoTeHasLogeado");
            //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            }else{
                String nombre = session.getAttribute("nombreCliente").toString();
                out.println(""
                        + "<span class='pCabeceraBotonAtras'></span>"
                        + "<span class='Pcabecera'>Hola "+nombre+" |<a href='../index.html'> Desconectar </a></span>");
            }
                 
            
        %>
        
        
        <fieldset class="fielseWa">
            <legend class="legeneWa">Panel de administración</legend>
                    
            <table width="100%" height="80%"><!--esta tabla dibidirá en dos la parte de dentro para las dos secciones-->
                <tr>
                    <td width="50%"><!--primera parte la zonda de botones de administración-->
                            <!--botones de administracion-->
                        <fieldset class="fielseWa">
                            <legend class="legeneWa">Administrar:</legend>
                            
                            <table width="100%"><tr width="100%"><td align="center">
                            
                            <p><button class="Badmin" onclick="window.location.href='./opAdministrador/carta/carta.jsp'">Carta</button></p>
                            
                            <p class="PsepBotones"><button onclick="window.location.href='./opAdministrador/menu.jsp'" class="Badmin">Menús</button></p>
                            
                            <p class="PsepBotones"><button class="Badmin">Mesas</button></p>
                            
                            <p class="PsepBotones"><button class="Badmin">Camareros</button></p>
                            
                            <p class="PsepBotones"><button class="Badmin">Caja</button></p>
                            
                            </td></tr></table>
                            
                        </fieldset>
                    </td>
                    <td width="50%">
                            <!--graficos-->
                        <fieldset class="fielseWa">
                            <legend class="legeneWa">Administrar:</legend>
                            
                            <table width="100%" style="font-size:16px;">
                                <tr>
                                    <td width="50%">
                                        <ul>
                                            <li>Caja de ayer:</li> 
                                        </ul>
                                    </td>
                                    <td width="50%" align="right">
                                        null€
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td width="50%">
                                        <ul>
                                            <li>Caja de la semana pasada:</li> 
                                        </ul>
                                    </td>
                                    <td width="50%" align="right">
                                        null€
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td width="50%">
                                        <ul>
                                            <li>Caja del mes pasado:</li> 
                                        </ul>
                                    </td>
                                    <td width="50%" align="right">
                                        null€
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <!--aqui estarian los graficos-->
                                        <img src="../img/imgpred.png" alt="Smiley face" height="267" width="550">
                                    </td>
                                </tr>
                            </table>
                        </fieldset>   
                    </td> 
                </tr>   
            </table>         
        </fieldset><!-- fin fieldset principal-->
        <!--sponsore-->
        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
