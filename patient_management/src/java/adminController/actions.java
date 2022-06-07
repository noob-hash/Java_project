/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package adminController;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

/**
 *
 * @author Subin
 */
public class actions extends HttpServlet {

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
        
        HttpSession session = request.getSession(false);
        
        if(session!=null && session.getAttribute("allowLogin") == "true"){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3307/hospital", "root", "");
                //Note I am using port 3307 for most people it is port 3306
                //here hospital is database name, root is username and password field is left empty
                Statement stmt = con.createStatement();
                String value=request.getParameter("button");
                
                switch(value){
                    case("save"):
                        
                        stmt.executeUpdate("Insert into doctor values('"+request.getParameter("Username")+"','"+request.getParameter("D_name")+"','"+request.getParameter("Phone")+"','"+request.getParameter("Qualification")+"','"+1000+"')");
                        stmt.executeUpdate("insert into doctor_login values('"+request.getParameter("Username")+"','"+request.getParameter("password")+"')");
                        response.sendRedirect("http://localhost:8080/patient_management/admin?to=dashboard");
                    break;
                    
                    case("delete"):
                        
                        stmt.executeUpdate("delete from doctor where doctor_id='"+request.getParameter("id")+"';");
                        response.sendRedirect("http://localhost:8080/patient_management/admin?to=dashboard");
                        break;
                        
                    case("edit"):

                        request.getRequestDispatcher("admin?to=dashboard").include(request, response);
                    break;
                    
                    case("update"):
                        
                        stmt.executeUpdate("update doctor set phone='"+request.getParameter("phone")+"',qualification='"+request.getParameter("Qualification")+"',department_id='"+1000+"' where doctor_id="+request.getParameter("id"));
                        stmt.executeUpdate("update doctor_login set password_hash='"+request.getParameter("password")+"'");
                        response.sendRedirect("http://localhost:8080/patient_management/admin?to=dashboard");
                    break;

                    case("cancel"):
                        
                        response.sendRedirect("http://localhost:8080/patient_management/admin?to=dashboard");
                    break;
                    
                    default:
                        
                    break;
                        
                }
                
            }catch(Exception e){
                System.out.println(e);
            }
            
        }else{
            
            //no session is maintained or is null thus send user to login page
            response.sendRedirect("Login");
            
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
