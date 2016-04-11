<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<select>
    <option>Subcategorias</option>
    <%
        String parametro = request.getParameter("CatPrin");
        

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
                                            + "SELECT Nombre FROM ewaiter.Subcategoria WHERE ID_Categoria =(SELECT ID_Categoria FROM ewaiter.Categoria WHERE nombre like '"+ parametro+"' );"
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
