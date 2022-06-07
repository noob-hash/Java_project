/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package userController;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Subin
 */
public class PatientAppoinment extends HttpServlet {

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
        
        String fullName = request.getParameter("First Name")+" "+request.getParameter("Last Name");
        String gender;
        String age = request.getParameter("Age");
        String phone = request.getParameter("Phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String department = request.getParameter("Department");
        String doctor = request.getParameter("Doctor");
        
        if("Male".equals(request.getParameter("Gender"))){
            gender = "M";
        } else {
            gender = "F";
        }
        System.out.println(phone);
        
        try{  
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root","");  
                //here sonoo is database name, root is username and password  
                Statement stmt=con.createStatement();
                
                String query = "INSERT INTO patient (patientName,gender,age,phone,appoinment_date,appoinment_time,department,doctor) values (?,?,ABS(?),?,?,?,?,?)";
                
                PreparedStatement statement = con.prepareStatement(query);
                
                statement.setString(1, fullName);

                statement.setString(2, gender);
                
                statement.setString(3, age);
                
                statement.setString(4, phone);
                
                statement.setString(5, date);
                
                statement.setString(6, time);
                
                statement.setString(7, department);
                
                statement.setString(8, doctor);
                
                statement.executeUpdate();
                
                con.close();
                
                response.sendRedirect("user_controller");
                
        }catch(IOException | ClassNotFoundException | SQLException e){ 
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
