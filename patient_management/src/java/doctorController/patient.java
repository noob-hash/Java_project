/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package doctorController;

import java.io.IOException;
import java.io.PrintWriter;
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
public class patient extends HttpServlet {

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
            
            String value = request.getParameter("action");

            DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now=LocalDateTime.now();

            String today=dtf.format(now);
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root",""); 
                String query = null;

                //create arraylst to save,store get data from doctorModel to pass it to the jsp
                ArrayList<doctorModel> lst = new ArrayList<>();
                ArrayList<doctorModel> list = new ArrayList<>();




                PreparedStatement statement;

                switch(value){

                    case ("patient"):


                        String id = request.getParameter("identifiedBy");

                        //show patient record
                        //get total appoinment
                        query = "select count(patient_id) as total from patient_info natural join patient_data where patient_id=?;";

                        statement = con.prepareStatement(query);

                        statement.setString(1, id);

                        ResultSet rs = statement.executeQuery();

                        rs.next();
                        String total=rs.getString("total");
                        Statement stmt = con.createStatement();

                        if(total.equals("1")){   

                            //to display patient data
                            //save data into model
                            ResultSet rs2;
                            rs2 = stmt.executeQuery("select * from patient_data where patient_id='"+request.getParameter("identifiedBy")+"'; ");
                            rs2.next();
                            list.add(new doctorModel(Integer.parseInt(rs2.getString("patient_id")),rs2.getString("patient_name"),rs2.getString("gender"),Integer.parseInt(rs2.getString("age")),rs2.getString("patient_id"),rs2.getString("blood_group"),rs2.getString("allergy")));

                            //set the attribute by which jsp can get the data
                            request.setAttribute("patientInfo", list);

                            //redirect
                            request.getRequestDispatcher("AddData.jsp").include(request, response);
                        }else
                        {
                        //get upcomming appoinments
                        ResultSet rs1;
                        rs1 = stmt.executeQuery("select count(patient_id) as comming from patient_info natural join patient_data where patient_id='"+request.getParameter("identifiedBy")+"' and DateOfApp>'"+today+"'; ");
                        rs1.next();
                        String upcomming=rs1.getString("comming");
                        //get the nearest date from database
                        String date;
                        if(request.getParameter("date")==null){
                            ResultSet rs3;
                            rs3 = stmt.executeQuery("select max(DateOfApp) as max from patient_data natural join patient_info where patient_id='"+request.getParameter("identifiedBy")+"';");
                            rs3.next();
                            date=rs3.getString("max");
                        }else{
                            date=request.getParameter("date");
                        }

                        //get data from database and add all date to model
                        ResultSet da;
                        da = stmt.executeQuery("select  DateOfApp from patient_info natural join patient_data where patient_id='"+request.getParameter("identifiedBy")+"' order by DateOfApp desc;");
                        while(da.next()){
                            lst.add(new doctorModel(da.getString("DateOfApp")));
                        }

                        //set attribute for arrayset
                        request.setAttribute("date", lst);

                        //get data from database for corresponding date and add it to  model
                        ResultSet rs2;
                        rs2 = stmt.executeQuery("select * from patient_info natural join patient_data where patient_id='"+request.getParameter("identifiedBy")+"' and DateOfApp='"+date+"'; ");
                        rs2.next();
                            list.add(new doctorModel(Integer.parseInt(rs2.getString("patient_id")),rs2.getString("patient_name"),Integer.parseInt(total),Integer.parseInt(upcomming),rs2.getString("gender"),Integer.parseInt(rs2.getString("age")),rs2.getString("patient_id"),rs2.getString("blood_group"),rs2.getString("allergy"),Integer.parseInt(rs2.getString("height")),Integer.parseInt(rs2.getString("weight")),Integer.parseInt(rs2.getString("temperature")),Integer.parseInt(rs2.getString("pulse")),rs2.getString("Blood_pressure"),rs2.getString("diagnosis"),rs2.getString("treatment"),rs2.getString("medicines"),null,date));
                            //audit the access
                            stmt.executeUpdate("insert into audit values('"+today+"',' Patient "+ rs2.getString("patient_name")+" with id "+rs2.getString("patient_id")+" was accessed.');");

                        //set the attribute by which jsp can get the data
                        request.setAttribute("patientData", list);

                        //redirect
                        request.getRequestDispatcher("patient.jsp").include(request, response);
                        }
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
