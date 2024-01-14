<%-- 
    Document   : CourseUpdate
    Created on : Jan 12, 2024, 8:26:26 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course Page</title>
    <link rel="stylesheet" href="./styles/AddCourse.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./ViewCoursePage.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 200px;" class="middle">
                    <h2>ADD COURSE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <a href="FacultyUpdate.jsp"></a>
                <form method="POST" action="CourseUpdate">
                <div class="inner-content">
                    <div class="left">
                               
                             <%
                             Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             int id= Integer.valueOf(request.getParameter("id"));
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String CourseQuery="SELECT * FROM course where CourseID=?";
                             PreparedStatement ps1 = con.prepareStatement(CourseQuery);
                              ps1.setInt(1, id);
                              
                             ResultSet rs= ps1.executeQuery();
                             while (rs.next()) {
//                                 int FacID= rs.getInt("CourseID");
                                 String Name= rs.getString("Name");
                                 String department=rs.getString("deptID");
                                 
                                 out.write("<h5>Course Name</h5>");
                                 out.write("<input type='text' name='coursename' id='coursename' value="+Name+">");
                                 out.write("<h5>Department ID</h5>");
                                 out.write("<input type='text' name='deptID' id='deptID' value="+department+">");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                    
                    %>
                    <button type="submit" style="margin-top: 10px;" id="btn" href="#">UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 300px" height="300px" src="./images/casual-life-3d-boy-studying-remotely-with-tutor.png" alt="">
                    </div>
                   
     
               </div>
                </form>
            </div>
            
        </div>
    </div>
</body>
</html>
