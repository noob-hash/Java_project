<%-- 
    Document   : newdata
    Created on : Apr 26, 2022, 10:43:07 PM
    Author     : Subin
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .box{
                max-width: 70vw;
                min-height: 70vh;
                margin: 1.5em 0 1em 15vw;
                padding: 2em 4em;
                display: flex;
                align-content: center;
                flex-direction: column;
                box-shadow: 5px 5px 5px -15px black;
            }
            .flex{
                display: flex;
            }
            .input{
                display: flex;
                margin: 0.5em 1em;
                flex-direction: column;
                text-align: center;
            }
            .general .flex{
                margin: 0 2em;
                flex-direction: column;
            }
            .general .input{
                text-align: left;
            }
            .general{
                display: flex;
                margin: 0 auto;
            }
            input{
                height: 2em;
                border-radius: 2em;
                border: 2px solid gray;
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
            .nav{
                display: flex;
                flex-direction: column;
                position: fixed;
                align-items: center;
                top: 0;
                height: 100vh;
                width: 10vw;
                background-color: rgb(32, 109, 139);
            }

            .nav li{
                padding: 1em;
            }
            .body{
                /* width: 80vw; */
                padding-left:10vw;
            }
            li:hover {
                background-color: #fdb931;
            }
            .top{
                margin-left: 10vw;
                padding: 1em;
            }
            textArea{
                height: 10em;
                resize: none;
                width: 50vw;
            }
        </style>
    </head>
    <body>
        <div class="top">
            <div>
                <a href="" style="color: grey;"><h4>Back</h4></a>
            </div>
        </div>
        <hr>
        <div class="divider">
            <div class="nav">
                <nav>
                    <ul>
                        <li><img src="" alt="Hospital logo"></li>
                        <li><h3><a href="">Dashboard</a></h3></li>
                        <li><h3><a href="">Appoinments</a></h3></li>
                        <li><h3><a href="search.jsp">Search</a></h3></li>
                        <li><h3><a href="">Logout</a></h3></li>
                    </ul>
                </nav>
            </div>
            <div class="body">
                <form action="" method="post" class="box">
                    <%
                    String id = request.getParameter("id");
                    try{
                        response.setContentType("text/html;charset=UTF-8");
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con=DriverManager.getConnection(  
                        "jdbc:mysql://localhost:3307/hospital","root","");  
                        //here sonoo is database name, root is username and password  
                        Statement stmt=con.createStatement();
                         ResultSet r=stmt.executeQuery("Select * from patient_data where contact='"+id+"'");
                         r.next();
                    %>
                    <div class="general">
                        <div class="flex">
                            <h3 class="input">
                                <div>Patient Id:</div>
                                <%=r.getString("patient_name")%>
                            </h3>
                            <h3 class="input">
                                <div>Gender:</div>
                                Male
                            </h3>
                            <h3 class="input">
                                <div>Allergies:</div>
                                Unknown
                            </h3>
                        </div>
                        <div class="flex">
                            <h3 class="input">
                                <div>Name:</div>
                                Sandesh Rai
                            </h3>

                            <h3 class="input">
                                <div>Phone:</div>
                                9812989787
                            </h3>

                        </div>
                        <div class="flex">
                            <h3 class="input">
                                <div>Age:</div>
                                21
                            </h3>
                            <h3 class="input">
                                <div>Blood Group:</div>
                                A+
                            </h3>
                        </div>
                    </div>
                    <%}catch(Exception e){ 
            System.out.println(e);
        } %>

                    <div class="flex">
                        <div class="input">
                            <label for="height">Height</label>
                            <input type="text" name="height" required>
                        </div>
                        <div class="input">
                            <label for="weight">Weight</label>
                            <input type="text" name="weight" required>
                        </div>
                    </div>
                    <div class="flex">
                        <div class="input">
                            <label for="temp">Temp(C)</label>
                            <input type="text" name="temp" required>
                        </div>
                        <div class="input">
                            <label for="pulse">Pulse</label>
                            <input type="text" name="pulse">
                        </div>
                        <div class="input">
                            <label for="BP">Blood Pressure</label>
                            <input type="text" name="BP" required>
                        </div>
                    </div>
                    <div class="flex">
                        <div class="input">
                            <label for="diagnosis">Diagnosis</label>
                            <textarea name="diagnosis">
                                
                            </textarea>
                        </div>
                    </div>
                    <div class="flex">
                        <div class="input">
                            <label for="tp">Tretment Plan</label>
                            <textarea name="tp">
                                
                            </textarea>
                        </div>
                    </div>
                    <div class="flex">
                        <div class="input">
                            <label for="presc">Presciption</label>
                            <textarea name="presc">
                                
                            </textarea>
                        </div>
                    </div>
                    <div class="flex">
                        <div class="input">
                            <label for="tr">Test Reports</label>
                            <input type="file" style="border: 1px solid gray; width: 50vw;height: 4em;line-height: 4em; " name="tr">
                        </div>
                    </div>
                    <button style="width: fit-content;margin: auto; padding: 1em;border-radius: 20px;">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>
