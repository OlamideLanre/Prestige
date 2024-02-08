/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TM
 */
@WebFilter(filterName = "AccessFilter", urlPatterns = {"/DepartUpdate.jsp","/ViewCoursePage.jsp","/ViewDepartmentPage.jsp",
    "/ViewFacultyPage.jsp","/ViewPayment.jsp","/ViewStaffPage.jsp","/ViewStudents.jsp","/Dashboard.jsp"})
public class AccessFilter implements Filter {
    

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("in filter");
        HttpSession session = req.getSession(false);
        System.out.println("n filter");

        if (session != null) {
            if (session.getAttribute("adminID") != null) {
                chain.doFilter(request, response);
            }
            else{
                req.setAttribute("errorMessage", "Login to access page");
                req.getRequestDispatcher("SignInPs.jsp").include(request, response);
            }

        } else {
            System.out.println("admin is not logged in");
             if (session == null) {
                req.setAttribute("errorMessage", "Login to access page");
                req.getRequestDispatcher("SignInPs.jsp").include(request, response);
            }
//            req.setAttribute("errorMessage", "Loggin first");
//            req.getRequestDispatcher("SignInPs.jsp").include(request, response);
        }
           
        }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void destroy() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    }

    /**
     * Destroy method for this filter
     */
//    public void destroy() {
//    }
//
//    /**
//     * Init method for this filter
//     */
//    public void init(FilterConfig filterConfig) {
//
//    }

    
//}
