package com.holidays.service;

import com.holidays.entity.User;
import com.holidays.entity.UserRole;
import com.holidays.hibernate.HibernateORM;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    public void addUser(User user) {

        Session session = HibernateORM.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    User getUserByLogin(String login) {
        Session session = HibernateORM.getSessionFactory().openSession();
        User appUser = null;
        try {
            session.beginTransaction();
            Query query = session.createQuery("from User where login=:login");
            query.setParameter("login", login);
            appUser = (User) query.uniqueResult();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return appUser;
    }

    @SuppressWarnings("unchecked")
    public UserRole findById(int id) {
        Session session = HibernateORM.getSessionFactory().openSession();
        return (UserRole) session.load(UserRole.class, id);
    }

    public boolean isUserUnique(String login) {
        User user = getUserByLogin(login);
        return (user == null);
    }

    @SuppressWarnings("unchecked")
    public UserRole findRoleById(int id){
        Session session = HibernateORM.getSessionFactory().openSession();

        return (UserRole) session.load(UserRole.class, id);
    }
    public static void main(String[] args){

        UserService service = new UserService();
        User user = service.getUserByLogin("ddd");
        for(UserRole role : user.getUserRoles()){
            System.out.println("ROLE_"+role.getType()+"  "+ role.getId());
        }

    }
}
