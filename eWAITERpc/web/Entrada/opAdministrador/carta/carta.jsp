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
    </head>
    <body onload="controlTamano(this); myFunction()">
        
        
         <%  
     
            if(session.getAttribute("nombreCliente") == null){
            response.sendRedirect("../../index.html#NoTeHasLogeado");
            //out.println("<p class='Pcabecera'> Hola usuario "+nombre+" |<a href='../index.html'> Desconectar </a></p>");
            }else{
                String nombre = session.getAttribute("nombreCliente").toString();
                out.println(
                "<span class='Pcabecera'>Hola usuario "+nombre+" |<a href='../../../index.html'> Desconectar </a></span>");
            }
                 
            
        %>
            <div class="zonaMenu">
                <table class="menu">
                    <tr>
                        <td class="menuHomeOFF">
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
            <div class="zonaConsultaYCreacion">
                <form id="data" method="post">  <!--control para el combobox-->
                <table width="100%">
                    <tr>
                        <td class="filtros">
                            <div class="spanGeneralFiltro"><!--general-->
                                <span>Filtrar por: </span>
                                <span class="seleccionPrimerLvl"><!--desplegable de primer nivel-->
                                    <select name="CatPrin" onchange="comboSubCat()">
                                        <option>Cat principal</option>     
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
                                            + "SELECT Nombre FROM ewaiter.Categoria"
                                                            );
                                    while (rs.next()) {
                                        String Nombre = rs.getString("Nombre");
                                        out.println("<option>"+ Nombre +"</option>");
                                    }
                                    con.close();
                                    set.close();
                                    rs.close();
                                } catch (Exception e) {
                                    out.println("<option>No se encuentran resultados</option>");
                                }
                            %>    
                                    </select>
                                </span>
                                <span>y </span>
                                <span class="seleccionSegundoLvl" id="subcat">
                                    <select>
                                        <option>Subcategorias</option>
                                    </select>
                                </span>
                                <span class="SpabotonAplicar"><button>Aplicar</button></span>
                            </div>
                        </td>
                        <td class="buscar">
                            <input class="buscador"  placeholder="Buscar" />
                             <input type="image" src="http://ewaiter.netau.net/fotos/botones/buscar.png" class="clickBuscar">
                        </td>
                    </tr>
                    <tr>
                        <td class="crear">
                            <button class="AnadirProd">Añadir nuevo producto</button>
                        </td>
                        <td class="gestionSubcat">
                            <button class="AnadirProd">Gestionar subcategorías</button>
                        </td>
                    </tr>                    
                </table>
                </form><!--fin del control del combo-->
                
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
