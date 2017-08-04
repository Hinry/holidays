package com.holidays.service;

import com.holidays.entity.Holiday;
import com.holidays.hibernate.HibernateORM;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class HolidayService {

    public Holiday getHolidayById(int id){
        Session session = HibernateORM.getSessionFactory().openSession();
        return (Holiday) session.load(Holiday.class, id);
    }

    public void addHoliday(Holiday holiday){
        Session session = HibernateORM.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(holiday);
            session.getTransaction().commit();
        }catch (RuntimeException e){
            e.printStackTrace();
        }finally {
            session.flush();
            session.close();
        }
    }

    public int getHolidaysBeetweenDates(String fromDate, String toDate){

        int holidays = 0;
        Session session = HibernateORM.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            String queryString = "from Holiday where date >= :fromDate and date <= :toDate";
            Query query = session.createQuery(queryString);

            query.setString("fromDate", fromDate);
            query.setString("toDate", toDate);
            holidays = query.list().size();
        }catch (RuntimeException e){
            e.printStackTrace();
        }finally {
            session.flush();
            session.close();
        }
        return holidays;
    }
}
