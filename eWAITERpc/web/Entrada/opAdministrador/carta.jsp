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
        <script type="text/javascript" src="./../js/javascripto.js"></script>
    </head>
    <body onload="myFunction()">
        <p class="Pcabecera">Hola usuario %variable% | <a href="../../index.html">Desconectar</a></p>
        
        <fieldset class="fielseWa">
            <legend class="legeneWa">Cartas</legend>
            
            <div class="cajaScroll">
                <!-- Aqui se pregunta al servidor cuantas cartas tenermos y se muestran, en el ultimo puesto     border: 2px red solid;
    border-radius: 10px;
	  class="tdexistente" -->
                <!-- primero creo solo para ver-->
                <table class="tablaExistente">
                    <tr>
                        <td rowspan="2" width="85%">MENU 1 </td>
                        <td rowspan="2" width="10%">19,99€</td>
                        <td width="5%" >b</td>
                    </tr>
                    <tr>
                        <td width="5%">2</td>
                    </tr>
                </table>
                
                
                 <table class="tablaNueva">
                    <tr>
                        <td width="100%" class="masTablaNueva">+</td> 
                    </tr>
                </table>
                
            </div>
        </fieldset>
        <!--sponsore-->
        <p class="publi">Restaurante %Null% - eWaiter v0.9 2016</p>
        <script src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
