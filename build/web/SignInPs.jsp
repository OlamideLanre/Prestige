<%-- 
    Document   : SignIn
    Created on : Jan 27, 2024, 3:00:40 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign IN Page</title>
    <link rel="stylesheet" href="./styles/signinpage.css">
</head>
<body>
    
    <div class="wrapper">
        <div class="content">
            <div class="left-pane">
               <form method="POST" action="SignInPs">
               <div class="inner-content">
                   
                    <h1 style="color: #ffffff;">Sign IN</h1>
                    <h2>To Prestige Schools</h2>
                    <h5>Admin ID.No</h5>
                    <input type="text" id="Nameinput" name="Nameinput">
                    <h5>Password</h5>
                    <input type="password" id="PassInput" name="PassInput">
                    <input type="submit" id="btn" />
                    <div class="socials">
                        <span>Want to add new Admin?<a href="./signuppagePS.html">Sign Up</a> </span>
                    </div>
                            <%
                    // Check for the presence of the error message
                    String errorMessage = (String) request.getAttribute("ErrorMessage");
                    if (errorMessage != null) {
                %>
                <p style="font-size: 20px; text-align: center; color: white;"><%= errorMessage%></p>
                <%
                    }
                %>
               </div>
               </form>
            </div>
                
            <div class="right-pane">
                <div class="inner-content">
                    <img src="./images/logo3.png" alt="">
                    <div class="txt">
                        <h2>Welcome</h2>
                        <h3>To Prestige Schools</h3>
                        <h5>Let's Escape The Matrix Together</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        let SubmitBtn = document.querySelector("#btn");

            SubmitBtn.addEventListener("click", handler);

            function handler(e) {
                
                let Fullname = document.getElementById("Nameinput");
                let password = document.getElementById("PassInput");

                console.log("working");
                if (Fullname.value == "" || password.value == "") {
                    alert("All fields required");
                    e.preventDefault();
                } 
//                else {
//                    alert("success");
//                }
//
//                Fullname.value = "";
//                password.value = "";
            }
    </script>
</body>
</html>
