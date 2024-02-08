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
import javax.servlet.RequestDispatcher;

/**
 *
 * @author TM
 */
@WebServlet(name = "DepartmentAdd", urlPatterns = {"/DepartmentAdd"})
public class DepartmentAdd extends HttpServlet {
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
                
                String insert = "INSERT INTO department(DepartmentName, FacultyID) VALUES (?,?)";
                
                String departmentname = request.getParameter("DepartmentName");
                int facultyid = Integer.valueOf(request.getParameter("FacultyID"));
                
                try (PreparedStatement ps = con.prepareStatement(insert)) {
                    if (!departmentname.isEmpty() && facultyid != 0) {
                        ps.setString(1, departmentname);
                        ps.setInt(2,facultyid);
                        
                        ps.executeUpdate();
                    request.setAttribute("SuccessMessage","Successfully Added Information");
                  RequestDispatcher RD= request.getRequestDispatcher("ViewDepartmentPage.jsp");
                  RD.forward(request, response);
                    }else{
                        System.err.println("All fields are required");
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
