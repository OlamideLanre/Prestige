<%-- 
    Document   : StaffUpdate
    Created on : Jan 15, 2024, 8:40:42 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Staff Page</title>
    <link rel="stylesheet" href="./styles/addstaffpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="ViewStaffPape.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 200px;" class="middle">
                    <h2>EDIT STAFF</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <form method="POST" action="StaffUpdate">
                <div class="inner-content">         
                    <div class="left">
                        
                          <%
                             Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             String id= request.getParameter("id");
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String staffQuery="SELECT * FROM staff where StaffID=?";
                             PreparedStatement ps1 = con.prepareStatement(staffQuery);
                              ps1.setString(1, id);
                              
                             ResultSet rs= ps1.executeQuery();
                             while (rs.next()) {
                                 String staffID= rs.getString("StaffID");
                                 String Fname= rs.getString("FirstName");
                                 String Lname= rs.getString("LastName");
                                 String AQ=rs.getString("Academic_Qualification");
                                 String email=rs.getString("Email");
                                 String phone=rs.getString("Phone_Number");
                                 String Gender=rs.getString("Gender");
                                 
                                 out.write("<h5>Staff ID</h5>");
                                 out.write("<input type='text' name='StaffID' id='staffID' value="+staffID+">");
                                 out.write("<h5>First Name</h5>");
                                 out.write("<input type='text' name='FirstName' id='FirstName' value="+Fname+">");
                                 out.write("<h5>Last Name</h5>");
                                 out.write("<input type='text' name='LastName' id='LastName' value="+Lname+">");
                                 out.write("<h5>Academic Qualification</h5>");
                                 out.write("<input type='text' name='Academic_Qualification' id='Academic_Qualification' value="+AQ+">");
                                 out.write("<h5>Email</h5>");
                                 out.write("<input type='text' name='Email' id='EMail' value="+email+">");
                                 out.write("<h5>Phone Number</h5>");
                                 out.write("<input type='text' name='Phone_number' id='Phone_number' value="+phone+">");
                                 out.write("<h5>Gender</h5>");
                                 out.write("<input type='text' name='Gender' id='Gender' value="+Gender+">");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                    
                    %>
                  
                            <button type="submit" style="margin-top: 10px;" id="btn" >UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 250px; height: 300px" src="./images/3d-business-man-and-woman-working-at-table-with-laptop.png" alt="" />
                    </div>
     
               </div>
                </form>
            </div>
            
        </div>
    </div>
