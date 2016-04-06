<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eWAITER - Login</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/dashboard.css">
        <link rel="stylesheet" href="../css/cmxform.css">
        <link href="../css/signin.css" rel="stylesheet">
        <link href="../css/carta/carta.css" rel="stylesheet">
        <script type="text/javascript" src="./../js/javascripto.js"></script>
        <script type="text/javascript" src="../js/controlTamanoResultados.js"></script>
    </head>
    <body onload="controlTamano(this); myFunction()">
        
        
         <%  
     
            if(session.getAttribute("nombreCliente") == null){
            response.sendRedirect("../../index.html#NoTeHasLogeado");
            //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            }else{
                String nombre = session.getAttribute("nombreCliente").toString();
                out.println(""
                        + "<span class='pCabeceraBotonAtras'>boton</span>"
                        + "<span class='Pcabecera'>Hola usuario "+nombre+" |<a href='../../index.html'> Desconectar </a></span>");
            }
                 
            
        %>
        
        <fieldset class="fielseWa">
            <legend class="legeneWa">Carta</legend>
            <!--ZONA CONSULA-->
            <div class="zonaConsultaYCreacion">
                asdsadas
            </div>
            
            
            <!--ZONA VISUALIZACIÓN-->
            <div class="cajaScroll">
                <!-- Aqui se pregunta al servidor cuantas cartas tenermos y se muestran, en el ultimo puesto     border: 2px red solid;-->
                <!-- primero creo solo para ver-->
                <table class="tablaExistente">
                    <tr>
                        <td rowspan="2" class="cuerpoCarta">
                            
                            <table width="100%">
                                <tr>
                                    <td class="imgCarta">img</td>
                                    <td class="nombreCarta">nombre</td>
                                    <td class="precioCarta">19,99€</td>
                                </tr>
                            </table>                           
                            
                        </td>
                        <td class="editarCarta">b</td>
                    </tr>
                    <tr>
                        <td class="eliminarCarta">2</td>
                    </tr>
                </table>
                
                
                
                
                
                
                
                
                
                
                 <table class="tablaNueva">
                    <tr>
                        <td width="100%">+</td> 
                    </tr>
                </table>
                
            </div>
        </fieldset>
        <!--sponsore-->
        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
