package com.system.web;

import com.system.service.*;
import com.system.model.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.io.*;
import java.lang.NumberFormatException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class MainPage
 */
public class EmployeeList extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeList() {
        System.out.println("MainPage Constructor called!");
    }

    /**
     * @see Servlet#init(ServletConfig)
     */
    public void init(ServletConfig config) throws ServletException {
        System.out.println("MainPage \"Init\" method called");
    }

    /**
     * @see Servlet#destroy()
     */
    public void destroy() {
        System.out.println("MainPage \"Destroy\" method called");
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        
        String action = request.getParameter("action");
        if(action==null)
            action="";
            
        
        if(session!=null){
            System.out.println("MainPage \"Service\" method(inherited) called");
            System.out.println("MainPage \"DoGet\" method called");
            
            if(action.equals("logout")){
                session.invalidate();  
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage"));
            }else{
                Integer employeeLevel = (Integer) session.getAttribute("level");
                if(employeeLevel==null){
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage?message=not-logged-in"));
                }else if(employeeLevel==1){
                    try {
                        Name name = new Name("Jennifer", "T", "Marcos");
                        Address address = new Address("378 E. Marcos St.", "Coloong", "Valenzuela City");
                        Employee employee = new Employee(name, address, "09496324385", 1, "General Manager", null, null);
                        //new Service().executeCreateEmployee(employee);

                        List<Employee> employees = new Service().getEmployees();
                        int employeeId = (int)session.getAttribute("id");
                        
                        Employee thisEmployee = new Service().getEmployeeById(employeeId);
                        response.setContentType("text/html");
                        response.setStatus(HttpServletResponse.SC_OK);
                        request.setAttribute("employee", thisEmployee);
                        
                        List bulletin = new Service().getBulletin();
                        request.setAttribute("bulletin", bulletin);
                        
                        //response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/TestSessionServlet"));
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    request.getRequestDispatcher("/WEB-INF/employee.jsp").forward(request, response);
                }else{
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Manager"));
                }
                
            }
        }else{
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage?message=not logged in"));
        }
        //storeInSessionAndRespond(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
}
