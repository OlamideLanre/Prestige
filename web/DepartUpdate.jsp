<%-- 
    Document   : DepartUpdate
    Created on : Jan 15, 2024, 9:56:27 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Department Page</title>
    <link rel="stylesheet" href="./styles/AddCourse.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="ViewDepartmentPage.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 250px;" class="middle">
                    <h2>EDIT DEPARTMENT</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <form method="POST" action="DepartmentUpdate">
                <div class="inner-content">
                    <div class="left">
                        <%  Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String deptUpdate="SELECT * FROM department WHERE deptID=?";
                             int id=Integer.valueOf(request.getParameter("id"));
                             
                             PreparedStatement ps=con.prepareStatement(deptUpdate);
                             ps.setInt(1, id);
                             ResultSet rs=ps.executeQuery();
                             while (rs.next()) {
                                 int deptID=rs.getInt("deptID");
                                 String deptName=rs.getString("DepartmentName");
                                 int facId=rs.getInt("FacultyID");
                                 
                                 out.write("<h5>Department ID</h5>");
                                 out.write("<input type='text name='deptID' id='deptID' value="+deptID+">");
                                 out.write("<h5>Department Name</h5>");
                                 out.write("<input type='text' id='DepartmentName' name='DepartmentName' value="+deptName+"/>");
                                 out.write("<h5>Faculty ID</h5>");
                                 out.write("<input type='text' id='FacultyID' name='FacultyID value="+facId+"/>");
//                                 out.write("<input type='text' id='FacultyID' name='FacultyID' value=" + facId + "/>");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                             
                        
                        %>
                        <button style="margin-top: 10px;" id="btn">UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 250px;" src="./images/business-3d-excited-businessman-in-a-conversation.png" alt="">
                    </div>
                   
     
               </div>
                    </form>
            </div>
            
        </div>
    </div>
</body>
</html>
