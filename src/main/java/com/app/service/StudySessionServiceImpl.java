package com.app.service;

import com.app.dao.StudySessionDAO;
import com.app.entity.StudySession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudySessionServiceImpl implements StudySessionService {

    @Autowired
    private StudySessionDAO studySessionDAO;


    @Override
    public void save(StudySession studySession) {
        studySessionDAO.save(studySession);
    }

    @Override
    public List<StudySession> findAll() {
        return studySessionDAO.findAll();
    }

    @Override
    public StudySession findById(int id) {
        return studySessionDAO.findById(id);
    }

    @Override
    public void update(StudySession studySession) {
        studySessionDAO.update(studySession);
    }

    @Override
    public void delete(int id) {
        studySessionDAO.delete(id);
    }

    @Override
    public double calculateQualityScore(int focusScore, int productivityScore) {
        return (focusScore + productivityScore) / 2.0;
    }
}
