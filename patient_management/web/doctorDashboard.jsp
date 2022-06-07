<%@page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter"%>
<%@page import="doctorController.doctorModel" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <%DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDateTime now=LocalDateTime.now();
    %>
    <%
    String today=dtf.format(now);
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
                background: #f2f6f7;
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
                font-family: sans-serif;
                background: #f2f6f7;
                width: 100%;
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
           
            .general{
                display: flex;
                flex-direction: column;
            }
            .flex{
                text-align: center;
                margin: 0 20px;
                padding: 1em 1em 2em 1em;
                border-radius: 5px;
                background: white;
                display: flex;
                flex-direction: column;
                width: 50vw;
                border: 2px solid #36454f45;
                border-radius: 10px;
                min-height: 40vh;
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
            }
            .this{
                margin-top: 25px;
            }
            .column span{
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }
            
            li:hover {
                background-color: #fdb931;
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
            
            section{
                display: flex;
                justify-content: space-between
            }
            
            .flex-display{
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                background: lightgreen;
            }
            
            .patient{
                color: black;
            }
            .patient > *{
                flex:1;
                text-align: left;
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
        <div class="top">
            <h1>Welcome <%=session.getAttribute("Username")%></h1>
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
                        <li><img src="resources/logoH.png" width="103" height="37" alt="alt"/></li>
                        <li><h3><a href="doctor?to=dashboard">Dashboard</a></h3></li>
                        <li><h3><a href="doctor?to=dashboard"> Appoinments </a></h3></li>
                        <li><h3><a href="doctor?to=search">Search</a></h3></li>
                        <li><h3><a href="doctor?to=logout">Logout</a></h3></li>
                    </ul>
                </nav>
            </div>
            <div class="body">
                <h3 class="column this">
                    <div>Today's appoinment:</div>
                    <div>All patient list:</div>
                </h3>
                <section id="patient_data">
                    <div class="flex">
                        <div class="column patient">
                            <b>Patient ID</b>
                            <b>Patient name</b>
                            <b style="float:right;">Expected Time</b>
                        </div>                        
                        <hr>
                        <div class="flex-display">
                        <%
                            ArrayList<doctorModel> lst = (ArrayList<doctorModel>)request.getAttribute("appoinmentToday");
                            for(doctorModel l : lst){
                        %>
                            <a href="patient?action=patient&identifiedBy=<%=l.getId()%>">
                                <div class="column patient">
                                    <div><%=l.getId()%></div> 
                                    <div><%=l.getName()%></div> 
                                    <div><%=l.getTime()%></div>
                                </div>
                            </a>
                        <hr>
                        <%}%>
                        </div>                    
                    </div>
                        <div class="flex second">
                        <div class="column patient">
                            <b>Patient ID</b>
                            <b>Patient name</b>
                        </div>
                        <hr>
                        <div class="flex-display">
                            <%
                            ArrayList<doctorModel> list = (ArrayList<doctorModel>)request.getAttribute("appoinments");
                            for(doctorModel l:list){%>
                                <a href="patient?action=patient&identifiedBy=<%=l.getId()%>">
                                    <div class="column patient">
                                        <div><%=l.getId()%></div> 
                                        <div><%=l.getName()%></div> 
                                    </div>
                                </a>
                                <hr>
                            <%}%>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</html>