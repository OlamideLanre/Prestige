<%-- 
    Document   : PaymentUpdate
    Created on : Jan 28, 2024, 6:33:24 PM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"  %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Fees Page</title>
    <link rel="stylesheet" href="./styles/addfeespage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./ViewPayment.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 250px;" class="middle">
                    <h2>EDIT PAYMENTS</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <form method="POST" action="PaymentUpdate">
                <div class="inner-content">
                    <div class="left">
                         <%
                             Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             String id= request.getParameter("id");
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String Query="SELECT * FROM payments where ID=?";
                             PreparedStatement ps1 = con.prepareStatement(Query);
                              ps1.setString(1, id);
                              
                             ResultSet rs= ps1.executeQuery();
                             while (rs.next()) {
                                  String StudName =rs.getString("StudentName");
                                     String MOP=rs.getString("Method_of_Payment");
                                     String DatePaid = rs.getString("DatePaid");
                                     String Sem=rs.getString("Semester");
                                     String ClearedPayment = rs.getString("ClearedPayment");
                                     int OutStanding = rs.getInt("OutStanding");
                                     String StudID=rs.getString("ID");
                                 
                                 out.write("<h5>Student Name</h5>");
                                 out.write("<input type='text' name='studentName' id='studentName' value="+StudName+">");
                                 out.write("<h5>Methof of Payment</h5>");
                                 out.write("<input type='text' name='MOP' id='MOP' value="+MOP+">");
                                 out.write("<h5>Date Paid</h5>");
                                 out.write("<input type='text' name='date' id='date' value="+DatePaid+">");
                                 out.write("<h5>Semester</h5>");
                                 out.write("<input type='text' name='semester' id='semester' value="+Sem+">");
                                out.write("<h5>Cleared Payment</h5>");
                                 out.write("<input type='text' name='cleared' id='cleared' value="+ClearedPayment+">");
                                 out.write("<h5>Outstanding Payment</h5>");
                                 out.write("<input type='text' name='outstanding' id='outstanding' value="+OutStanding+">");
                                 out.write("<h5>Student ID</h5>");
                                 out.write("<input type='text' name='studID' id='studID' value="+StudID+">");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                    
                    %>
                        <button style="margin-top: 10px;" id="btn">UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 300px;" src="./images/3d-business-mobile-credit-card-and-money.png" alt="">
                    </div>
                   
     
               </div>
                   </form>     
            </div>
            
        </div>
    </div>
</body>
</html>
