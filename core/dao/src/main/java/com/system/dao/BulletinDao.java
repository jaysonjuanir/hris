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

public class BulletinDao {

    Session session;
    Transaction transac;

    public void addBulletin(Bulletin bulletin) {
        //UtilSession utilSession = new UtilSession();
        session = UtilSession.getSessionFactory().openSession();
        session.beginTransaction();

        session.saveOrUpdate(bulletin);
        session.getTransaction().commit();
        System.out.println("BULLETIN CREATED!!");
        session.close();
    }
    public List<Bulletin> getBulletin(){
            session = UtilSession.getSessionFactory().openSession();
            List<Bulletin> bulletin = null;
            try{
                    bulletin = session.createCriteria(Bulletin.class).addOrder( Order.desc("id") )
                            .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
            }catch(HibernateException hex){
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
            return bulletin;
    }
    public void updateBulletin(Bulletin bulletin){
            session = UtilSession.getSessionFactory().openSession();
            try{
                    transac = session.beginTransaction();

                    session.update(bulletin);
                    transac.commit();
                    System.out.println("bulletin UPDATED!");
            }catch(HibernateException hex){
                    if(transac!=null)
                            transac.rollback();
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
    }
    public void deleteBulletin(Bulletin bulletin){
            session=UtilSession.getSessionFactory().openSession();
            try{
                    transac = session.beginTransaction();
                    session.delete(bulletin);
                    transac.commit();
                    System.out.println("bulletin DELETED!!");
            }catch(HibernateException hex){
                    if(transac!=null)
                            transac.rollback();
                    hex.printStackTrace();
            }finally{
                    session.close();
            }
    }
    public Bulletin getBulletinById(int id){
            session = UtilSession.getSessionFactory().openSession();
            Bulletin bulletin = (Bulletin)session.get(Bulletin.class, id);
            session.close();
            return bulletin; 
    }
}
