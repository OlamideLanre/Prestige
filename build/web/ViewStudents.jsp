<%-- 
    Document   : ViewStudents
    Created on : Jan 29, 2024, 8:24:51 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Page</title>
    <link rel="stylesheet" href="./styles/viewStudents.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!--<link rel='javascript' href="./styles/TimeOut.js">-->
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./studentpage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 300px;" class="middle">
                    <h2>VIEW STUDENT PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <% 
                        
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             String StudentData="SELECT StudentID,Firstname,Lastname, Semester,StuDepID, email ,regnNumber FROM students";
                             PreparedStatement ps=con.prepareStatement(StudentData);
                             ResultSet rs= ps.executeQuery();
                             
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print(" <th>StudentID</th>");
                              out.print(" <th>Student Name</th>");
                              out.print(" <th>Semester</th>");
                              out.print(" <th>Department</th>");
                              out.print(" <th>Email</th>");
                              out.print(" <th>Reg.No</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                             while (rs.next()) {  
                                     String StudentID=rs.getString("StudentID");
                                     String StudName =rs.getString("Firstname");
                                     String StudName2 =rs.getString("Lastname");
                                     String Sem=rs.getString("Semester");
                                     String Email = rs.getString("email");
                                     String Depart=rs.getString("StuDepID");
                                     String Reg=rs.getString("regnNumber");
                                     
                                     out.print("<tr>");
                                     out.print("<td>"+ StudentID + "</td>");
                                      out.print("<td>"+StudName +' '+ StudName2+ "</td>");
                                      out.print("<td>"+Sem+"</td>");
                                      out.print("<td>"+Depart+"</td>");
                                      out.print("<td>"+Email+"</td>");
                                      out.print("<td>"+Reg+"</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='StudentUpdate.jsp?id="+ StudentID +"'>Edit</a>");
                                      out.print("<a class='delete' href='StudentsDelete?id="+StudentID+"'>Delete</a>");
                                      out.print("</td>");
                                      out.print("</tr>");
                                 }
                            } catch (Exception e) {
                                System.out.println(e);
                            }

                        %>                
                <%
                    // Check for the presence of the error message
                    String errorMessage = (String) request.getAttribute("ErrorMessage");
                    String Message = (String) request.getAttribute("SuccessMessage");
                    if (errorMessage != null) {
                %>
                <p style="font-size: 20px; text-align: center; color: white;" id='errMess'><%= errorMessage%></p>
                <%
                    }else if(Message!=null){
                %>
                <p style="font-size: 20px; text-align: center; color: white;" id='errMess'><%= Message%></p>
                <%
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
    <script>
         const Ptag= document.getElementById('errMess');
            setTimeout(()=>{Ptag.innerHTML="";},4000);
            console.log(Ptag)
    </script>
</body>
</html>
