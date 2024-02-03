/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TM
 */
@WebServlet(name = "StudentsDelete", urlPatterns = {"/StudentsDelete"})
public class StudentsDelete extends HttpServlet {


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
                
//                if (true) {
                       String deleteData="DELETE FROM students WHERE StudentID=?";
                String id=request.getParameter("id");
                PreparedStatement ps=connection.prepareStatement(deleteData);
                ps.setString(1, id);
                ps.executeUpdate();
                request.setAttribute("ErrorMessage","Success");
                    RequestDispatcher RD= request.getRequestDispatcher("ViewStudents.jsp");
                    RD.forward(request, response);
//                response.sendRedirect("ViewStudents.jsp");
//                } else {
//                    request.setAttribute("ErrorMessage","Failed to delete,Try again.");
//                    RequestDispatcher RD= request.getRequestDispatcher("ViewStudents.jsp");
//                    RD.forward(request, response);
//                }
                request.setAttribute("ErrorMessage","Success");
                RequestDispatcher ReD= request.getRequestDispatcher("ViewStudents.jsp");
                ReD.forward(request, response);
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