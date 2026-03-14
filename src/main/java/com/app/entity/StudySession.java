package com.app.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "study_sessions")
@Setter
@Getter
@NoArgsConstructor
public class StudySession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "study_area")
    private String studyArea;

    @Column(name = "duration_minutes")
    private int durationMinutes;

    @Column(name = "productivity_score")
    private int productivityScore;

    @Column(name = "achievement")
    private String achievement;

    @Column(name = "date")
    private Date date;
}
