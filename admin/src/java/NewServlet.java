/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Subin
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

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
        String value=request.getParameter("button");
        System.out.println("value");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3307/hospital","root","");  
            //here sonoo is database name, root is username and password  
            Statement stmt=con.createStatement();
            if("add".equals(value)){
                response.sendRedirect("admin.jsp?action=add");
            } else if("log".equals(value)) {
                response.sendRedirect("admin.jsp?action=log");
            } else if("update".equals(value)){
                stmt.executeUpdate("update doctor set phone='"+request.getParameter("phone")+"' where doctor_id="+request.getParameter("Username"));
                stmt.executeUpdate("update doctor_login set password_hash='"+request.getParameter("password")+"' where doctor_id="+request.getParameter("Username"));
                con.close();
                response.sendRedirect("admin.jsp");
            } else if("delete".equals(value)){
                stmt.executeUpdate("delete from doctor where doctor_id ="+request.getParameter("Username"));
                con.close();
                response.sendRedirect("admin.jsp");
            } else if("list".equals(value)){
                response.sendRedirect("admin.jsp");
            } else if("save".equals(value)){
                stmt.executeUpdate("INSERT INTO doctor (doctor_id,doc_name,phone,department_id,qualification) VALUES ("+request.getParameter("Username")+",'"+request.getParameter("D_name")+"','"+request.getParameter("phone")+"',100,'"+request.getParameter("Qualification")+"')");
                stmt.executeUpdate("INSERT INTO doctor_login VALUES("+request.getParameter("Username")+",'"+request.getParameter("password")+"')");
                con.close();
                response.sendRedirect("admin.jsp");
            } else if("edit".equals(value)){
                response.sendRedirect("admin.jsp?action=edit");
            }
        }catch(Exception e){
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
