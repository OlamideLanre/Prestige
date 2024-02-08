<%-- 
    Document   : Dashboard
    Created on : Feb 7, 2024, 7:19:44 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard</title>
    <link rel="stylesheet" href="./styles/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
     <div class="mainContainer">
            <div class="wrapper">
        <div class="content">
            <div class="logo">
                <div class="inner-content">
                    <a class="btn" href="Logout"><div class="logout"> <i class="fa fa-sign-out" aria-hidden="true" style="color: #222;"></i>    Sign Out</div></a>
                    <img src="./images/logo2.png" alt="">
                    <h2>Admin DashBoard</h2>
                </div>
            </div>
            <div class="boxes">
                <div class="first">
                    <a href="./staffpage.html"><div class="staff"><img src="./images/3d-business-man-and-woman-working-at-table-with-laptop.png" alt=""><p>Staff</p></div></a>
                    <a href="./studentpage.html"><div class="staff"><img src="./images/3d-business-young-women-standing-and-smiling.png" alt=""><p>Student</p></div></a>
                    <a href="./coursepage.html"><div class="staff"><img src="./images/casual-life-3d-boy-studying-remotely-with-tutor.png" alt=""><p>Course</p></div></a>
                </div>
              
               <div class="second">
                    <a href="./departmentpage.html"><div class="staff"><img src="./images/business-3d-excited-businessman-in-a-conversation.png" alt=""><p>Department</p></div></a>
                    <a href="./facultypage.html"><div class="staff"><img src="./images/business-3d-woman-recruiter-leaning-on-browser-window-with-man-showing-v-sign-inside.png" alt=""><p>Faculty</p></div></a>
                    <a href="./feespage.html"><div class="staff"><img src="./images/3d-business-mobile-credit-card-and-money.png" alt=""><p>Fees</p></div></a>
               </div>
            </div>

            <div class="responsive-box">
                <a href="./staffpage.html"><div class="staff"><img src="./images/3d-business-man-and-woman-working-at-table-with-laptop.png" alt=""><p>Staff</p></div></a>
                <a href="./studentpage.html"><div class="staff"><img src="./images/3d-business-young-women-standing-and-smiling.png" alt=""><p>Student</p></div></a>
                <a href="./coursepage.html"><div class="staff"><img src="./images/casual-life-3d-boy-studying-remotely-with-tutor.png" alt=""><p>Course</p></div></a>
                <a href="./departmentpage.html"><div class="staff"><img src="./images/business-3d-excited-businessman-in-a-conversation.png" alt=""><p>Department</p></div></a>
                <a href="./facultypage.html"><div class="staff"><img src="./images/business-3d-woman-recruiter-leaning-on-browser-window-with-man-showing-v-sign-inside.png" alt=""><p>Faculty</p></div></a>
                <a href="./feespage.html"><div class="staff"><img src="./images/3d-business-mobile-credit-card-and-money.png" alt=""><p>Fees</p></div></a>
            </div>
        </div>
    </div>
    </div>
           <% 
        String Admin=session.getAttribute("adminID").toString();
        if(Admin!=null){
    %>
    <span style="font-size: 12px; color: white; text-align: left; margin-bottom: 0px; margin: 0px">Active: Admin <%= Admin%></span>
    <%
        }else{
    %>
    <span style="font-size: 18px; text-align: center; color: white; margin-bottom: 20px">Admin id not found</span>
    <%
        }
     %>
</body>
</html>
