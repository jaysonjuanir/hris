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
public class ManagerList extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerList() {
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
        HttpSession session = request.getSession(false);

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        if (session != null) {
            System.out.println("MainPage \"Service\" method(inherited) called");
            System.out.println("MainPage \"DoGet\" method called");

            if (action.equals("logout")) {
                session.invalidate();
                response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage"));
            } else if (action.equals("editEmployee")) {
                List<Employee> employees = new Service().getEmployees();
                int employeeId = (int) session.getAttribute("id");

                Employee thisEmployee = new Service().getEmployeeById(employeeId);
                response.setContentType("text/html");
                response.setStatus(HttpServletResponse.SC_OK);
                request.setAttribute("errors", request.getParameter("errors"));
                request.setAttribute("employee", thisEmployee);
                request.setAttribute("employees", employees);
                request.getRequestDispatcher("/WEB-INF/managerEditEmployee.jsp").forward(request, response);
            }else if(action.equals("editBulletin")){
                List<Bulletin> bulletin = new Service().getBulletin();
                int employeeId = (int) session.getAttribute("id");

                Employee thisEmployee = new Service().getEmployeeById(employeeId);
                request.setAttribute("emp", thisEmployee);
                response.setContentType("text/html");
                response.setStatus(HttpServletResponse.SC_OK);
                request.setAttribute("bulletin", bulletin);
                request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
            }else {
                Integer employeeLevel = (Integer) session.getAttribute("level");
                if (employeeLevel == null) {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage?message=not-logged-in"));
                } else if (employeeLevel == 2) {
                    try {
                        Name name = new Name("Jennifer", "T", "Marcos");
                        Address address = new Address("378 E. Marcos St.", "Coloong", "Valenzuela City");
                        Employee employee = new Employee(name, address, "09496324385", 1, "General Manager", null, null);
                        //new Service().executeCreateEmployee(employee);

                        List<Employee> employees = new Service().getEmployees();
                        int employeeId = (int) session.getAttribute("id");

                        Employee thisEmployee = new Service().getEmployeeById(employeeId);
                        response.setContentType("text/html");
                        response.setStatus(HttpServletResponse.SC_OK);
                        request.setAttribute("employee", thisEmployee);
                        request.setAttribute("employees", employees);
                        List bulletin = new Service().getBulletin();
                        request.setAttribute("bulletin", bulletin);
                        //response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/TestSessionServlet"));
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    request.getRequestDispatcher("/WEB-INF/manager.jsp").forward(request, response);
                } else {
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Employee"));
                }
            }
            
        } else {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/HomePage?message=not logged in"));
        }
        //storeInSessionAndRespond(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            String streetName = request.getParameter("streetName");
            String barangay = request.getParameter("barangay");
            String city = request.getParameter("city");
            String contact = request.getParameter("contact");
            String position = request.getParameter("position");
            
            String bulletinType = request.getParameter("bulletinType");
            String bulletinSubject = request.getParameter("bulletinSubject");
            String bulletinMessage = request.getParameter("bulletinMessage");
            String employeeName = request.getParameter("employeeName");
            
            String action = request.getParameter("action");
            if (action.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Employee employee = new Service().getEmployeeById(id);

                Name name = new Name(firstName, middleName, lastName);
                Address address = new Address(streetName, barangay, city);

                employee.setName(name);
                employee.setAddress(address);
                employee.setContact(contact);
                employee.setPosition(position);

                new Service().executeUpdatedEmployee(employee);
                
                List<Employee> employees = new Service().getEmployees();
                

                response.setContentType("text/html");
                response.setStatus(HttpServletResponse.SC_OK);
                //request.setAttribute("errors", request.getParameter("errors"));
                request.setAttribute("employees", employees);
                String message = "Successful in Updating an Employee";
                request.setAttribute("message", message);
                request.getRequestDispatcher("/WEB-INF/managerEditEmployee.jsp").forward(request, response);
            } else if (action.equals("add")) {
                String username=request.getParameter("username");
                System.out.println(username);
                boolean checkUsername = new Service().checkUsername(username) == 0;
                
                String password=request.getParameter("password");
                String password2=request.getParameter("password2");
                boolean checkPassword = password.equals(password2);
                
                boolean indicator = true;
                if(firstName.isEmpty() || middleName.isEmpty() || lastName.isEmpty() || streetName.isEmpty() || barangay.isEmpty() || city.isEmpty() || contact.isEmpty() || position.isEmpty()){
                    indicator = false;
                }
                
                System.out.println(checkUsername + " and " + checkPassword + " and " + indicator);
                if(checkUsername && checkPassword && indicator){
                    Name name = new Name(firstName, middleName, lastName);
                    Address address = new Address(streetName, barangay, city);
                    Employee employee = new Employee();
                    employee.setName(name);
                    employee.setAddress(address);
                    employee.setContact(contact);
                    employee.setPosition(position);

                    int empId = new Service().executeCreateEmployeeWithAccount(employee);
                    
                    Account account = new Account(username, password, 1, empId);
                    
                    new Service().addAccount(account);
                    
                    List<Employee> employees = new Service().getEmployees();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    //request.setAttribute("errors", request.getParameter("errors"));
                    request.setAttribute("employees", employees);
                    String message = "Successful in Creating an Employee";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("/WEB-INF/managerEditEmployee.jsp").forward(request, response);
                }
                else{
                    List error = new ArrayList();
                    if(!checkUsername){
                        error.add("Username already taken");
                    }
                    if(!checkPassword){
                        error.add("Password dont match");
                    }
                    if(!indicator){
                        error.add("Missing required fields");
                    }
                    
                    List<Employee> employees = new Service().getEmployees();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    //request.setAttribute("errors", request.getParameter("errors"));
                    request.setAttribute("employees", employees);
                    request.setAttribute("errors", error);
                    request.getRequestDispatcher("/WEB-INF/managerEditEmployee.jsp").forward(request, response);
                }
            } else if(action.equals("delete")){
                int id = Integer.parseInt(request.getParameter("id"));
                Employee employee = new Service().getEmployeeById(id);
                new Service().deleteEmployee(employee);
                List<Employee> employees = new Service().getEmployees();


                response.setContentType("text/html");
                response.setStatus(HttpServletResponse.SC_OK);
                //request.setAttribute("errors", request.getParameter("errors"));
                request.setAttribute("employees", employees);
                request.setAttribute("message", "Success in deleting an employee");
                request.getRequestDispatcher("/WEB-INF/managerEditEmployee.jsp").forward(request, response);
            } else if(action.equals("addBulletin")){
                boolean indicator = true;
                if(bulletinMessage.isEmpty() || bulletinSubject.isEmpty() || bulletinType.isEmpty() || employeeName.isEmpty()){
                    indicator = false;
                }
                
                if(indicator){
                    Bulletin bulletin = new Bulletin();
                    //bulletinMessage, bulletinSubject, bulletinType, employeeName
                    bulletin.setBulletinSubject(bulletinSubject);
                    bulletin.setBulletinType(bulletinType);
                    bulletin.setMessage(bulletinMessage);
                    bulletin.setEmployeeName(employeeName);
                    bulletin.setId(0);
                    
                    new Service().executeCreateBulletin(bulletin);
                    List<Bulletin> bulletin1 = new Service().getBulletin();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    request.setAttribute("message", "Bulletin Added Successfully");
                    request.setAttribute("bulletin", bulletin1);
                    request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
                }
                else{
                    List error = new ArrayList();
                    if(!indicator){
                        error.add("Missing required fields");
                    }
                    
                    List<Bulletin> bulletin = new Service().getBulletin();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    //request.setAttribute("errors", request.getParameter("errors"));
                    request.setAttribute("bulletin", bulletin);
                    request.setAttribute("errors", error);
                    request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
                }
            } else if(action.equals("deleteBulletin")){
                int id = Integer.parseInt(request.getParameter("id"));
                Bulletin bulletin = new Service().getBulletinById(id);
                new Service().deleteEmployee(bulletin);
                
                List<Bulletin> bulletin1 = new Service().getBulletin();


                response.setContentType("text/html");
                response.setStatus(HttpServletResponse.SC_OK);
                //request.setAttribute("errors", request.getParameter("errors"));
                request.setAttribute("bulletin", bulletin1);
                request.setAttribute("message", "Bulletin deleted successfully");
                request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
            } else if(action.equals("updateBulletin")){
                boolean indicator = true;
                if(bulletinMessage.isEmpty() || bulletinSubject.isEmpty() || bulletinType.isEmpty() || employeeName.isEmpty()){
                    indicator = false;
                }
                
                if(indicator){
                    int id = Integer.parseInt(request.getParameter("id"));
                    Bulletin bulletin = new Service().getBulletinById(id);
                    //bulletinMessage, bulletinSubject, bulletinType, employeeName
                    bulletin.setBulletinSubject(bulletinSubject);
                    bulletin.setBulletinType(bulletinType);
                    bulletin.setMessage(bulletinMessage);
                    bulletin.setEmployeeName(employeeName);
                    //bulletin.setId(0);
                    
                    new Service().executeCreateBulletin(bulletin);
                    List<Bulletin> bulletin1 = new Service().getBulletin();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    request.setAttribute("message", "Bulletin Updated Successfully");
                    request.setAttribute("bulletin", bulletin1);
                    request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
                }
                else{
                    List error = new ArrayList();
                    if(!indicator){
                        error.add("Missing required fields");
                    }
                    
                    List<Bulletin> bulletin = new Service().getBulletin();


                    response.setContentType("text/html");
                    response.setStatus(HttpServletResponse.SC_OK);
                    //request.setAttribute("errors", request.getParameter("errors"));
                    request.setAttribute("bulletin", bulletin);
                    request.setAttribute("errors", error);
                    request.getRequestDispatcher("/WEB-INF/managerEditBulletin.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
