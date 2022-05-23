<%-- 
    Document   : homePage
    Created on : Feb 21, 2022, 10:30:52 AM
    Author     : Subin
--%>
<%@page import="java.sql.*"%>
<%@page import="user_controller.model" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.cs"/>
    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            font-family: sans-serif;
        }
        
        table,td,th{
            border-collapse: collapse;
        }
        
        ul{
            display: flex;
        }

        header {
            min-height: 10vh;
        }

        header ul {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        ul li{
            font-size: 12px;
            margin: 10px 55px;
            list-style: none;
        }

        nav ul {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        nav ul li a{
            font-family: sans-serif;
            font-size: 14px;
        }

        .boxxed{
            display:inline-flex;
        }
        
        p{
            line-height: 1.5em;
        }
        
        a{
            color: #707070;
            text-decoration: none;
        }
        .column{
            margin: 1em;
            text-align: center;
            grid-column: span 2;
        }
        .rect{
            height: 30vh;
            width: 60vh;
            background: white;
            background-image: url(about.jpg);
            background-repeat: no-repeat;
            justify-content: center;
        }
        .box_container{
            height: 304px;
            width: 250px;
        }
        .next{
            height: 304px;
            width:24px;
            border: 2px solid black;
        }
        .previous{
            height: 304px;
            width:24px;
            border: 2px solid black;
        }
        #Fscreen{
            min-height: 90vh;
            background-image: url('https://familydoctor.org/wp-content/uploads/2018/02/41808433_l.jpg');
            background-size: cover;
            padding: 30px 80px;
            position: relative;
        }

        #Fscreen::after {
            content: "" ;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(41, 194, 241, 0.1);
            filter: blur(10px);
        }

        #Fscreen .hero {
            position: absolute;
            top: 50%;
            left: 0%;
            width: 50%;
            transform: translate(10%, -50%);
        }

        .hero {
            z-index: 2;
        }

        .hero .button-group {
            width: 65%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
        }

        .hero .button-group .btn {
            font-size: 18px;
            font-weight: 600;
            padding: 10px 15px;
            color: #291500;
            border: 1px solid #788BFF;
            text-align: center;
            background-color: #788BFF;
            color: white;
        }

        .circle{
            height: 120px;
            width: 120px;
            border: 2px solid black;
            border-radius: 50%;
            margin: 20px 65px
        }

        #prices table th,td{
            width: 400px;
            padding: 5px 0;
            text-align: center;
            font-size: 20px;
        }
        #prices table{
            margin: auto;
        }
        #prices th{
            background: #F17929;
            color: white;
        }
        #prices td{
            background: #81D2EB;
        }
        #mission{
            text-align: center;
        }
        #mission p{
            text-align: left;
        }
        footer {
            width: 100%;
            background-color: black;
            color: white;
        }

        footer .container {
            width: 50%;
            margin: auto;
            text-align: center;
            padding: 1em;
        }
        #appoinment{
            width:50vw;
            display: grid;
            place-content:center;
        }
        .social-link {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 20px;
        }
        .form{
            flex: 1;
            width: 50%;
            margin: auto;
        }
        .flex-display{
            display: flex;
            margin: auto;
            justify-content: space-between;
        }
        .input-field{
            flex: 1;
            display: flex;
            text-align: left;
            flex-direction: column;
            margin: 20px;
        }
        .input-field input{
            padding: 10px 15px;
            outline: none;
        }
        .butn {
            padding: 10px 15px;
            border: none;
            margin: 0 250px;
            background: #F17929;
        }
    </style>
    <body>
        <header>

            <ul>
                <li><img src="logoH.png" width="103" height="37" alt="alt"/></li>
                <li><a href="#">Address:<span class="boxxed">New Baneshwor, Kathmandu<br/>
                        </span></a></li>
                <li><a href="#">Email:Hospital@gmail.com</a></li>
                <li><a href="#">Contact:<span class="boxxed">01-2398789<br/>01-9867664</span></a></li>
            </ul>
            <nav style="height:8vh;">
                <ul>
                    <%String[] nav={"Home","About","Department","Doctors","Pricing","Contact"};%>
                    <%for(int i=0;i<nav.length;i++){%>
                    <li style="margin:10px 35px 0; font-size: large;"><a href="#<%out.print(nav[i]);%>" style="color:black;"><h2><%out.print(nav[i]);%></h2></a></li>
                                <%}%>
                </ul>
            </nav>
        </header>

        <div id="Fscreen">
            <div class="hero" id="Home">
                <h1>
                    Making Health Care Better Together  
                </h1>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur labore fugit reiciendis deserunt enim modi ut aspernatur, impedit beatae corrupti delectus cupiditate quibusdam nemo molestiae. Expedita reprehenderit unde iusto fugiat
                </p>

                <div  class="button-group">
                    <a href="#appoin" class="btn">Make an Appoinment</a>
                    <a href="#Department" class="btn">View Department</a>


                </div>
            </div>

        </div>
        <div class="About" id="About" style="display:flex; justify-content: center;margin: 10vh 0;">
            <div class="rect" style=";"></div>
            <div class="text" style="margin-left:15vw;">
                <span style="font-size:40px;">About Us</span>
                <p>
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit.<br/>
                    Autem, cumque non, molestias culpa quidem inventore sunt <br/>
                    aspernatur iste, iusto ratione sapiente. Voluptates iure beatae<br/>
                </p>
                <p>
                    Lorem Ipsum dolor sit amet, consectetuer adipscing elit. Duis tellus. Donec <br/>
                    ante dolor, iaculis nec, gravida ac, cursus in eros. Mauris vestibulum, felis et <br/>
                    egestas ullamcorper, purus nibh. Lorem Ipsum dolor sit amet, consectetuer <br/>
                    ante dolor, iaculis nec, gravida ac, cursus in eros. Mauris vestibulum, felis et<br/> 
                    egestas ullamcorper, purus nibh. Lorem Ipsum dolor sit amet, consectetuer  <br/>
                    ante dolor, iaculis nec, gravida ac, cursus in eros. Mauris vestibulum, felis et <br/>
                    egestas ullamcorper, purus nibh.
                </p>
            </div>
        </div>
        <section id="mission" style="margin:30px">
            <span style="font-size:30px;justify-content: center;">Our Vision</span>
            <p style="margin-top:10px">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Autem, cumque non, molestias culpa quidem inventore sunt aspernatur iste, iusto ratione sapiente. Voluptates iure beatae sunt aspernatur iste
            </p><br><br>
            <span style="font-size:30px;">Our Mission</span>
            <p style="margin-top:10px">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Autem, cumque non, molestias culpa quidem inventore sunt aspernatur iste, iusto ratione sapiente. Voluptates iure beatae sunt aspernatur iste
            </p>
        </section>
                <%
                    int b=0;
                    String department[]=new String[20];
                    int ml=0;
                    ArrayList<model> list=(ArrayList<model>)request.getAttribute("department");
                    for(model l:list){
                        department[ml]=l.getDep_list();
                        ml++;
                    }
                    int a=0;
                    String doctor[]=new String[20];
                    ml=0;
                    ArrayList<model> last=(ArrayList<model>)request.getAttribute("doctor");
                    for(model l:last){
                        doctor[ml]=l.getDoc_list();
                        ml++;
                    }
                    
    %>
        <div class="container" style="margin:30px;" id="department">
            <span style="font-size:30px;">Departments</span><br>
            <div style="display:flex; justify-content: center;">
                <a href="?in=(-1)#department" name="previous">
                    <div class="previous">
                        <img src="previous.png" height="304" width="24" alt="alt"/>
                    </div>
                </a>
                
                <%for(int i=0;i<3;i++){ %>
                    <a href="#" style="color:black;">
                        <div class="box_container" style="text-align: center;border: 2px solid black;">
                            <div class="circle"></div>
                            <div>
                                <span style="font-size:30px;"><%=department[b+i]%></span>
                                <p>
                                    Lorem ipsum dolor, sit amet consectetur adipisicing elit.<br/>
                                </p>
                            </div>
                        </div>
                    </a>
                <%}
                %>
                <a href="?in=1#department" name="next">
                    <div class="next">
                        <img src="next.png" height="304" width="24" alt="alt"/>
                    </div>
                </a>
            </div>
        </div>
        <div class="container" style="margin:30px;" id="doctor">
            <span style="font-size:30px;">Doctors</span>
            <div class="Doctors" style="display:flex; justify-content: center;">
                <a href="#doctor?action=prev" name="previous">
                    <div class="previous">
                        <img src="previous.png" height="304" width="24" alt="alt"/>
                    </div>
                </a>
                <%for(int i=0;i<3;i++){%>
                <div class="box_container" style="text-align: center;border: 2px solid black;">
                    <div class="circle"></div>
                    <div>
                        <h3><%=doctor[a+i]%></h3>
                        <div style="color:#4F5556;">
                            <h5>MBBS</h5>
                            <h4>Orthopedics</h4>
                        </div>
                        <div style="margin-top:1.5em;">
                            <a href="#appoin" style="padding:0.5em;color: white;background: #F17929;border-radius: 40px;">Book an appoinment</a>
                        </div>
                    </div>
                </div>
                <%}%>
                <a href="#department?action=next" name="next">
                    <div class="next">
                        <img src="next.png" height="304" width="24" alt="alt"/>
                    </div>
                </a>
            </div>
        </div>
        <div style="margin:30px;display: flex;flex-direction: column;" id="appoin">
            <h3>Appoinment Form</h3>
            <form method="post" action="databaseConn" class="form">
                <div class="flex-display">
                    <div class="input-field">
                        <label for="First Name">First Name:</label>
                        <input type="text" name="First Name" placeholder="First Name" required="">
                    </div>
                    <div class="input-field">
                        <label for="Last Name">Last Name:</label>
                        <input type="text" name="Last Name" placeholder="Last Name" required="">
                    </div>
                </div>
                <div style="margin:0 20px;">
                    <label for="Gender">Gender:</label>
                    <input type="radio" name="Gender" value="Male" required=""><label>Male</label>
                    <input type="radio" name="Gender" value="Female" required=""><label>Female</label>
                </div>
                <div class="flex-display">
                    <div class="input-field">
                        <label for="Age">Age:</label>
                        <input type="number" name="Age" placeholder="Age" required="">
                    </div>
                    <div class="input-field">
                        <label for="Phone">Phone:</label>
                        <input type="text" pattern="\d*" name="Phone" placeholder="Phone" minlength="10" maxlength="10" required="">
                    </div>
                </div>  
                <div class="flex-display">
                    <div class="input-field">
                        <label for="date">Date:</label>
                        <input type="date" name="date" required="">
                    </div>
                    <div class="input-field">
                        <label for="time">Time:</label>
                        <input type="time" name="time" required="">
                    </div>
                </div>
                <div class="flex-display">
                    <div class="input-field">
                        <label for="Department">Department:</label>
                        <select name="Department" required="">
                            <%for(int i=0;i<department.length;i++){
                                if(department[i]!=null){%>
                                <option value="<%=department[i]%>">
                                    <%=department[i]%>
                                </option>
                                <%}else{break;}
                            }%>
                        </select>
                    </div>
                    <div class="input-field">
                        <label for="Doctor">Doctor:</label>
                        <select name="Department" required="">
                            <%for(int i=0;i<doctor.length;i++){
                                if(doctor[i]!=null){%>
                                <option value="<%=doctor[i]%>">
                                    <%=doctor[i]%>
                                </option>
                                <%}else{break;}
                            }%>
                        </select>
                    </div>
                </div>
                <button type="submit" class="butn"><h3>Submit</h3></button>
            </form>
        </div>
        <section id="prices" style="margin:30px;">
            <h3>Pricing</h3>
            <table border="1">
                <tr>
                    <th>Service</th>
                    <th>Price</th>
                </tr>
                <%for(int i=0;i<5;i++){%>
                <tr>
                    <td>Lorem</td>
                    <td>Rs. 100</td>
                </tr>
                <%}%>
            </table>
        </section>
        <footer>
            <div class="container">
                <div class="social-link">
                    <div class="text">Contact us</div>
                    <div class="social-image">
                        <span>1</span>
                        <span>1</span>
                        <span>1</span>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
