<%@page import="java.sql.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>
<%  DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDateTime now=LocalDateTime.now();
%>
<%String today=dtf.format(now);
%>
<!DOCTYPE html>
<html lang="en">
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
            display: flex;
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
            gap: 15px;
            margin: auto;
            justify-content:space-between;
            padding: 1em 0;
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
        nav li:hover {
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
        .dropdown{
            display: flex;
            flex-direction: column;
            position: relative;
        }
        
        .content {
            position: absolute;
            top: 100%;
            left: 0;
            display: none;
            background: white;
            padding: 5px;
            border: 1px solid black;
        }
        
        .click {
            cursor: pointer;
        }
        
        .dropdown:hover .content{
            display: flex;
            flex-direction: column;
        }
        
        .content a{
            padding: 5px 10px;
            color: black;
        }
        
        .content a:hover {
            background-color: rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
    <%
    String id = request.getParameter("id");
    String pid;
    String date=request.getParameter("DateOfApp");
        try{
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3307/hospital","root","");  
            //here sonoo is database name, root is username and password  
            Statement stmt=con.createStatement();
    %>
    <div class="top">
            <div class="lefrig">
                <a href="" style="color: grey;"><h4>Back</h4></a>
                <h3>Looking at Record for:</h3>
                <div class="dropdown">
                    <div class="click">Choose a date</div>
                    <div class="content">
                        <%
                            String latest;
                     ResultSet r=stmt.executeQuery("Select * from patient_info natural join patient_data where contact='"+id+"' order by DateOfApp desc");
                     while(r.next()){
                     latest=r.getString("DateOfApp");
                        %>
                        <a href="patient.jsp?id=<%=id%>&&DateOfApp=<%=r.getString("DateOfApp")%>"><%=r.getString("DateOfApp")%></a>
                        <%}%> 
                    </div>

                    
                </div>
            </div>
            <div class="kefrig">
                <a href="" style="padding: 0.5em 1em; background-color: orange;border-radius: 20px;">Send via email</a>
                <a href="newdata.jsp?id=<%=id%>" style="padding: 0.5em 1em; background-color: orange;border-radius: 20px;">Add new record</a>
            </div>
    </div>
    <hr>
    <div class="divider">
        <div class="nav">
            <nav>
                <ul>
                    <li><img src="" alt="Hospital logo"></li>
                    <li><h3><a href="dashboard.jsp">Dashboard</a></h3></li>
                    <li><h3><a href="dashboard.jsp">Appoinments</a></h3></li>
                    <li><h3><a href="search.jsp">Search</a></h3></li>
                    <li><h3><a href="">Logout</a></h3></li>
                </ul>
            </nav>
        </div>
        <%
            ResultSet rs = stmt.executeQuery(" Select * from patient_data left join patient_info on patient_data.patient_id=patient_info.patient_id where contact='"+id+"'");
                rs.next();
                pid=rs.getString("patient_id");
        %>
        <div class="body">
            <div class="general">
                <div class="flex">
                    <div class="circle"></div>
                    <div class="name">
                        <h1><%=rs.getString("patient_name")%></h1>
                    </div>
                    <div class="appoin">
                        <span><h2>15</h2>Total</span><hr>
                        <span><h2>2</h2>Upcomming</span>
                    </div>
                </div>
                <div class="flex">
                    <div class="column">
                        <span>
                            <h3>
                                Patient Id
                            </h3>
                            
                            <%=rs.getString("patient_id")%>
                        </span>
                        <span>
                            <h3>
                                Gender
                            </h3>
                            <%if("M".equals(rs.getString("gender"))){%>
                            Male
                            <%}else{%>
                            Female
                            <%}%>
                        </span>
                        <span>
                            <h3>
                                Age
                            </h3>
                            <%=rs.getString("age")%>
                        </span>
                    </div>
                    <div class="column">
                        <span>
                            <h3>
                                Phone
                            </h3>
                            <%=rs.getString("contact")%>
                        </span>
                        <span>
                            <h3>
                                Blood Group
                            </h3>
                            <%if(null==rs.getString("blood_group")){%>
                            Unknown
                            <%}else{%>
                                <%=rs.getString("blood_group")%>
                            <%}%>
                        </span>
                    </div>
                    <div class="column ">
                        <span>
                            <h3>
                                Allergies
                            </h3>
                            <%if(null==rs.getString("allergy")){%>
                                Unknown
                            <%}else{%>
                                <%=rs.getString("allergy")%>
                            <%}%>
                        </span>
                    </div>
                </div>
            </div>
            <%
                ResultSet ra = stmt.executeQuery(" Select * from patient_data left join patient_info on patient_data.patient_id=patient_info.patient_id where contact='"+id+"'");
                ra.next();
            %>
            <div class="cols">
                <div class="patientdata">
                    <div class="flexx">
                        <span>Height</span>
                        <div>
                            <span class="number"><%=ra.getString("height")%></span>
                            cm
                        </div>
                    </div>
                    <div class="flexx">
                        <span>Weight</span>
                        <div>
                            <span class="number"><%=ra.getString("weight")%></span>
                            kg
                        </div>
                    </div>
                    <div class="flexx">
                        <span>Temperture</span>
                        <div>
                            <span class="number"><%=ra.getString("temperature")%></span>
                            deg C
                        </div>
                    </div>
                    <div class="flexx">
                        <span>Heart rate</span>
                        <div>
                            <span class="number"><%=ra.getString("pulse")%></span>
                            bpm
                        </div>
                    </div>
                    <div class="flexx">
                        <span>Blood pressure</span>
                        <div>
                            <span class="number"><%=ra.getString("Blood_pressure")%></span>
                            st
                        </div>
                    </div>
                </div>
                <div class="treat">
                    
                    <div class="diagonisis">
                        <h1 style="color:darkturquoise;">Diagonisis</h1>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis tempore error numquam ullam vero veritatis minus fuga sit itaque asperiores, cumque consequuntur eveniet aspernatur laudantium rerum id facere, harum tempora!
                    </div>
                    <div class="treatmentPlan">
                        <h1 style="color:darkturquoise;">Treatment Plan</h1>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Corporis tempore error numquam ullam vero veritatis minus fuga sit itaque asperiores, cumque consequuntur eveniet aspernatur laudantium rerum id facere, harum tempora!
                    </div>
                    <div class="prescriptions">
                        <h1 style="color:darkturquoise;">Prescriptions</h1>
                        <ol>
                            <li>
                                methadone
                            </li>
                            <li>
                                Presoprass XD
                            </li>
                            <li>
                                Oxiculator
                            </li>
                        </ol>
                    </div>
                    <div class="reports">
                        <h1 style="color:darkturquoise;">Test reports</h1>
                        Empty
                    </div>
                    <%stmt.execute("insert into audit values('"+today+"','Patient id "+pid+" was accessed.')");
                        }catch(Exception e){ 
            System.out.println(e);
        } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>