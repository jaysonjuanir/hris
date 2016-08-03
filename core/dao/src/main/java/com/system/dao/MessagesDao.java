/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.system.dao;

/**
 *
 * @author user
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
public class MessagesDao {
    Session session;
    Transaction transac;
    
    public void createMessage(Messages message){
        session = UtilSession.getSessionFactory().openSession();
        session.beginTransaction();

        session.save(message);
        session.getTransaction().commit();
        System.out.println("MESSAGE CREATED!!");
        session.close();
    }
    public void deleteMessage(Messages message){
            session=UtilSession.getSessionFactory().openSession();
            try{
                    transac = session.beginTransaction();
                    session.delete(message);
                    transac.commit();
                    System.out.println("MESSAGE DELETED!!");
            }catch(HibernateException hex){
                    if(transac!=null)
                            transac.rollback();
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
    }
    public List<Messages> getMessagesById(int id){
        session = UtilSession.getSessionFactory().openSession();
        
        List<Messages> message = null;
        try{
                message = session.createCriteria(Messages.class).addOrder( Order.asc("id") )
                        .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                        .add(Restrictions.eq("receiver",id))
                        .list();
                System.out.println(message);
        }catch(HibernateException hex){
                hex.printStackTrace();
        }finally{
                //session.close();
        }
        return message;
    }
}
