package Servlets;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;


@WebServlet(urlPatterns = {"/StaffAdd"})
public class StaffAdd extends HttpServlet {

 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/realworlddb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);    

                System.out.print("connection successful");
                
                String insert = "INSERT INTO staff(StaffID, FirstName, LastName, Academic_Qualification, StaffDeptID, Date_of_birth, HireDate, Email, Phone_number, Gender) VALUES (?,?,?,?,?,?,?,?,?,?)";
                
//                int staffID = Integer.valueOf(request.getParameter("StaffID"));
                String staffID = request.getParameter("StaffID");
                String firstName = request.getParameter("FirstName");
                String lastName = request.getParameter("LastName");
                String acadmicQualification = request.getParameter("Academic_Qualification");
                int staffDeptID =  Integer.valueOf(request.getParameter("StaffDeptID"));
                String dateofbirth = request.getParameter("Date_of_birth");
                String hireDate = request.getParameter("HireDate");
                String email = request.getParameter("Email");
                String phone_number = request.getParameter("Phone_number");
                String gender = request.getParameter("Gender");
                
                try (PreparedStatement ps = connection.prepareStatement(insert)) {
                    if (!staffID.isEmpty() && !firstName.isEmpty() && !lastName.isEmpty() && !acadmicQualification.isEmpty() && staffDeptID != 0  && !dateofbirth.isEmpty() && !hireDate.isEmpty() && !email.isEmpty() &&  !phone_number.isEmpty() && !gender.isEmpty()) {
                        ps.setString(1, staffID);
                        ps.setString(2, firstName);
                        ps.setString(3, lastName);
                        ps.setString(4, acadmicQualification);
                        ps.setInt(5, staffDeptID);
                        ps.setString(6, dateofbirth);
                        ps.setString(7, hireDate);
                        ps.setString(8, email);
                        ps.setString(9, phone_number);
                        ps.setString(10, gender);
                        
                        ps.executeUpdate();
                  request.setAttribute("SuccessMessage","Successfully Added Information");
                  RequestDispatcher RD= request.getRequestDispatcher("ViewStaffPage.jsp");
                  RD.forward(request, response);
                    }else{
                        out.write("All fields are required");
                    }
                } catch (SQLException e) {
                    System.out.println(e);
                }
                
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
