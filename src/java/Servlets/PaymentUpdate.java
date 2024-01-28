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
@WebServlet(name = "PaymentUpdate", urlPatterns = {"/PaymentUpdate"})
public class PaymentUpdate extends HttpServlet {

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
                
                String DeptUpdate="UPDATE payments SET StudentName=?,Method_of_Payment=?,DatePaid=?,Semester=?,ClearedPayment=?,OutStanding=? WHERE ID=?";
                String sName=request.getParameter("studentName");
                String MOP=request.getParameter("MOP");
                String DP=request.getParameter("date");
                String Sem=request.getParameter("semester");
                String CP=request.getParameter("cleared");
                String OutStand=request.getParameter("outstanding");
                String studID=request.getParameter("id");
                
                PreparedStatement ps=connection.prepareStatement(DeptUpdate);
                ps.setString(1, sName);
                ps.setString(2, MOP);
                ps.setString(3, DP);
                ps.setString(4, Sem);
                ps.setString(5, CP);
                ps.setString(6, OutStand);
                ps.setString(7, studID);
                ps.executeUpdate();
                System.out.println(Sem);
                response.sendRedirect("ViewPayment.jsp");
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
