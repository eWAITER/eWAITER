/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.security.MessageDigest;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Peter
 */
@WebServlet(urlPatterns={"/loginJV"})
public class loginJV extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    String cad;
    String pas;
    
    @Override
    public void init(ServletConfig cfg) throws ServletException {//esto es la conexion
        String sURL="jdbc:mysql://db4free.net";
        //String sURL="jdbc:mysql://localhost/a7416073_ewaiter";
        super.init(cfg);
        //String userName = "root";
        //String password = "";
        String userName = "ewaiter";
        String password = "ewaiterroot100";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(sURL, userName, password);
            System.out.println("Se ha conectado");
        } catch(Exception e) {
            System.out.println("No se ha conectado");
        }
    }    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {//todo lo que hago con java
        // Obtener la sesion
        HttpSession s = request.getSession(true);
        // Guardar el nombre del cliente en la sesión
        // para poderlo utilizar en el siguiente servlet
        String nombre = (String) request.getParameter("nombre");
        s.setAttribute("nombreCliente", nombre);
        String passNO = (String) request.getParameter("passw");
        boolean existe=false;

        //cifro la pass
        String pass = sha256(passNO);
        ////////////////
        
        
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM ewaiter.Usuario");
            while (rs.next()) {
                cad = rs.getString("Nombre");
                cad = cad.trim();
                pas = rs.getString("Password");
                if (cad.compareTo(nombre) == 0) {
                   //compuerbo contraseña
                    if(pas.compareTo(pass)== 0 ){
                        existe = true;
                    }  
                }
            }
            
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No lee de la tabla");
        }

        try {
            set = con.createStatement();
            if (existe) {
               response.sendRedirect(response.encodeRedirectURL("./Entrada/pcinicio.jsp"));
            }else{
                response.sendRedirect(response.encodeRedirectURL("./index.html%Err"));
            }
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta ni modifica la tabla");
        }
        // Llamada al servlet que nos visualiza
        // las estadísticas de jugadores
        
    }

    
     public static String sha256(String base) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

        return hexString.toString();
        } catch(Exception ex){
           throw new RuntimeException(ex);
        }
    }
    
public static String getName(HttpServletRequest request){
    String nombre = (String) request.getParameter("nombre"); ;
    return nombre;
}
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
