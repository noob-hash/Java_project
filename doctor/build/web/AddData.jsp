<%@page import="controller1.model" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add data</title>
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                font-family: sans-serif;
            }
            .divider{
                height: 100vh;
                display: flex;
                flex-direction: row;
                background: #f2f6f7;
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
            .partion{
               margin-left:15vw;
               margin-top: 5vh;
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

            .circle{
                width: 150px;
                height: 150px;
                border: 1px solid black;
                border-radius: 50%;
                margin: auto;
            }
            .general{
                border: 1px solid black;
                padding: 2vw;
                border-radius: 10px;
                position: fixed;
                height: fit-content;
                width: fit-content;
                background: white;
                text-align: center;
            }
            .name h1{
                margin-top: 10px;
                font-size: larger;
            }
            .column h2{
                font-size: small;
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


            .form{
                margin-left: 25vw;
            }

            .form .flex{
                display: flex;
            }
            .input{
                display: flex;
                margin: 0.5em 1em;
                flex-direction: column;
                text-align: center;
            }
            .input label{
                font-weight: bold;
            }
            input{
                height: 2em;
                border: 2px solid gray;
                border-radius: 10px;
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
                        <li><img src="logoH.png" width="103" height="37" alt="alt"/></li>
                        <li><h3><a href="controller?to=dashboard">Dashboard</a></h3></li>
                        <li><h3><a href="controller?to=dashboard">Appoinments</a></h3></li>
                        <li><h3><a href="search.jsp">Search</a></h3></li>
                        <li><h3><a href="controller?action=logoff">Logout</a></h3></li>
                    </ul>
                </nav>
            </div>
            <div class="partion">
                <%
                    String id = request.getParameter("id");
                    String action=request.getParameter("action");
                    ArrayList<model> lst = (ArrayList<model>)request.getAttribute("patientInfo");
                    for(model l : lst){
                %>
                <div class="general">
                    <div class="flex">
                        <div class="circle"></div>
                        <div class="name">
                            <h1><%=l.getName()%></h1>
                        </div>
                        <div class="column">
                            <span>
                                <h3>
                                    Patient Id
                                </h3>
                                
                                <%=l.getId()%>
                            </span>
                            <span>
                                <h3>
                                    Gender
                                </h3>
                                <%if("M".equals(l.getGender())){%>
                                    Male
                                    <%}else{%>
                                    Female
                                    <%}%>
                            </span>
                            <span>
                                <h3>
                                    Age
                                </h3>
                                <%=l.getAge()%>
                            </span>
                        </div>
                        <div class="column">
                            <span>
                                <h3>
                                    Phone
                                </h3>
                                <%=l.getPhone()%>
                            </span>
                            <span>
                                <h3>
                                    Blood Group
                                </h3>
                                <%if(null==l.getBlood_group()){%>
                                    Unknown
                                <%}else{%>
                                    <%=l.getBlood_group()%>
                                <%}%>
                            </span>
                        </div>
                        <div class="column ">
                            <span>
                                <h3>
                                    Allergies
                                </h3>
                                <%if(null==l.getAllergies()){%>
                                    Unknown
                                <%}else{%>
                                    <%=l.getAllergies()%>
                                <%}%>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form">
                    <form action="controller?action=saveData&identifiedBy=<%=l.getId()%>" method="post">
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
                        <button onsubmit="dothis()" style="width: fit-content;margin: 0 24vw; padding: 1em;border-radius: 20px; border: 2px solid black;">Submit</button>    
                        <div>
                    </form>
                </div>
                <%}%>
            </div>
        </div>
    </body>
    <script>
        function dothis(){
            alert("1");
        }
    </script>
</html>

