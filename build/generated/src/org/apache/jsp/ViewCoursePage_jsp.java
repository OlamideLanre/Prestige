package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ViewCoursePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>View Course Page</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./styles/viewcoursepage.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <nav>\n");
      out.write("                <div class=\"left\">\n");
      out.write("                    <a class=\"btn\" href=\"./coursepage.html\"><div class=\"logout\"> <i class=\"fa fa-arrow-left\" aria-hidden=\"true\" style=\"color: #222;\"></i>    Back</div></a>\n");
      out.write("                </div>\n");
      out.write("                <div style=\"width: 300px;\" class=\"middle\">\n");
      out.write("                    <h2>VIEW COURSE PAGE</h2>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"right\">\n");
      out.write("                    <img style=\"width: 100px;\" src=\"./images/logo2.png\" alt=\"logo\">\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <div class=\"boxes\">\n");
      out.write("                <div class=\"inner-content\">\n");
      out.write("                    <div class=\"dashboard\">\n");
      out.write("                        <h1>Courses</h1>\n");
      out.write("                        ");

                            try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String jointSelect="SELECT c.Name,c.CourseID,s.StaffID,c.deptID from staff s join course c where c.deptID=s.StaffDeptID";
                             
                             PreparedStatement ps = con.prepareStatement(jointSelect);
                             ResultSet rs= ps.executeQuery();
                             
                             out.print("<div class='table-container'>");
                              out.print("<table>");
                              out.print("<thead>");
                              out.print("<tr>");
                              out.print("<th>Course Name</th>");
                              out.print(" <th>Course ID</th>");
                              out.print("<th>Staff ID</th>");
                              out.print("<th>Department ID</th>");
                              out.print("<th>Action</th>");
                              out.print("</tr>");
                              out.print("</thead>");
                              out.print("<tbody>");
                              
                             while (rs.next()) {                                     
                                    int Courseid=rs.getInt("CourseID");
                                      String courseName= rs.getString("Name");
                                      String staffID=rs.getString("StaffID");
                                      String deptID= rs.getString("deptID");
                                      out.print("<tr>");
                                      out.print("<td>"+ courseName + "</td>");
                                      out.print("<td>"+staffID+"</td>");
                                      out.print("<td>"+staffID+"</td>");
                                      out.print("<td>"+Courseid+"</td>");
                                      out.print("<td>");
                                      out.print(" <a class='edit' href='edit.jsp?id="+ Courseid +"'>Edit</a>");
                                      out.print("<a class='delete' href='#'>Delete</a>");
                                      out.print("</td>");
                                      out.print("</tr>");
                                 }
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                        
                        
      out.write("\n");
      out.write("<!--                        <div class=\"table-container\">\n");
      out.write("                            <table>\n");
      out.write("                                <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Course name</th>\n");
      out.write("                                    <th>Course ID</th>\n");
      out.write("                                    <th>Staff ID</th>\n");
      out.write("                                    <th>Departmet ID</th>\n");
      out.write("                                    <th>Action</th>\n");
      out.write("                                </tr>\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Blog 1</td>\n");
      out.write("                                    <td>1</td>\n");
      out.write("                                    <td>4</td>\n");
      out.write("                                    <td>01</td>\n");
      out.write("                                    <td>\n");
      out.write("                                    <a class=\"edit\" href=\"addcoursepage.html\">Edit</a>\n");
      out.write("                                    <a class=\"delete\" href=\"#\">Delete</a>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>Blog 2</td>\n");
      out.write("                                    <td>1</td>\n");
      out.write("                                    <td>4</td>\n");
      out.write("                                    <td>01</td>\n");
      out.write("                                    <td>\n");
      out.write("                                    <a class=\"edit\" href=\"addcoursepage.html\">Edit</a>\n");
      out.write("                                    <a class=\"delete\" href=\"#\">Delete</a>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                -->\n");
      out.write("                                <!-- Add more rows as needed -->\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
