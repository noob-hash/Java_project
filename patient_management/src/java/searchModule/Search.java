package searchModule;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import doctorController.doctorModel;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
public class Search extends HttpServlet {

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
        
        if(session!=null && session.getAttribute("allowLogin")=="true"){
            String search = request.getParameter("searchFor");
            

            String find = request.getParameter("search");
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root","");  
                //here sonoo is database name, root is username and password  
                Statement stmt=con.createStatement();

                String selected=search;

                String redirect = null;

                String query;
               PreparedStatement statement;
                ArrayList<searchModel> lst = new ArrayList<>();
                if(find == null || find==""){
                    System.out.println(selected);
                    if("Id".equals(selected) || "Department".equals(selected) || "doc_name".equals(selected)){

                        query = "select * from doctor;";
                        
                        ResultSet rs = stmt.executeQuery(query);
                        while(rs.next()){
                            lst.add(new searchModel(Integer.parseInt(rs.getString("doctor_id"))));
                        }
                        
                        //set the attribute by which jsp can get the data
                        request.setAttribute("list", lst);
                        
                        redirect ="adminSearch.jsp?selected="+search;

                    }else if("pId".equals(selected) || "pName".equals(selected)){

                        query = "select "+ search + "from patient_info;";
                        
                        redirect = "doctorSearch.jsp?selected="+search;

                    }
                } else {

                }


                request.getRequestDispatcher(redirect).include(request, response);

            }catch(ClassNotFoundException | SQLException e){

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
