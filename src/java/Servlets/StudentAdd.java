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
@WebServlet(name = "StudentAdd", urlPatterns = {"/StudentAdd"})
public class StudentAdd extends HttpServlet {

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
                
                String studentInsert="INSERT INTO Students (StudentID, Firstname, Lastname, StuDepID, DOB, regnNumber, email, phoneNumber,Semester)\n" +
"VALUES (?,?,?,?,?,?,?,?,?)";
                
                 String StudID=request.getParameter("studID");
                String Fname=request.getParameter("FirstName");
                String Lname=request.getParameter("LastName");
                int DepNo=Integer.valueOf(request.getParameter("dept"));
                String dob=request.getParameter("DOB");
                String reg=request.getParameter("regNum");
                String email=request.getParameter("Email");
                String PhoneNum=request.getParameter("Phone_number");
                String Semester=request.getParameter("Sem");
                
                PreparedStatement ps=con.prepareStatement(studentInsert);
                 ps.setString(1, StudID);
                ps.setString(2, Fname);
                ps.setString(3, Lname);
                ps.setInt(4, DepNo);
                ps.setString(5, dob);
                ps.setString(6, reg);
                ps.setString(7, email);
                ps.setString(8, PhoneNum);
                ps.setString(9, Semester);
//                ps.setString(9, ID);
                    System.out.println(reg);
                ps.executeUpdate();
                request.setAttribute("SuccessMessage","Successfully Added Information");
                  RequestDispatcher RD= request.getRequestDispatcher("ViewStudents.jsp");
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
