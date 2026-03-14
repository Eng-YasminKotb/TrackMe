package com.app.dao;

import com.app.entity.StudySession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudySessionDAOImpl implements StudySessionDAO {
    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void save(StudySession studySession) {
        Session session = sessionFactory.getCurrentSession();
        session.save(studySession);
    }

    @Override
    public List<StudySession> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from StudySession", StudySession.class).getResultList();
    }

    @Override
    public StudySession findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        StudySession studySession = session.get(StudySession.class, id);
        return studySession;
    }

    @Override
    public void update(StudySession studySession) {
        Session session = sessionFactory.getCurrentSession();
        session.update(studySession);
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        StudySession studySession = session.get(StudySession.class, id);
        session.delete(studySession);
    }
}
