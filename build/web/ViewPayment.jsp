<%-- 
    Document   : ViewPayment
    Created on : Jan 27, 2024, 12:56:26 PM
    Author     : TM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Payment Page</title>
        <link rel="stylesheet" href="./styles/ViewFees.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    </head>
    <body>
        <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./feespage.html"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 300px;" class="middle">
                    <h2>VIEW PAYMENTS PAGE</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <div class="inner-content">
                    <div class="dashboard">
                        <h1>Payments</h1>
                        <% 
                        
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             String PaymentsData="SELECT * FROM payments";
                             PreparedStatement ps=con.prepareStatement(PaymentsData);
                             ResultSet rs= ps.executeQuery();
                             
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print(" <th>Students Name</th>");
                              out.print(" <th>Method of Payment</th>");
                              out.print(" <th>Payment Date</th>");
                              out.print(" <th>Semester</th>");
                              out.print(" <th>Cleared Payments</th>");
                              out.print("<th>Outstanding Payments</th>");
                              out.print("<th>Student ID</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                             while (rs.next()) {                                     
                                     String StudName =rs.getString("StudentName");
                                     String MOP=rs.getString("Method_of_Payment");
                                     String DatePaid = rs.getString("DatePaid");
                                     String Sem=rs.getString("Semester");
                                     String ClearedPayment = rs.getString("ClearedPayment");
                                     int OutStanding = rs.getInt("OutStanding");
                                     String StudID=rs.getString("ID");
                                     
                                     out.print("<tr>");
                                      out.print("<td>"+ StudName + "</td>");
                                      out.print("<td>"+ MOP + "</td>");
                                      out.print("<td>"+DatePaid+"</td>");
                                      out.print("<td>"+Sem+"</td>");
                                      out.print("<td>"+ClearedPayment+"</td>");
                                      out.print("<td>"+OutStanding+"</td>");
                                      out.print("<td>"+StudID+"</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='PaymentUpdate.jsp?id="+ StudID +"'>Edit</a>");
                                      out.print("<a class='delete' href='PaymentDelete?id="+StudID+"'>Delete</a>");
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

