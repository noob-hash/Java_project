<%-- 
    Document   : admin
    Created on : Mar 31, 2022, 11:18:28 AM
    Author     : Subin
--%>
<%@page import="adminController.adminModel" %>
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
                background: #f2f6f7;
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
                margin-left: 20px;
            }
            input {
                padding: 5px;
            }

            .img{
                background: white;
                height: 40px;
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
                border-radius: 10px;
                padding: 10px;
            }
            .table{
                width: -webkit-fill-available;
            }
            .update {
                padding: 0 20px;
                font-weight: 600;
            }
            
            .delete {
                border: 2px solid #ff5858;
                background-color: transparent;
                color: #ff5858;
                font-weight: 600;
            }

            .flex{
                display: flex;
                justify-content: space-evenly;
            }

            form{
                background: white;
            }
            table{
                background: white;
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
            
            #popup{
                border: 1px solid grey;
                position: absolute;
                top:50%;
                left: 40%;
                padding: 2em;
                background: red;
                display: none;
            }
            
            .box{
                border: 1px solid #f2f6f7;
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
                text-align: left;
                border-radius: 10px;
            }
            table input{
                width: 7vw;
            }
        </style>
    </head>
    <body>
        <div class="divider">
            <nav>
                <ul>
                    <li><img src="resources/logoH.png" alt="Hospital logo" height="37" width="103"></li>
                    <li><h3><a href="controller?to=dashboard">Dashboard</a></h3></li>
                    <li><h3><a href="controller?to=audit">Audit</a></h3></li>
                    <li><h3><a href="admin?to=search">Search</a></h3></li>
                    <li><h3><a href="admin?to=logout">Logout</a></h3></li>
                </ul>
            </nav>
            <div class="main flex">
                <div class="column">
                    <form action="NewServlet" method="post" class="box">
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
                                <input type="text" name="Qualification" required="">
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
                            <button class="update" type="submit" value="save" name="button">Add</button>
                            <button class="delete" name="cancel">Cancel</button>
                        </div>
                    </form>
                    <form action="NewServlet" method="post" class="box">
                        <h3 style="text-align:center;">Add new Department</h3>
                        <div class="flex">
                            <div class="input">
                                <label for="DepId">Department Id</label>
                                <input type="text" name="DepId" required="">
                            </div>
                            <div class="input">
                                <label for="DepName">Name</label>
                                <input type="text" name="DepName" required="">
                            </div>
                        </div>
                        <div class="flex">
                            <button class="update" type="submit" name="button" value="addDep">Add</button>
                            <button class="delete" name="button" value="cancel">Cancel</button>
                        </div>
                    </form>
                </div>
                <div class="table">
                    <table border="0">
                        <tr> 
                            <th>Id</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Qualification</th>
                            <th>Department</th>
                            <th>Password</th>
                            <th>Options</th>
                        </tr>
                        <%
                            ArrayList<adminModel> lst = (ArrayList<adminModel>)request.getAttribute("data");
                            for(adminModel l : lst){
                            if((request.getParameter("id")==null) || (l.getId()!=Integer.parseInt(request.getParameter("id")))){
                        %>
                        <form action="actions?id=<%=l.getId()%>" method="post">
                            <tr>
                                <td><%=l.getId()%></td>
                                <td><%=l.getName()%></td>
                                <td><%=l.getPhone()%></td>
                                <td><%=l.getDegree()%></td>
                                <td><%=l.getDepartment()%></td>
                                <td>*******</td>
                                <td>
                                    <button class="img" type="submit" name="button" value="edit">
                                        <img src="resources/edit.PNG" width="100%" height="100%" alt="alt"/>
                                    </button>
                                    <button class="img" type="submit" name="button" value="delete">
                                        <img src="resources/delete.PNG" width="100%" height="100%" alt="alt"/>
                                    </button>
                                </td>
                            </tr>
                        </form>
                        <%} else if((l.getId()==Integer.parseInt(request.getParameter("id")))){%>
                        <form action="actions?id=<%=l.getId()%>" method="post">
                            <tr>
                                <td><%=l.getId()%></td>
                                <td><%=l.getName()%></td>
                                <td><input type="number" name="phone" value="<%=l.getPhone()%>" minlength="10" maxlength="10" required></td>
                                <td><input type="type" name="Qualification" value="<%=l.getDegree()%>" required></td>
                                <td><input type="text" value="<%=l.getDepartment()%>" required></td>
                                <td><input type="text" name="password" value="*******" required></td>
                                <td>
                                    <button class="img" type="submit" name="button" value="update">
                                        <img src="resources/save.png" width="100%" height="100%" alt="alt"/>
                                    </button>
                                    <button class="img" type="submit" name="button" value="cancel">
                                        <img src="resources/cross.png" width="100%" height="80%" alt="alt"/>
                                    </button>
                                </td>
                            </tr>
                        </form>
                        <%}
                        }%>
                    </table>
                </div>
            </div>
        </div>
        <div class="popup" id="popup">
            Are you sure you want to delete?
            <button>Yes</button>
            <button>No</button>
        </div>
    </body>
</html>
