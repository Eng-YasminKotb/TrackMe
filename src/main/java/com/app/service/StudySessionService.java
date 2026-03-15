package com.app.service;

import com.app.entity.StudySession;

import java.util.List;

public interface StudySessionService {
    void save(StudySession studySession);
    List<StudySession> findAll();
    StudySession findById(int id);
    void update(StudySession studySession);
    void delete(int id);
    double calculateQualityScore(int focusScore, int productivityScore);
}
