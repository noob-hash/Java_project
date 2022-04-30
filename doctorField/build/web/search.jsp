<%-- 
    Document   : search
    Created on : Apr 19, 2022, 8:03:15 AM
    Author     : Subin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background: #f9f9f9;
            }
            .top{
                display: flex;
                justify-content: space-between;
            }
            .search{
                display: flex;
                height: 60vh;
                justify-content: center;
                align-items: center;
            }
            input{
                height: 3em;
                width: 60vw;
                border: 1px solid black;
                border-radius: 40px;
            }

            .fa:before{
                font-size: 2em;
            }
            a{
                color: black;
                text-decoration: none;
            }
            button{
                background: none;
                border: none;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/><!-- comment -->
    </head>
    <body>
        <div class="top">
            <image src="" alt="Logo">
            <a href="dashboard.jsp">
                <i class="fa fa-times"></i>
            </a>
        </div>
        <div class="search">
            <input type="search" list="search" name="search" id="searchs">
            <datalist id="search">
                <%
                try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3307/hospital","root","");  
            //here sonoo is database name, root is username and password  
            Statement stmt=con.createStatement();
            ResultSet rs= stmt.executeQuery("Select * from patient_data");
            while(rs.next()){
                %>
                <option value="<%=rs.getString("patient_name")%>">
                <option value="<%=rs.getString("patient_id")%>">
                    <%
                        }
        }catch(Exception e){
        System.out.println(e);
        }
                    %>
            </datalist>
            <button>
                <i class="fa fa-search"></i>
            </button>
        </div>
    </body>
</html>
