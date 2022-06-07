package adminController;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
@WebServlet(urlPatterns = {"/controller"})
public class admin extends HttpServlet {

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
        
        //gets the session data from server
        HttpSession session = request.getSession(false);
        //check if the session is null or invalid
        
        if (session!=null && (session.getAttribute("allowLogin")=="true")) {

            //if session exists and is valid 
            //get the destination of user
            String destination = request.getParameter("to");
            //create arraylst to save,store get data from model to pass it to the jsp
            ArrayList<adminModel> lst = new ArrayList<adminModel>();
            
            //try catch for database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3307/hospital", "root", "");
                //Note I am using port 3307 for most people it is port 3306
                //here hospital is database name, root is username and password field is left empty
                Statement stmt = con.createStatement();

                //if user is navigating to audit
                if(destination == null || destination.equals("dashboard")){
                    
                    //select all doctor data fro database
                    ResultSet rs = stmt.executeQuery("select doctor.*,doctor_login.password_hash from doctor left outer join doctor_login on doctor.doctor_id=doctor_login.doctor_id;");
                    
                    while (rs.next()) {
                        //add the data to model
                        lst.add(new adminModel(Integer.parseInt(rs.getString("doctor_id")), rs.getString("doc_name"), rs.getString("phone"), rs.getString("qualification"), "orthopedics", rs.getString("password_hash")));
                    }
                    //set attribute for data
                    request.setAttribute("data", lst);

                    request.getRequestDispatcher("adminDashboard.jsp").include(request, response);
                    
                }else if("logout".equals(destination)){
                
                    //user wants to lofout
                    //invalidate the session first
                    session.invalidate();
                    
                    //send the user to login page
                    response.sendRedirect("Login");
                    
                }else if("search".equals(destination)){
                    
                    request.getRequestDispatcher("adminSearch.jsp").include(request, response);
                    
                }
                
            } catch (Exception e) {
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
