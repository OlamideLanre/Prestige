<%-- 
    Document   : ViewStaffPage
    Created on : Jan 12, 2024, 8:26:02 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Staff Page</title>
    <link rel="stylesheet" href="./styles/viewstaffpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper" style="width: fit-content; height: fit-content">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./staffpage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 300px;" class="middle">
                    <h2>VIEW STAFF PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <h1>STAFFS</h1>
                        <%
                            try {
                                     Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String StaffData="SELECT * FROM staff";
                             PreparedStatement ps=con.prepareStatement(StaffData);
                             out.write("<div class='table-container'>");
                             out.write("<table>");
                             out.write("<thead>");
                             out.write(" <tr>");
                             out.write(" <th>Staff ID</th>");
                             out.write("<th>First Name</th>");
                             out.write("<th>Last name</th>");
                             out.write("<th>ACademic Q</th>");
                             out.write("<th>Email</th>");
                             out.write("<th>Phone Num</th>");
                             out.write("<th>Gender</th>");
                             out.write("<th>Actions</th>");
                             out.write("</tr>");
                             out.write("</thead>");
                             out.write(" <tbody>");
                             
                             ResultSet rs=ps.executeQuery();
                             while (rs.next()) {                                     
                                     String staffID=rs.getString("StaffID");
                                     String fname=rs.getString("FirstName");
                                     String lname=rs.getString("LastName");
                                     String AQ= rs.getString("Academic_Qualification");
                                     String mail=rs.getString("Email");
                                     String Phone=rs.getString("Phone_Number");
                                     String Gender=rs.getString("Gender");
                                     
                                      out.print("<tr>");
                                      out.print("<td>"+ staffID + "</td>");
                                      out.print("<td>"+fname+"</td>");
                                      out.print("<td>"+lname+"</td>");
                                      out.print("<td>"+AQ+"</td>");
                                      out.print("<td>"+mail+"</td>");
                                      out.print("<td>"+Phone+"</td>");
                                      out.print("<td>"+Gender+"</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='StaffUpdate.jsp?id="+ staffID +"'>Edit</a>");
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
