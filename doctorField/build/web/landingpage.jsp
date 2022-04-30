<%-- 
    Document   : landingpage
    Created on : Mar 2, 2022, 10:05:31 PM
    Author     : Subin
--%>
<%@page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDateTime now=LocalDateTime.now();
%>
<%String today=dtf.format(now);%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patients</title>
        <style>
            *{
                margin: 0 10px;
                padding: 0;
            }
            .patient{
                background: lightgreen;
            }
            a{
                text-decoration: none;
                color: black;
            }
            section{
                display: flex;
                justify-content: space-between
            }
            .flex{
                display: flex;
                flex-direction: column;
                width: 50vw;
                border: 2px solid black;
                border-radius: 30px;
                min-height: 40vh;
            }
            .second{
                width: 25vw;
            }
            #patient_data{
                display: flex;
            }

        </style>
    </head>
    <body>
        <h1>Welcome doctor</h1>
        <section id="patient_data">
            <div class="flex">
                <%try{  
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con=DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3307/hospital","root","");  
                    //here sonoo is database name, root is username and password  
                    Statement stmt=con.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from patient where appoinment_date='"+today+"' order by appoinment_time");
                %>

                <!--                    <input type="search" name="search" id="search">-->
                <div class="flex-display">
                    <b>Patient ID</b>
                    
                    <b>Patient name</b>
                    <b style="float:right;">Expected date</b>
                    <hr>
                </div>
                <%
                while(rs.next()){
                %>
                <div class="flex-display">
                    <a href="indivisual_data.jsp?id=<%=rs.getString("phone")%>">
                        <div class="patient">
                            <span style="margin-left:2em;"><%=rs.getString("patient_no")%></span> 
                            <span style="margin-left:3em;"><%=rs.getString("patientName")%></span> 
                            <span style="float: right;">Expected time:<%=rs.getString("appoinment_time")%></span>
                        </div>
                    </a>
                    <hr>
                </div>
                <%
                }
                if(!rs.next()){%>
                <div><h4>You have no more patients secheduled for today</h4></div>
                <%}%>
            </div>
            <div class="flex second">
                <div class="flex-display">
                    <b>Patient ID</b>
                    <b>Patient name</b>
                    <hr>
                </div>
                <%ResultSet r = stmt.executeQuery("select * from patient_data");
                        while(r.next()){
                %>
                <div class="flex-display">
                    <a href="indivisual_data.jsp?id=<%=r.getString("contact")%>">
                        <div class="patient">
                            <span style="margin-left:2em;"><%=r.getString("patient_id")%></span> 
                            <span style="margin-left:3em;"><%=r.getString("patient_name")%></span> 
                        </div>
                    </a>
                    <hr>
                </div>
                <%
                    }
        con.close();
    }catch(Exception e){ 
        System.out.println(e);
    }%>
            </div>
        </section>
    </body>
</html>
