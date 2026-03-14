package com.app.dao;

import com.app.entity.StudySession;

import java.util.List;

public interface StudySessionDAO {
    void save(StudySession studySession);
    List<StudySession> findAll();
    StudySession findById(int id);
    void update(StudySession studySession);
    void delete(int id);
}
