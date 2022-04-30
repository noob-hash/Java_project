<%-- 
    Document   : admin
    Created on : Mar 31, 2022, 11:18:28 AM
    Author     : Subin
--%>
<%@page import="trying1.model" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctors</title>
        <style>

            *{
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'helvatica', sans-serif;
            }

            .body{
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                gap: 20px;
            }

            .title {
                font-size: 24px;
                text-align: center;
            }

            header {
                margin: 0;
                padding: 1em;
                display:flex;
                align-items: center;
                justify-content: space-between;
            }

            table {
                width: 60vw;
            }
            input {
                padding: 5px;
            }

            button {
                padding: 7px;
                border: 0;
                border-radius: 5px;
                color: white;
                cursor: pointer;
                background-color: rgb(6, 127, 207);
            }


            th, td {
                text-align: left;
                border: 1px solid black;
                text-align: center;
            }
            .table{
                width: -webkit-fill-available;
            }
            .update {
                background-color: limegreen;
            }

            .delete {
                background-color: orangered;
            }
            .flex{
                display: flex;
                justify-content: space-evenly;
            }
            .input{
                display: flex;
                margin: 0.5em 1em;
                flex-direction: column;
                text-align: center;
            }
            a{
                text-decoration: none;
                color: white;
            }
            .divider{
                height: 100vh;
                display: flex;
                flex-direction: row;
            }
            a{
                text-decoration: none;
                color: white;
            }
            nav{
                display: flex;
                flex-direction: column;
                position: fixed;
                align-items: center;
                top: 0;
                height: 100vh;
                width: 10vw;
                background-color: rgb(32, 109, 139);
            }
            .column input{
                border: none;
                border-bottom: 1px solid gray;
                width: 8em;
            }
            .box{
                border: 1px solid black;
                padding: 1em;
                border-radius: 10px;
            }
            nav li{
                padding: 1em;
            }
            .main{
                padding-top: 10vh;
                width: 100vw;
                margin-left:12vw;
            }
            li:hover {
                background-color: #fdb931;
            }
            .column{
                display: flex;
                gap:4em;
                flex-direction: column;
            }
            table,td,th{
                border-collapse: collapse;
                padding: 3px 0;
            }
        </style>
    </head>
    <body>
        <div class="divider">
            <nav>
                <ul>
                    <li><img src="" alt="Hospital logo"></li>
                    <li><h3><a href="dashboard.jsp">Dashboard</a></h3></li>
                    <li><h3><a href="dashboard.jsp">Audit</a></h3></li>
                    <li><h3><a href="search.jsp">Search</a></h3></li>
                    <li><h3><a href="">Logout</a></h3></li>
                </ul>
            </nav>
            <div class="main flex">
                <div class="column">
                    <div class="box">
                        <h3 style="text-align:center;">Add new Doctor</h3>
                        <div class="flex">
                            <div class="input">
                                <label for="Username">Doctor Id</label>
                                <input type="text" name="Username" required="">
                            </div>
                            <div class="input">
                                <label for="D_name">Name</label>
                                <input type="text" name="D_name" required="">
                            </div>
                        </div>
                        <div class="flex">
                            <div class="input">
                                <label for="Phome">Contact</label>
                                <input type="text" name="Phone" required="">
                            </div>
                            <div class="input">
                                <label for="Qualification">Qualification</label>
                                <input type="text" name="Qualifiction" required="">
                            </div>
                        </div>
                        <div class="flex">
                            <div class="input">
                                <label for="Department">Department</label>
                                <input type="text" name="Department" required="">
                            </div>
                            <div class="input">
                                <label for="password">Password</label>
                                <input type="password" name="password" required="">
                            </div>
                        </div>
                        <div class="flex">
                            <button type="submit">Add Doctor</button>
                            <button class="delete">Cancel</button>
                        </div>
                    </div>
                    <div class="box">
                        <h3 style="text-align:center;">Add new Department</h3>
                        <div class="flex">
                            <div class="input">
                                <label for="DepId">Department Id</label>
                                <input type="text" name="DepId" required="">
                            </div>
                            <div class="input">
                                <label for="DepName">Name</label>
                                <input type="password" name="DepName" required="">
                            </div>
                        </div>
                        <div class="flex">
                            <button type="submit">Add Department</button>
                            <button class="delete">Cancel</button>
                        </div>
                    </div>
                </div>
                <div class="table">
                    <table border="0">
                        <tr> 
                            <th>Doctor id</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Qualification</th>
                            <th>Department</th>
                            <th>Password</th>
                            <th>Options</th>
                        </tr>
                        <%
                            ArrayList<model> lst = (ArrayList<model>)request.getAttribute("data");
                            for(model l : lst){
                        %>
                        <tr>
                            <td><%=l.getId()%></td>
                            <td><%=l.getName()%></td>
                            <td><%=l.getPhone()%></td>
                            <td><%=l.getDegree()%></td>
                            <td><%=l.getDepartment()%></td>
                            <td><%=l.getPassword()%></td>
                            <td>
                                <button class="update" type="submit" name="button" value="edit">Edit</button>
                                <button class="delete" type="submit" name="button" value="delete">Delete</button>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
