<%-- 
    Document   : search
    Created on : Apr 19, 2022, 8:03:15 AM
    Author     : Subin
--%>
<%@page import="searchModule.searchModel" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
            .flex{
                display: flex;
                justify-content: center;
                margin-top: 20vh;
                margin-bottom: 10vh;
            }
            .flex div{
                display: flex;
                align-items: center;
            }
            label{
                margin: 7px 10px;
                font-size: 2em;
            }
            .flex input{
                width:2em;
                height: 2em;
            }
            
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/><!-- comment -->
    </head>
    <body>
        <div class="top">
            <img src="resources/logoH.png" width="103" height="37" alt="alt"/>
            <a href="admin?to=dashboard">
                <img src="resources/cross.png" width="20" height="20" alt="alt"/>
            </a>
        </div>
        <form action="Search" method="post">
            <div class="flex">
                <div>
                    <label>Search By:</label>
                </div>

                <%String selected=request.getParameter("selected");
                if(selected == null || selected.equals("Id")){%>
                <div>
                    <input type="radio" id="id" name="searchFor" value="Id" checked="" onchange="this.form.submit()">
                    <label for="id">Doctor Id</label>
                </div>

                <div>
                    <input type="radio" id="Department" name="searchFor" value="Department" onchange="this.form.submit()">
                    <label for="Department">Department</label>
                </div>

                <div>
                    <input type="radio" id="doc_name" name="searchFor" value="doc_name" onchange="this.form.submit()">
                    <label for="doc_name">Doctor Name</label>
                </div>
                    <%}else if(selected.equals("Department")){%>
                <div>
                    <input type="radio" id="id" name="searchFor" value="Id" onchange="this.form.submit()">
                    <label for="id">Doctor Id</label>
                </div>

                <div>
                    <input type="radio" id="Department" name="searchFor" value="Department" checked="" onchange="this.form.submit()">
                    <label for="Department">Department</label>
                </div>

                <div>
                    <input type="radio" id="doc_name" name="searchFor" value="doc_name" onchange="this.form.submit()">
                    <label for="doc_name">Doctor Name</label>
                </div>
                    <%} else if( selected.equals("doc_name")){%>
                <div>
                    <input type="radio" id="id" name="searchFor" value="Id" onchange="this.form.submit()">
                    <label for="id">Doctor Id</label>
                </div>

                <div>
                    <input type="radio" id="Department" name="searchFor" value="Department" onchange="this.form.submit()">
                    <label for="Department">Department</label>
                </div>

                <div>
                    <input type="radio" id="doc_name" name="searchFor" value="doc_name" checked="" onchange="this.form.submit()">
                    <label for="doc_name">Doctor Name</label>
                </div>
                    <%}
                ArrayList<searchModel> list = (ArrayList<searchModel>)request.getAttribute("list");
                    if(list!=null){
                %>
                <datalist id="search">
                <%
                    for(searchModel l : list){
                %>
                        <option value="<%=l.getSearchId()%>">
                <%
                    }
                }
                %>
            </div>
            <div class="search">
                <input type="search" list="search" name="search" id="searchs">
                <button>
                    <i class="fa fa-search"></i>
                </button>
            </div>

        </form>
        
    </body>
</html>
