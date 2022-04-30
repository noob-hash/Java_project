<%@page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
    <%DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDateTime now=LocalDateTime.now();
    %>
    <%
    String today=dtf.format(now);
    if("true".equals(session.getAttribute("sessionmaintioned"))){
    %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Arial', sans-serif;
                color: #121313;
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
            .top{
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-left: 10vw;
                display: flex;
                padding: 1em;
                align-items: center;
            }
            .lefrig{
                display: flex;
                gap: 40px;
            }
            .appoin{
                display: flex;
                text-align: center;
                justify-content: space-around;
            }
            .general{
                display: flex;
                flex-direction: column;
            }
            .flex{
                text-align: center;
                border: 1px solid black;
                margin:20px;
                padding: 1em 1em 2em 1em;
                border-radius: 5px;
            }
            span{
                color: rgb(12, 12, 12);

            }
            .circle{
                width: 150px;
                height: 150px;
                border: 1px solid black;
                border-radius: 50%;
                margin: auto;
            }
            h1,h2,h3{
                color: black;
                font-weight: 400;
            }

            h1 {
                font-size: 24px;
                margin: 16px 0;
            }
            .column{
                display: flex;
                justify-content: space-around;
                margin-top: 1em;
            }
            .column span{
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }
            .left{
                width: 30vw;
                padding: 2em 5em;
            }
            li:hover {
                background-color: #fdb931;
            }

            .patientdata{
                display: flex;
                margin: 1.25em auto;
                gap: 55px;
                height: fit-content;
            }

            .flexx{
                padding: 1em 1em;
                border: 1px solid grey;
                border-radius: 10px;
                height: fit-content;
            }

            .flexx span {
                margin-bottom: 10px;
                font-weight: 700;
            }

            .treat{
                width: 60vw;
            }
            .treat div{
                margin: 1em;
                border: 1px solid grey;
                padding: 1em 2em;
                border-radius: 20px;
            }
            .number{
                font: 1em sans-serif;
                color: darkturquoise;
            }
            .cols{
                display: flex;
                flex-direction: column;
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
            .flex-display,.patient{
                display: flex;
                justify-content: space-between;
                background: lightgreen;
            }
            .second{
                width: 25vw;
            }
            #patient_data{
                display: flex;
            }
            .nocolor{
                background: white;
            }
        </style>
    </head>
    <body>
        <div class="top">
            <h1>Welcome Doctor</h1>
            <div>
                <h3>Today is:</h3>
                <%=today%>
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
                <h3 class="column">
                    <div>Today's appoinment:</div>
                    <div>All patient list:</div>
                </h3>
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
                        <div class="flex-display nocolor">
                            <b>Patient ID</b>

                            <b>Patient name</b>
                            <b style="float:right;">Expected date</b>
                        </div>
                        <hr>
                        <%
                        while(rs.next()){
                        %>
                        <div class="flex-display">
                            <a href="patient.jsp?id=<%=rs.getString("phone")%>">
                                <div class="patient">
                                    <span style="margin-left:2em;"><%=rs.getString("patient_no")%></span> 
                                    <span style="margin-left:3em;"><%=rs.getString("patientName")%></span> 
                                    <span style="float: right;">Expected time:<%=rs.getString("appoinment_time")%></span>
                                </div>
                            </a>
                        </div>
                        <hr>
                        <%
                        }
                        if(!rs.next()){%>
                        <div style="background:rgba(31, 154, 192, 0.829);"><h4>You have no more patients secheduled for today</h4></div>
                        <%}%>
                    </div>
                    <div class="flex second">
                        <div class="flex-display nocolor">
                            <b>Patient ID</b>
                            <b>Patient name</b>
                        </div>
                        <hr>
                        <%ResultSet r = stmt.executeQuery("select * from patient_data");
                                while(r.next()){
                        %>
                        <div class="flex-display">
                            <a href="patient.jsp?id=<%=r.getString("contact")%>">
                                <div class="patient">
                                    <span style="margin-left:2em;"><%=r.getString("patient_id")%></span> 
                                    <span style="margin-left:10em;"><%=r.getString("patient_name")%></span> 
                                </div>
                            </a>
                        </div>
                        <hr>
                        <%
                            }
                con.close();
            }catch(Exception e){ 
                System.out.println(e);
            }%>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>
<%}else{
    response.sendRedirect("index.html");
}%>