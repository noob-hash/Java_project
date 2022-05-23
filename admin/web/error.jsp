<%-- 
    Document   : error
    Created on : May 20, 2022, 10:24:41 AM
    Author     : Subin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body{
            background: grey;
            opacity: 0.9;
        }
        .error{
            padding: 2em;
            position: absolute;
            border:1px solid grey;
            width: fit-content;
            border-radius: 10px;
            top:35%;
            left: 40%;
            background: white;
            opacity: 1;
        }
        
        button{
            padding:1em;
            background: limegreen;
            border-radius: 10px;
            margin-left: 30px; 
        }
        .yes{
            background: orangered;
        }
    </style>
    <body>
        <%
        String msg=request.getParameter("msg");
        if(msg.equals("delete")){%>
        <form method="post" action="controller?to=dashboard" class="error">
            <p> Are you sure you want to delete?</p>
            <button class="yes">Yes</button>
            <button>No</button>
        </form>
        <%else if(msg.equals("PData")){
                
                }%>
        
        <%}%>
    </body>
</html>
