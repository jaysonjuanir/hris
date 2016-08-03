package com.system.dao;

/**
 * Hello world!
 *
 */


import com.system.util.*;
import com.system.model.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Projections;
import java.util.*;

public class EmployeeDao 
{
    Session session;
    Transaction transac;

    public void addEmployee(Employee employee){
            //UtilSession utilSession = new UtilSession();
            session = UtilSession.getSessionFactory().openSession();
            session.beginTransaction();

            session.save(employee);
            session.getTransaction().commit();
            System.out.println("EMPLOYEE CREATED!!");
            session.close();
    }
    public List<Employee> getEmployees(){
            session = UtilSession.getSessionFactory().openSession();
            List<Employee> employee = null;
            try{
                    employee = session.createCriteria(Employee.class).addOrder( Order.asc("id") )
                            .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
            }catch(HibernateException hex){
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
            return employee;
    }
    public void updateEmployee(Employee employee){
            session = UtilSession.getSessionFactory().openSession();
            try{
                    transac = session.beginTransaction();

                    session.update(employee);
                    transac.commit();
                    System.out.println("PERSON UPDATED!");
            }catch(HibernateException hex){
                    if(transac!=null)
                            transac.rollback();
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
    }
    public void deleteEmployee(Employee deleteThisEmployee){
            session=UtilSession.getSessionFactory().openSession();
            try{
                    transac = session.beginTransaction();
                    session.delete(deleteThisEmployee);
                    transac.commit();
                    System.out.println("PERSON DELETED!!");
            }catch(HibernateException hex){
                    if(transac!=null)
                            transac.rollback();
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
    }
    public Employee getEmployeeById(int id){
            session = UtilSession.getSessionFactory().openSession();
            Employee thisEmployee = (Employee)session.get(Employee.class, id);
            session.close();
            return thisEmployee; 
    }
}
