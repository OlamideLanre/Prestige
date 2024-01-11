package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class FacultyUpdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Add Faculty Page</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./styles/addfacultypage.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <nav>\n");
      out.write("                <div class=\"left\">\n");
      out.write("                    <a class=\"btn\" href=\"./facultypage.html\"><div class=\"logout\"> <i class=\"fa fa-arrow-left\" aria-hidden=\"true\" style=\"color: #222;\"></i>    Back</div></a>\n");
      out.write("                </div>\n");
      out.write("                <div style=\"width: 200px;\" class=\"middle\">\n");
      out.write("                    <h2>ADD FACULTY</h2>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"right\">\n");
      out.write("                    <img style=\"width: 100px;\" src=\"./images/logo2.png\" alt=\"logo\">\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <div class=\"boxes\">\n");
      out.write("                <form method=\"POST\" action=\"FacultyAdd\">\n");
      out.write("                <div class=\"inner-content\">\n");
      out.write("                    <div class=\"left\">\n");
      out.write("                        \n");
      out.write("                             ");

                             Class.forName("com.mysql.cj.jdbc.Driver");
                            
                             String JDBC_URL="jdbc:mysql://localhost:3306/realworlddb";
                             String JDBC_USER="root";
                             String JDBC_PASSWORD="";
                             
                             int id=Integer.valueOf(request.getParameter("FacultyID"));
                             System.out.println(id);
                             
                             Connection con=DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
                             
                             String FacQuery="SELECT * FROM faculty where FacultyID="+id+"";
                             PreparedStatement ps=con.prepareStatement(FacQuery);
                             ResultSet rs= ps.executeQuery();
                             while (rs.next()) {
                                 int FacID= rs.getInt("FacultyID");
                                 String Name= rs.getString("FacultyName");
                                 
                                 out.write("<h5>Faculty Name</h5>");
                                 out.write("<input type='text' name='FacultyName' id='FacultyName' value="+Name+">");
                                 out.write("<h5>Faculty ID</h5>");
                                 out.write("<input type='text' name='FacultyID' id='FacultyID' value="+FacID+">");
//                                 out.print("<input type='hidden' id='id' name='id' value="+id+">");
                                 }
                    
                    
      out.write("\n");
      out.write("                        \n");
      out.write("<!--                        <h5>Faculty ID</h5>\n");
      out.write("                        <input type=\"text\" name=\"FacultyID\" id=\"FacultyID\">-->\n");
      out.write("                        <!--<button type=\"submit\" style=\"margin-top: 10px;\" id=\"btn\" class=\"addbtn\">ADD</button>-->\n");
      out.write("                        <button type=\"submit\" style=\"margin-top: 10px;\" id=\"btn\" class=\"updatebtn\">UPDATE</button>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"right\">\n");
      out.write("                        <img style=\"width: 270px;\" src=\"./images/business-3d-woman-recruiter-leaning-on-browser-window-with-man-showing-v-sign-inside.png\" alt=\"\">\n");
      out.write("                    </div>\n");
      out.write("                   \n");
      out.write("     \n");
      out.write("               </div>\n");
      out.write("\n");
      out.write("               </form>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("<!--     <script>\n");
      out.write("        let SubmitBtn = document.querySelector(\".addbtn\");\n");
      out.write("        let UpdateBtn = document.querySelector(\".updatebtn\");\n");
      out.write("\n");
      out.write("            SubmitBtn.addEventListener(\"click\", handler);\n");
      out.write("            UpdateBtn.addEventListener(\"click\", handler);\n");
      out.write("\n");
      out.write("            function handler() {\n");
      out.write("                let FacultyName = document.getElementById(\"FacultyName\");\n");
      out.write("\n");
      out.write("                if (FacultyName.value === \"\") {\n");
      out.write("                    alert(\"All fields are required !\");\n");
      out.write("                    \n");
      out.write("//                    e.preventDefault();\n");
      out.write("                }else{\n");
      out.write("                    console.log('configuration successful');\n");
      out.write("                    alert('Added succesfully')\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("\n");
      out.write("    </script>-->\n");
      out.write("</body>\n");
      out.write("</html>");
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
