/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Subin
 */                                  
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
    ValidateLogn v=new ValidateLogn();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        v.setId(request.getParameter("username"));
        v.setPassword(request.getParameter("password"));
        response.setContentType("text/html;charset=UTF-8");
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm");
        LocalDateTime now=LocalDateTime.now();
        String today=dtf.format(now);
        HttpSession session=request.getSession();
        try{  
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root","");  
                //here sonoo is database name, root is username and password  
                Statement stmt=con.createStatement();  
                ResultSet rs = stmt.executeQuery("Select * from doctor_login where doctor_id='"+v.getId()+"' AND password_hash='"+v.getPassword()+"'");
                if(rs.next() || "true".equals(session.getAttribute("sessionmaintioned"))){
                    session.setAttribute("sessionmaintioned", "true");
                    ResultSet d=stmt.executeQuery("select * from doctor where doctor_id="+v.getId());
                    d.next();
                    String doc_name=d.getString("doc_name");
                    stmt.execute("insert into audit values('"+today+"',' Doctor "+doc_name+" logged in.')");
                    response.sendRedirect("dashboard.jsp");
                }
                else{
                    response.sendRedirect("index.html");
                    session.setAttribute("sessionmaintioned", "false");
                    //error message required
                }
                con.close();  
                //response.sendRedirect("homePage.jsp");
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
