<%@page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%HttpSession session=request.getSession();
if(session!=null){
%>
    <%-- 
        Document   : main
        Created on : Mar 30, 2022, 7:18:37 AM
        Author     : Subin
    --%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Admin page</title>
        </head>
        <body>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");  
                Connection con=DriverManager.getConnection(  
                "jdbc:mysql://localhost:3307/hospital","root","");  
                //here sonoo is database name, root is username and password  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from doctor_login"); 
                while(rs.next()) {
               %>
               <div class="user" style="display:flex;">
                   <div id="uname">
                       Username:<%=rs.getString("doctor_id")%>
                   </div>
                    <div id="pass">
                        Password:<input type="text" value=<%=rs.getString("password_hash")%>>
                    </div>
                    <button type="button" name="Save" onclick="">Save</button>
                    <button type="button" name="Delete">Delete</button>
               </div>
            <%}
                con.close();
            %>
        </body>
    </html>
<%} else{
        response.sendRedirect("index");
}%>