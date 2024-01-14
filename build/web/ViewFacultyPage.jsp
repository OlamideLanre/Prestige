<%-- 
    Document   : ViewFacultyPage
    Created on : Jan 7, 2024, 12:08:08 PM
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
    <title>View Faculty Page</title>
    <link rel="stylesheet" href="./styles/viewfacultypage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./facultypage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 300px;" class="middle">
                    <h2>VIEW FACULTY PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <h1>Faculty</h1>
                        <% 
                        
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             String FacultyData="SELECT * FROM Faculty";
                             PreparedStatement ps=con.prepareStatement(FacultyData);
                             ResultSet rs= ps.executeQuery();
                             
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print(" <th>Faculty ID</th>");
                              out.print(" <th>Faculty Name</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                             while (rs.next()) {                                     
                                     int FacID=rs.getInt("FacultyID");
                                     String FacName=rs.getString("FacultyName");
                                     
                                     out.print("<tr>");
                                      out.print("<td>"+ FacID + "</td>");
                                      out.print("<td>"+FacName+"</td>");
                                      out.print("<td>");
//                                      out.print("<input type='hidden' name='id' value="+id+"/>");
                                      out.print(" <a class='edit' href='FacultyUpdate.jsp?id="+ FacID +"'>Edit</a>");
                                      out.print("<a class='delete' href='FacultyDelete?id="+FacID+"'>Delete</a>");
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