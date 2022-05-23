package controller1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Subin
 */
public class controller extends HttpServlet {

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
        
        //check if the session is null or invalid
        
        if (session!=null && (session.getAttribute("allowLogin")=="true")) {
            
            //if session exists and is valid 
            //get the destination of user
            String destination = request.getParameter("to");
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
                //if user is navigating to audit
                if (destination!=null && destination.equals("dashboard")) {
                    //select the data from database
                    ResultSet rs = stmt.executeQuery("select * from patient where appoinment_date='"+today+"' order by appoinment_time");
                    while (rs.next()) {
                        //store all data into model through arraylist created above
                        lst.add(new model(Integer.parseInt(rs.getString("patient_no")),rs.getString("patientName"),rs.getString("appoinment_time"),rs.getString("phone")));
                    }
                    rs.close();
                    //set the attribute by which jsp can get the data
                    request.setAttribute("appoinments", list);
                    //set the attribute by which jsp can get the data
                    request.setAttribute("appoinmentToday", lst);
                    
                    //select all patient data fro database
                    ResultSet rs1 = stmt.executeQuery("select * from patient_data;");
                    while (rs1.next()) {
                        //add the data to model
                        list.add(new model(Integer.parseInt(rs1.getString("patient_id")),rs1.getString("patient_name"),rs1.getString("contact")));
                    }
                    
                    //set the attribute by which jsp can get the data
                    request.setAttribute("appoinments", list);
                    
                    //redirect
                    request.getRequestDispatcher("dashboard.jsp").include(request, response);
                } else if((request.getParameter("identifiedBy")!=null) && (!"newData".equals(request.getParameter("action"))) && (!"saveData".equals(request.getParameter("action"))) ){    
                    //show patient record
                    //get total appoinment
                    ResultSet rs = stmt.executeQuery("select count(patient_id) as total from patient_info natural join patient_data where contact='"+request.getParameter("identifiedBy")+"';");
                    rs.next();
                    String total=rs.getString("total");
                    System.out.println(total);
                    if(total.equals("1")){
                        //to display patient data
                        //save data into model
                        ResultSet rs2 = stmt.executeQuery("select * from patient_data where contact='"+request.getParameter("identifiedBy")+"'; ");
                        rs2.next();
                        list.add(new model(Integer.parseInt(rs2.getString("patient_id")),rs2.getString("patient_name"),rs2.getString("gender"),Integer.parseInt(rs2.getString("age")),rs2.getString("contact"),rs2.getString("blood_group"),rs2.getString("allergy")));

                        //set the attribute by which jsp can get the data
                        request.setAttribute("patientInfo", list);

                        //redirect
                        request.getRequestDispatcher("AddData.jsp").include(request, response);
                    }else
                    {
                    //get upcomming appoinments
                    ResultSet rs1 = stmt.executeQuery("select count(patient_id) as comming from patient_info natural join patient_data where contact='"+request.getParameter("identifiedBy")+"' and DateOfApp>'"+today+"'; ");
                    rs1.next();
                    String upcomming=rs1.getString("comming");
                    //get the nearest date from database
                    String date;
                    if(request.getParameter("date")==null){
                        ResultSet rs3 = stmt.executeQuery("select max(DateOfApp) as max from patient_data natural join patient_info where contact='"+request.getParameter("identifiedBy")+"';");
                        rs3.next();
                        date=rs3.getString("max");
                    }else{
                        date=request.getParameter("date");
                    }
                    
                    //get data from database and add all date to model
                    ResultSet da = stmt.executeQuery("select  DateOfApp from patient_info natural join patient_data where contact='"+request.getParameter("identifiedBy")+"' order by DateOfApp desc;");
                    while(da.next()){
                        lst.add(new model(da.getString("DateOfApp")));
                    }
                    
                    //set attribute for arrayset
                    request.setAttribute("date", lst);
                    
                    //get data from database for corresponding date and add it to  model
                    ResultSet rs2 = stmt.executeQuery("select * from patient_info natural join patient_data where contact='"+request.getParameter("identifiedBy")+"' and DateOfApp='"+date+"'; ");
                    rs2.next();
                        list.add(new model(Integer.parseInt(rs2.getString("patient_id")),rs2.getString("patient_name"),Integer.parseInt(total),Integer.parseInt(upcomming),rs2.getString("gender"),Integer.parseInt(rs2.getString("age")),rs2.getString("contact"),rs2.getString("blood_group"),rs2.getString("allergy"),Integer.parseInt(rs2.getString("height")),Integer.parseInt(rs2.getString("weight")),Integer.parseInt(rs2.getString("temperature")),Integer.parseInt(rs2.getString("pulse")),rs2.getString("Blood_pressure"),rs2.getString("diagnosis"),rs2.getString("treatment"),rs2.getString("medicines"),null,date));
                        //audit the access
                        stmt.executeUpdate("insert into audit values('"+today+"',' Patient "+ rs2.getString("patient_name")+" with id "+rs2.getString("patient_id")+" was accessed.');");
                    
                    //set the attribute by which jsp can get the data
                    request.setAttribute("patientData", list);
                    
                    //redirect
                    request.getRequestDispatcher("patient.jsp?identifiedBy="+request.getParameter("identifiedBy")).include(request, response);
                    }
                    
                } else if(request.getParameter("action").equals("newData")){
                    //to display patient data
                    //save data into model
                    ResultSet rs2 = stmt.executeQuery("select * from patient_data where contact='"+request.getParameter("identifiedBy")+"'; ");
                    rs2.next();
                    list.add(new model(Integer.parseInt(rs2.getString("patient_id")),rs2.getString("patient_name"),rs2.getString("gender"),Integer.parseInt(rs2.getString("age")),rs2.getString("contact"),rs2.getString("blood_group"),rs2.getString("allergy")));

                    //set the attribute by which jsp can get the data
                    request.setAttribute("patientInfo", list);
    
                    //redirect
                    request.getRequestDispatcher("AddData.jsp").include(request, response);
                    
                }else if(request.getParameter("action").equals("saveData")){
                    //to save patient record
                    //get id of patient asked to be saved
                    String id=request.getParameter("identifiedBy");
                    //get name and phone of corresponding patient
                    ResultSet rs=stmt.executeQuery("Select patient_name,contact from patient_data where patient_id="+id+";");
                    rs.next();
                        String patient=rs.getString("patient_name");
                        String phone=rs.getString("contact");
                        
                        
                    
                    //insert new data to database
                    stmt.executeUpdate("insert into patient_info values('"+id+"',(Select curdate())"+",'"+request.getParameter("height")+"','"+request.getParameter("weight")+"','"+request.getParameter("BP")+"','"+request.getParameter("temp")+"','"+request.getParameter("pulse")+"','"+request.getParameter("diagnosis")+"','"+request.getParameter("tp")+"','"+request.getParameter("presc")+"');");

                    //audit changes
                    stmt.executeUpdate("insert into audit values((Select curdate()),'New data for patient "+patient+" with id "+id+" was added');");
    
                    //redirect to patient page
                    response.sendRedirect("controller?identifiedBy="+phone);
                } else if(request.getParameter("action").equals("logoff")){
                    //in case doctor wants to log off
                    //audit the log off 
                    stmt.executeUpdate("insert into audit values((Select curdate()),'Doctor logged off.');");
                    
                    //user wants to lofout
                    //invalidate the session first
                    session.invalidate();
                    //send the user to login page
                    response.sendRedirect("index.html");
                }
            } catch (Exception e) {
                //error in database print the error to console
                System.out.println(e);
            }
        } else {
            //no session is maintained or is null thus send user to login page
            response.sendRedirect("index.html");
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
