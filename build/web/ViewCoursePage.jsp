<%-- 
    Document   : ViewCoursePage
    Created on : Jan 6, 2024, 7:49:41 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Course Page</title>
    <link rel="stylesheet" href="./styles/viewcoursepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper" style="height: fit-content; padding-bottom: 10px">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./coursepage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 300px;" class="middle">
                    <h2>VIEW COURSE PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <h1>Courses</h1>
                        <%
                            try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
//                             String jointSelect="SELECT c.Name,c.CourseID,s.StaffID,c.deptID from staff s join course c where c.deptID=s.StaffDeptID";
                                String courseSelect="SELECT * FROM course";
                             
                             PreparedStatement ps = con.prepareStatement(courseSelect);
                             ResultSet rs= ps.executeQuery();
                             
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print("<th>Course Name</th>");
                              out.print(" <th>Course ID</th>");
                              out.print(" <th>Departent ID</th>");
//                              out.print("<th>Staff ID</th>");
//                              out.print("<th>Department ID</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                              
                             while (rs.next()) {                                     
                                    int Courseid=rs.getInt("CourseID");
                                    int deptID= rs.getInt("deptID");
                                      String courseName= rs.getString("Name");
//                                      String staffID=rs.getString("StaffID");
//                                      String deptID= rs.getString("deptID");
                                      out.print("<tr>");
                                      out.print("<td>"+ courseName + "</td>");
                                      out.print("<td>"+Courseid+"</td>");
                                      out.print("<td>"+deptID+"</td>");
//                                      out.print("<td>"+staffID+"</td>");
//                                      out.print("<td>"+Courseid+"</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='CourseUpdate.jsp?id="+ Courseid +"'>Edit</a>");
                                      out.print("<a class='delete' href='#'>Delete</a>");
                                      out.print("</td>");
                                      out.print("</tr>");
                                 }
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                        
                        %>
                                <!-- Add more rows as needed -->
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
            </div>
            
        </div>
    </div>
</body>
</html>
