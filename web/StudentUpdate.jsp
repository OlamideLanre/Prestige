<%-- 
    Document   : StudentUpdate
    Created on : Jan 30, 2024, 10:53:56 AM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Page</title>
    <link rel="stylesheet" href="./styles/addstudentpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper" style="height: 550px">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./ViewStudents.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 200px;" class="middle">
                    <h2>EDIT INFORMATION</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <form method="POST" action="StudentUpdate">
                <div class="inner-content">
                    <div class="left">
                          <%
                    // Check for the presence of the error message
                    String errorMessage = (String) request.getAttribute("ErrorMessage");
                    if (errorMessage != null) {
                %>
                <p style="font-size: 20px; text-align: center; color: white;" id='errMess'><%= errorMessage%></p>
                <%
                    }
                %>
                        <%
                         Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             String id= request.getParameter("id");
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String staffQuery="SELECT * FROM students where StudentID=?";
                             PreparedStatement ps1 = con.prepareStatement(staffQuery);
                              ps1.setString(1, id);
                              
                             ResultSet rs= ps1.executeQuery();
                             while (rs.next()) {
                                 String studID= rs.getString("StudentID");
                                 String Fname= rs.getString("Firstname");
                                 String Lname= rs.getString("Lastname");
                                 String dob=rs.getString("DOB");
                                 String RegNum=rs.getString("regnNumber");
                                 int deptNum=rs.getInt("StuDepID");
                                 String email=rs.getString("Email");
                                 String phone=rs.getString("phoneNumber");
                                 String sem=rs.getString("Semester");
                                 
                                 out.write("<h5>Student ID</h5>");
                                 out.write("<input type='text' name='studID' id='studID' value="+studID+">");
                                 out.write("<h5>First Name</h5>");
                                 out.write("<input type='text' name='FirstName' id='FirstName' value="+Fname+">");
                                 out.write("<h5>Last Name</h5>");
                                 out.write("<input type='text' name='LastName' id='LastName' value="+Lname+">");
                                 out.write("<h5>Department</h5>");
                                 out.write("<input type='text' name='dept' id='dept' value="+deptNum+">");
                                 out.write("<h5>DOB</h5>");
                                 out.write("<input type='text' id='DOB' value="+dob+">");
                                 out.write("<h5>Reg.No</h5>");
                                 out.write("<input type='text' id='regNum' value="+RegNum+">");
                                 out.write("<h5>Email</h5>");
                                 out.write("<input type='text' name='Email' id='Email' value="+email+">");
                                 out.write("<h5>Phone Number</h5>");
                                 out.write("<input type='text' name='Phone_number' id='Phone_number' value="+phone+">");
                                 out.write("<h5>Semeste</h5>");
                                 out.write("<input type='text' name='Sem' id='Sem' value="+sem+">");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                        %>
                            <button style="margin-top: 10px;" id="btn" href="#">UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 250px;" height="350px" src="./images/3d-business-young-women-standing-and-smiling.png" alt="">
                    </div>
                   
     
               </div>
                            </form>
            </div>
            
        </div>
    </div>
    <script>
         const Ptag= document.getElementById('errMess');
            setTimeout(()=>{Ptag.innerHTML="";},4000);
            console.log(Ptag)
    </script>
</body>
</html>
