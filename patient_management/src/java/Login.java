/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Subin
 */
public class Login extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Role = request.getParameter("Role");
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        if ( Username == null ) {
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else {

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3307/hospital", "root", "");
                //Note I am using port 3307 for most people it is port 3306
                //here hospital is database name, root is username and password field is left empty

                Statement stmt = con.createStatement();

                String query = null;
                
                if (Role.equals("Admin")) {
                    
                    query = "SELECT * FROM admin WHERE username = ? AND password_ = ? ;";
                    
                } else if (Role.equals("Doctor")) {
                    
                    query = "SELECT * FROM doctor_login NATURAL JOIN doctor WHERE doctor_id = ? AND password_hash = ? ;";
                    
                }

                PreparedStatement statement = con.prepareStatement(query);

                statement.setString(1, Username);

                statement.setString(2, Password);


                ResultSet rs = statement.executeQuery();

                //check if there is any data for selected search if true user succeded in login
                if (rs.next()) {

                    //get http session
                    HttpSession session = request.getSession();

                    //set the attribute to true so serer can verify if user is aloowed to perform any activities
                    session.setAttribute("allowLogin", "true");
                    
                    if (Role.equals("Admin")) {
                        
                        session.setAttribute("Username",rs.getString("username"));
                        
                        response.sendRedirect("admin");
                        
                    } else if (Role.equals("Doctor")) {
                        
                        //audit the login
                        stmt.executeUpdate("insert into audit values((Select curdate()),'Doctor " + rs.getString("doc_name") + " logged in.');");
                        
                        session.setAttribute("Username",rs.getString("doc_name"));
                                 
                        //redirect
                        response.sendRedirect("doctor?to=dashboard");
                        
                    }
                } else{
                    //redirect to login
                    request.getRequestDispatcher("login.jsp?error=err").include(request, response);
                }
            } catch (Exception e) {

                //error in database print to console
                System.out.println(e);
            }
        }
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
