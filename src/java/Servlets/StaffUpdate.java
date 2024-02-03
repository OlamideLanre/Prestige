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

@WebServlet(name = "StaffUpdate", urlPatterns = {"/StaffUpdate"})
public class StaffUpdate extends HttpServlet {
private static final String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
    private static final String JDBC_USER="root";
    private static final String JDBC_PASSWORD="";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con= DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                System.out.println("Con Success");
                
                String UpdateStaff="UPDATE staff SET FirstName=?,LastName=?,Academic_Qualification=?,Email=?,Phone_Number=?,Gender=? WHERE StaffID=?";
                
                String Fname=request.getParameter("FirstName");
                String Lname=request.getParameter("LastName");
                String AQ=request.getParameter("Academic_Qualification");
                String email=request.getParameter("Email");
                String PhoneNum=request.getParameter("Phone_number");
                String Gender=request.getParameter("Gender");
                String staffID=request.getParameter("id");
                
                PreparedStatement ps=con.prepareStatement(UpdateStaff);
                ps.setString(1, Fname);
                ps.setString(2, Lname);
                ps.setString(3, AQ);
                ps.setString(4, email);
                ps.setString(5, PhoneNum);
                ps.setString(6, Gender);
                ps.setString(7, staffID);
                ps.executeUpdate();
                
                request.setAttribute("UpdateMessage","Successfully Updated");
                RequestDispatcher RD= request.getRequestDispatcher("ViewStaffPage.jsp");
                RD.forward(request, response);
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
