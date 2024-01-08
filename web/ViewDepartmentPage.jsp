<%-- 
    Document   : ViewDepartmentPage
    Created on : Jan 8, 2024, 8:14:47 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Department Page</title>
    <link rel="stylesheet" href="./styles/viewdepartmentpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./departmentpage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 400px;" class="middle">
                    <h2>VIEW DEPARTMENT PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <h1>Department</h1>
                        <%
                        try {
                                 Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String DeptQuery="SELECT * FROM department";
                             
                             PreparedStatement ps=con.prepareStatement(DeptQuery);
                             ResultSet rs= ps.executeQuery();
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print(" <th>Department ID</th>");
                              out.print(" <th>Department Name</th>");
                              out.print(" <th>Faculty ID</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                             while (rs.next()) {                                     
                                     int DeptID=rs.getInt("DeptID");
                                     String DeptName= rs.getString("DepartmentName");
                                     int FacID=rs.getInt("FacultyID");
                                     
                                      out.print("<tr>");
                                      out.print("<td>"+ DeptID + "</td>");
                                      out.print("<td>"+DeptName+"</td>");
                                      out.print("<td>"+ FacID + "</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='edit.jsp?id="+ DeptID +"'>Edit</a>");
                                      out.print("<a class='delete' href='#'>Delete</a>");
                                      out.print("</td>");
                                      out.print("</tr>");
                                 }
                            } catch (Exception e) {
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