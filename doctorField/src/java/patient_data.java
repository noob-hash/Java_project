/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
public class patient_data extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    model m=new model();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        ArrayList<String> list=new ArrayList<>();
        ArrayList<String> id=new ArrayList<>();
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDateTime now=LocalDateTime.now();
        HttpSession session=request.getSession(false);
        if(session!=null){
            try{  
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root","");  
                //here sonoo is database name, root is username and password  
                Statement stmt=con.createStatement();
                ResultSet rs = stmt.executeQuery("Select * from patient_data");
                try(PrintWriter out=response.getWriter()){
                    out.print("<a href='logout'>log out</a>");
                    out.print("<h1>Patients name</h1><br/>");
                        while(rs.next()){
                            if(true){
                                id.add(rs.getString("patient_id"));
                                list.add(rs.getString("patient_name"));
                                //out.print("<a href='"+rs.getString("patient_no")+"'>"+rs.getString("patientName")+"</a>");
                            }else {
                                out.print("<p>No records Found</p>");
                            }
                        }
                        /*for(String c:list){
                            out.print("<a href='"+id.get(c)+"'>"+c+"</a>");
                        }*/
                        for(int i=0;i<list.size();i++) {
                            out.print("<a href='indivisual_data?id="+id.get(i)+"'>"+list.get(i)+"</a>");
                        }
                    out.close();
                }
                
                con.close();  
                    //response.sendRedirect("homePage.jsp");
            }catch(Exception e){ 
                System.out.println(e);
            } 
        }
        else{
            request.getRequestDispatcher("doctorPage.jsp").include(request, response);
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
