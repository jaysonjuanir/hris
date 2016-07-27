package com.system.service;

/**
 * Hello world!
 *
 */


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import com.system.util.UtilSession;
import com.system.model.*;
import com.system.dao.*;
import java.util.*;
public class Service
{
	EmployeeDao employeeDao = new EmployeeDao();
	
    
	public void executeCreateEmployee(Employee employee){
		employeeDao.addEmployee(employee);
	}
	public void executeUpdatedEmployee(Employee employee){
		employeeDao.updateEmployee(employee);	
	}
	public void deleteEmployee(Employee deleteEmployee){
		employeeDao.deleteEmployee(deleteEmployee);
	}
	public Employee getEmployeeById(int employeeId){
		return employeeDao.getEmployeeById(employeeId);
	}
	public List<Employee> getEmployees(){
		return employeeDao.getEmployees();
	}
}
