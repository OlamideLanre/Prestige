/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author TM
 */
@WebServlet(name = "PaymentAdd", urlPatterns = {"/PaymentAdd"})
public class PaymentAdd extends HttpServlet {
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
                
                String insert = "INSERT INTO Payments (StudentName, Method_of_Payment, DatePaid, Semester, ClearedPayment, OutStanding, ID) VALUE (?, ?, ?, ?, ?, ?, ?)";
                
                
                String studentName = request.getParameter("StudentName");
                String methodOfPayment = request.getParameter("Method_of_Payment");
                String datePaid = request.getParameter("DatePaid");
                String semester = request.getParameter("Semester");
                String clearedPayment = request.getParameter("ClearedPayment");
                int outstanding = Integer.valueOf(request.getParameter("OutStanding"));
                String id = request.getParameter("ID");
                
                try (PreparedStatement ps = connection.prepareStatement(insert)) {
                    if (!studentName.isEmpty() && !methodOfPayment.isEmpty() && !datePaid.isEmpty() && !semester.isEmpty() && !clearedPayment.isEmpty() && outstanding != 0 && !id.isEmpty()) {
                        ps.setString(1, studentName);
                        ps.setString(2, methodOfPayment);
                        ps.setString(3, datePaid);
                        ps.setString(4, semester);
                        ps.setString(5, clearedPayment);
                        ps.setInt(6, outstanding);
                        ps.setString(7, id);
                        
                        
                     ps.executeUpdate();
                    response.sendRedirect("ViewPayment.jsp");
                    }
                else{
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
