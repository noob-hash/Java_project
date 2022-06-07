package doctorController;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
public class doctor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //date formatter
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        //gets current date
        LocalDateTime now=LocalDateTime.now();
        
        //apply date formatter and store it to today variable
        String today=dtf.format(now);
        
        //gets the session data from server
        HttpSession session = request.getSession(false);
        
        String username;
        //check if the session is null or invalid
        
        if (session!=null && (session.getAttribute("allowLogin")=="true")) {
            
            //get username of user from session
            username = (String) session.getAttribute("Username");
            
            //get the destination user want to go
            String destination = request.getParameter("to");
            
            //create arraylst to save,store get data from doctorModel to pass it to the jsp
            ArrayList<doctorModel> lst = new ArrayList<>();
            ArrayList<doctorModel> list = new ArrayList<>();
            
            //try catch for database
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3307/hospital", "root", "");
                //Note I am using port 3307 for most people it is port 3306
                //here hospital is database name, root is username and password field is left empty
                Statement stmt = con.createStatement();
                
                //if user is navigating to audit
                if(destination != null && "dashboard".equals(destination)){
                    
                    //select the data from database
                    ResultSet rs = stmt.executeQuery("select * from patient where appoinment_date='"+today+"' and doctor = '"+username+"' order by appoinment_time");
                    
                    while (rs.next()) {
                        //store all data into doctorModel through arraylist created above
                        lst.add(new doctorModel(Integer.parseInt(rs.getString("patient_no")),rs.getString("patientName"),rs.getString("appoinment_time"),rs.getString("phone")));
                    }
                    rs.close();

                    //set the attribute by which jsp can get the data
                    request.setAttribute("appoinmentToday", lst);
                    
                    //select all patient data fro database
                    ResultSet rs1 = stmt.executeQuery("select * from patient_data;");
                    
                    while (rs1.next()) {
                        //add the data to doctorModel
                        list.add(new doctorModel(Integer.parseInt(rs1.getString("patient_id")),rs1.getString("patient_name"),rs1.getString("contact")));
                    }
                                        
                    //set the attribute by which jsp can get the data
                    request.setAttribute("appoinments", list);
                    
                    //redirect
                    request.getRequestDispatcher("doctorDashboard.jsp").include(request, response);
                    
                } else if("logout".equals(destination)) {
                    
                    //in case doctor wants to log off
                    //audit the action
                    stmt.executeUpdate("insert into audit values((Select curdate()),'Doctor "+username+" logged off.');");
                    
                    //user wants to lofout
                    //invalidate the session first
                    session.invalidate();
                    
                    //send the user to login page
                    response.sendRedirect("Login");
                    
                } else if("search".equals(destination)){

                    //redirect
                    request.getRequestDispatcher("doctorSearch.jsp").include(request, response);
                    
                }
                
            } catch (ServletException | IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
                //error in database print the error to console
                System.out.println(e);
            }
        } else {
            
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
