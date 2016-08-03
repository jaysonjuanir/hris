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
public class HomePage extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePage() {
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
        try {
            HttpSession session = request.getSession(false);
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }

            List bulletin = new Service().getBulletin();
            request.setAttribute("bulletin", bulletin);
            if (session == null) {
                System.out.println("MainPage \"Service\" method(inherited) called");
                System.out.println("MainPage \"DoGet\" method called");
                //response.sendRedirect(request.getContextPath()+"/HomePage");
                request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
            } else {
                Integer employeeLevel = (Integer) session.getAttribute("level");
                if (employeeLevel == null) {
                    request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

                } else if (employeeLevel == 1) {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Employee"));
                } else {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Manager"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        System.out.println("Username: " + user + " Password: " + pass);
        System.out.println("MainPage \"Service\" method(inherited) called");
        System.out.println("MainPage \"DoPost\" method called");

        try {
//            Name name = new Name("Jennifer", "T", "Marcos");
//            Address address = new Address("378 E. Marcos St.", "Coloong", "Valenzuela City");
//            Employee employee = new Employee(name, address, "09496324385", 1, "General Manager", null, null);
//            //new Service().executeCreateEmployee(employee);
//
//            List<Employee> employees = new Service().getEmployees();
            user = request.getParameter("user");
            pass = request.getParameter("pass");
            //Account a = new Service().getAccount(user,pass);
            int id = new Service().verifyAccount(user, pass);
            Account ac = new Service().getAccount(user, pass);
            System.out.println("checking account:");
            System.out.println(ac);
            System.out.println("checking id:");
            System.out.println(id);
            
            List bulletin = new Service().getBulletin();
            request.setAttribute("bulletin", bulletin);
            
            response.setContentType("text/html");
            response.setStatus(HttpServletResponse.SC_OK);
            if (ac == null) {
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage?message=invalid-username-or-password"));
            } else {
                HttpSession session = request.getSession(); //session initialization
                session.setAttribute("id", ac.getEmployeeId());
                session.setAttribute("level", ac.getLevel());
                if (ac.getLevel() == 1) {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Employee"));
                } else if (ac.getLevel() == 2) {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Manager"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
}
