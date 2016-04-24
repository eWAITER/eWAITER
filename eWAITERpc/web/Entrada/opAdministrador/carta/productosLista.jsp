<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //recojida de datos
    String CatPrin = request.getParameter("CatPrin");
    String CatSub = request.getParameter("CatSub");
    String buscador = request.getParameter("buscador");
    //si en el uscador recibimos un "" quiere decir que el usuario no ha introducido datos
    String Consulta = "";
    try {
    Connection con;
    Statement set;
    ResultSet rs;
    String sURL = "jdbc:mysql://db4free.net";
    String userName = "ewaiter";
    String password = "ewaiterroot100";

     //primera opcion, el usuario no cambia nada y ejecuta la busqueda   
    if(CatPrin.equals("Cat principal") && CatSub.equals("Subcategorias") && buscador.equals("")){
    Consulta = "SELECT Nombre, Imagen, Precio, ID_Producto FROM ewaiter.Producto";
    }
    //opcion que el usuario solo cambia la CatPrin
    if(!CatPrin.equals("Cat principal") && CatSub.equals("Subcategorias") && buscador.equals("")){
        Consulta = "SELECT p.Nombre, p.Imagen, p.Precio, p.ID_Producto FROM ewaiter.Producto p, ewaiter.Subcategoria s, ewaiter.Categoria c WHERE p.ID_Subcategoria = s.ID_Subcategoria AND c.ID_Categoria = s.ID_Categoria AND c.Nombre LIKE '%"+CatPrin+"%';";
    }
    //el usuario cambia la subcategoria
    if(!CatSub.equals("Subcategorias") && buscador.equals("")){
        Consulta = "SELECT Nombre, Imagen, Precio, ID_Producto FROM ewaiter.Producto WHERE ID_Subcategoria = (SELECT ID_Subcategoria FROM ewaiter.Subcategoria WHERE Nombre LIKE '"+CatSub+"');";
    }
    //el usuario solo busca
    if(CatPrin.equals("Cat principal") && CatSub.equals("Subcategorias") && !buscador.equals("")){
        Consulta = "";
    }

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(sURL, userName, password);
        set = con.createStatement();
        rs = set.executeQuery(Consulta);
        while (rs.next()) {
            String Nombre = rs.getString("Nombre");
            String Imagen = rs.getString("Imagen");
            String Precio = rs.getString("Precio");
            String id = rs.getString("ID_Producto");
%>
<table class="tablaExistente">
    <tr>
        <!--zona info del producto-->
        <td rowspan="2" class="cuerpoCarta" onclick="location.href = '../productos/productoInfo.jsp?<%out.print(id);%>'">

            <table width="100%">
                <tr>
                    <td class="imgCarta">
                        <%
                            if (Imagen != null) {
                                out.println("<img class='imagenEscupidera' src='" + Imagen + "'/>");
                            } else {
                                out.println("<a>img no disp</a>");
                            }
                        %>
                    </td>
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

        <td class="editarCarta">
            <img class="imgEditarCarta" src="http://ewaiter.netau.net/fotos/botones/edit.png">
        </td>
    </tr>
    <tr>
        <td class="eliminarCarta">
            <img class="imgEliminarCarta" src="http://ewaiter.netau.net/fotos/botones/borrar.png">
        </td>
    </tr>
</table>

<%
        }
    } catch (Exception e) {
        out.println("<p>No se encuentran resultados</p>");
    }
%>
<table class="tablaNueva">
    <tr>
        <td width="100%">+</td> 
    </tr>
</table>
<%
    
} catch (Exception e) {
}
















%>
