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
@WebServlet(name = "SingUpPs", urlPatterns = {"/SingUpPs"})
public class SingUpPs extends HttpServlet {
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
                
                String insert="INSERT INTO admins(FullName,Email,Phone,Gender,Admin_Password) VALUES (?,?,?,?,?)";
                
                String fullName=request.getParameter("fullname");
                String Email=request.getParameter("email");
                String phone=request.getParameter("phoneNum");
                String gender=request.getParameter("gender");
                String password=request.getParameter("adminpass");
                
                try(PreparedStatement ps = con.prepareStatement(insert)) {
                    if (!"".equals(fullName) && !"".equals(Email) && !"".equals(phone) && !"".equals(gender) && !"".equals(password)) {
                    ps.setString(1, fullName);
                    ps.setString(2, Email);
                    ps.setString(3, phone);
                    ps.setString(4, gender);
                    ps.setString(5, password);
                    
                    ps.executeUpdate();
                    
                    response.sendRedirect("signinpagePS.html");
                    } else {
                        out.write("All fields are required");
                    }
                   
                    
//                    String select= "select * from admins";
//                    try(PreparedStatement ps1=con.prepareStatement(select)) {
//                        ResultSet rs= ps1.executeQuery();
//                        if (rs.next()) {
//                            out.write("success");
//                        } else {
//                            out.write("failed to fetch");
//                        }
//                        
//                    } catch (SQLException ex) {
//                        System.out.println(ex);
//                    }
                    
                } catch (SQLException e) {
                    System.out.println(e);
                }
                
            } catch (Exception e) {
                System.out.println(e);
            }
            
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SingUpPs</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SingUpPs at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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
