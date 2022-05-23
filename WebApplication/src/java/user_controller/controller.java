/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package user_controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
public class controller extends HttpServlet {

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
            throws ServletException, IOException 
        {
        response.setContentType("text/html;charset=UTF-8");
        
        //date formatter
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        //gets current date
        LocalDateTime now=LocalDateTime.now();
        
        //apply date formatter and store it to today variable
        String today=dtf.format(now);
        
        
            //create arraylst to save,store get data from model to pass it to the jsp
            ArrayList<model> lst = new ArrayList<model>();
            ArrayList<model> list = new ArrayList<model>();

            //try catch for database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3307/hospital", "root", "");
                //Note I am using port 3307 for most people it is port 3306
                //here hospital is database name, root is username and password field is left empty
                Statement stmt = con.createStatement();
                
                ResultSet rs=stmt.executeQuery("Select * from doctor");
                while(rs.next()){
                    lst.add(new model("a",rs.getString("doc_name")));
                }
                request.setAttribute("doctor", lst);
                ResultSet rs1=stmt.executeQuery("Select * from department");
                while(rs1.next()){
                    list.add(new model(rs1.getString("dep_name")));
                }
               
                //set the attribute by which jsp can get the data
                request.setAttribute("department", list);
                
                request.getRequestDispatcher("homePage.jsp").include(request, response);
            }catch(ServletException | IOException | ClassNotFoundException | SQLException e){
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
