<%-- 
    Document   : FacultyUpdate
    Created on : Jan 10, 2024, 9:25:58 AM
    Author     : TM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Faculty Page</title>
    <link rel="stylesheet" href="./styles/addfacultypage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <nav>
                <div class="left">
                    <a class="btn" href="./ViewFacultyPage.jsp"><div class="logout"> <i class="fa fa-arrow-left" aria-hidden="true" style="color: #222;"></i>    Back</div></a>
                </div>
                <div style="width: 200px;" class="middle">
                    <h2>EDIT FACULTY</h2>
                </div>
                <div class="right">
                    <img style="width: 100px;" src="./images/logo2.png" alt="logo">
                </div>
            </nav>

            <div class="boxes">
                <form method="POST" action="FacultyUpdate">
                <div class="inner-content">
                    <div class="left">
                        
                             <%
                             Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             int id= Integer.valueOf(request.getParameter("id"));
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String FacQuery="SELECT * FROM faculty where FacultyID=?";
                             PreparedStatement ps1 = con.prepareStatement(FacQuery);
                              ps1.setInt(1, id);
                              
                             ResultSet rs= ps1.executeQuery();
                             while (rs.next()) {
                                 int FacID= rs.getInt("FacultyID");
                                 String Name= rs.getString("FacultyName");
                                 
                                 out.write("<h5>Faculty Name</h5>");
                                 out.write("<input type='text' name='FacultyName' id='FacultyName' value="+Name+">");
                                 out.write("<h5>Faculty ID</h5>");
                                 out.write("<input type='text' name='FacultyID' id='FacultyID' value="+FacID+">");
                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                    
                    %>
                        <button type="submit" style="margin-top: 10px;" id="btn" class="updatebtn">UPDATE</button>
                    </div>

                    <div class="right">
                        <img style="width: 270px;" src="./images/business-3d-woman-recruiter-leaning-on-browser-window-with-man-showing-v-sign-inside.png" alt="">
                    </div>
                   
     <!--out.write("<textarea type='text' name='FacultyName' id='FacultyName'>"+Name+"</textarea>");-->
               </div>

               </form>

            </div>
        </div>
    </div>
    
    
    
<!--     <script>
        let SubmitBtn = document.querySelector(".addbtn");
        let UpdateBtn = document.querySelector(".updatebtn");

            SubmitBtn.addEventListener("click", handler);
            UpdateBtn.addEventListener("click", handler);

            function handler() {
                let FacultyName = document.getElementById("FacultyName");

                if (FacultyName.value === "") {
                    alert("All fields are required !");
                    
//                    e.preventDefault();
                }else{
                    console.log('configuration successful');
                    alert('Added succesfully')
                }
                
            }

    </script>-->
</body>
</html>