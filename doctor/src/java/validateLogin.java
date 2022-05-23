/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Subin
 */
@WebServlet(urlPatterns = {"/verifylogin"})
public class validateLogin extends HttpServlet {

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
        //try catch for database
        System.out.println("a");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3307/hospital","root","");  
            //Note I am using port 3307 for most people it is port 3306
            //here hospital is database name, root is username and password field is left empty
            
            Statement stmt=con.createStatement();
            
            //select the data form table admin where username and password match that passed by user
            ResultSet rs=stmt.executeQuery("Select * from doctor_login where doctor_id='"+request.getParameter("username")+"' AND password_hash='"+request.getParameter("password")+"'");

            //check if there is any data for selected search if true user succeded in login
            if(rs.next()){
                
                //get http session
                HttpSession session=request.getSession();
                
                //audit the login
                ResultSet ra=stmt.executeQuery("Select * from doctor where doctor_id="+request.getParameter("username")+";");
                ra.next();
                stmt.executeUpdate("insert into audit values((Select curdate()),'Doctor "+ra.getString("doc_name")+" logged in.');");
                
                //set the attribute to true so serer can verify if user is aloowed to perform any activities
                session.setAttribute("allowLogin", "true");
                
                //redirect to dashboard
                response.sendRedirect("controller?to=dashboard");
            }
            else{
                
                //username, password is wrong
                try{
                    Thread.sleep(500);
                    request.getRequestDispatcher("index.html?error=error").include(request, response);
                }catch(Exception e){
                    System.out.println(e);
                }
            }
        }catch(Exception e){
            
            //error in database print to console
            System.out.println(e);
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
