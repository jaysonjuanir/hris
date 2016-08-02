package com.system.dao;

/**
 * Hello world!
 *
 */


import com.system.model.*;
import com.system.util.*;
import java.util.*;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class AccountDao 
{
	Session session;
	Transaction transac;
	public int verifyAccount(String user, String pass){
		session = UtilSession.getSessionFactory().openSession();
		session.beginTransaction();
//                Criteria criteria = session.createCriteria(Account.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//                criteria.add(Restrictions.eq("username",user));
//                criteria.add(Restrictions.eq("password",pass));
//                Criteria.forClass(Account.class.getEmployeeId())
//                .add(Restrictions.gt("user", user))
//                .add(Restrictions.gt("pass", pass))
//                .setProjection(Projections.property("employeeId"))
//                ;
                
//                String hql="from "+Account.class.getSimpleName()+" a where a.username = 'user' and a.password= 'pass'";
//                Query query = session.createQuery(hql);
                //query.setParameter("user", user);
                //query.setParameter("pass", pass);
                //Account acc = getAccount(user,pass);
                Object id = session.createCriteria(Account.class)
                .add(Restrictions.eq("username",user))
                .add(Restrictions.eq("password",pass))
                .setProjection(Projections.property("employeeId"))
                .uniqueResult();
                int result = 0;
                if(id!=null){
                    result = (int) id;
                }
//                .add(Restrictions.eq("username",user))
//                .add(Restrictions.eq("password",pass))
//                .setProjection(Projections.property("employeeId"))
//                .uniqueResult();
//                int resultEmployee = (int)session.createCriteria(Employee.class)
//                .add(Restrictions.eq("position","General Manager"))
//                .setProjection(Projections.property("accountId"))
//                .uniqueResult();
                //System.out.println(resultEmployee);
                List aw = session.createCriteria(Account.class).addOrder( Order.asc("id") )
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
                aw.forEach(System.out::println);
                System.out.println(result);
		session.close();
                int employeeId = result;//acc.getEmployeeId();
		return employeeId; 
	}
        public Account getAccount(String user, String pass){
		session = UtilSession.getSessionFactory().openSession();
		List<Employee> employee = null;
                Account account = null;
		try{
			account = (Account)session.createCriteria(Account.class).addOrder( Order.asc("id") )
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                                .add(Restrictions.eq("username",user))
                                .add(Restrictions.eq("password",pass))
                                .uniqueResult();
                        System.out.println(account);
		}catch(HibernateException hex){
			hex.printStackTrace();
		}finally{
			//session.close();
		}
		return account;
	}
}
