<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }
        .logo{
            margin: 1em;
        }
        .main{
            display: flex;
            width: 75vw;
            height: 60vh;
            border-radius: 10px;
            margin: auto auto;
            background: #29C2F1;
        }
        
        .image{
            width: 60%;
            height: 90%;
        }
        
        .image img{
            width: 98%;
        }
        .form{
            width: 40%;
            float: right;
            margin:0 auto;
            margin: 2em 3em;
        }
        form{
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .slider{
            display: flex;
            justify-content: space-between;
            margin-top: 1em;
        }
        .slider a{
            text-decoration: none;
            color: black;
            font-weight: 700;
        }
        .slider a.active{
            text-decoration: underline #F17929;
        }
        .column{
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input{
            width: 25vw;
            height:2em;
            padding: 5px;
            outline: none;
        }
        button{
            width: fit-content;
            padding: 1em;
            margin: 0 auto;
            border: none;
            border-radius: 15px;
        }
        .form p{
            font-size: 1.5em;
        }
        .form .role{
            width: 20px;
            height: 20px;
        }
        .error{
            background: red;
            color: white;
            padding:10px 25vw;
            width: fit-content;
            margin: 0 auto;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="logo">
        <img src="resources/logoH.png" alt="logo" height="65px">
    </div>
    <%if((request.getParameter("error"))!=null){%>
        <div class="error" id="Error">
            Incorrect username/password
        </div>
    <%}else{%>
    <%}%>
    <div class="main">
        <div class="image">
            <img src="https://media.istockphoto.com/vectors/online-doctor-concept-vector-id1169286607?k=20&m=1169286607&s=612x612&w=0&h=JjafKi3oky-tB7VtrDDoXFGQvhamLoraMtNW7lxnfBI=">
        </div>
        <div class="form">
            <p>Log in to proceed</p>
            <form action="Login" method="post">             
                <div class="column">
                    <div class="slider">
                        Role:
                        <input id="Doctor" type="radio" class="role" name="Role" value="Doctor" checked>
                        <label for="Doctor">Doctor</label>
                        <input id="Admin" type="radio" class="role" name="Role" value="Admin">
                        <label for="Admin">Admin</label>
                    </div>
                    <label for="Username">
                        Username:
                    </label>
                    <input id="Username" type="text" name="Username" required>
                    <label for="Password">
                        Password:
                    </label>
                    <input id="Password" type="password" name="Password" required>    
                    <button>Log In</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        var errormsg=document.getElementById("Error").style;
        setTimeout(function(){
            console.log("A");
            errormsg.display="none"; 
        },5000);
    </script>
</body>
</html>