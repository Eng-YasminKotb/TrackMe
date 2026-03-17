package com.app.controller;

import com.app.entity.StudySession;
import com.app.service.StudySessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class StudySessionController {

    @Autowired
    private StudySessionService studySessionService;

    @GetMapping(value = "/")
    public String homePage(){
        return "homePage";
    }

    @Transactional
    @GetMapping("/addSession")
    public String showAddSessionForm(Model model){
        model.addAttribute("studySession", new StudySession());
        return "addSession";
    }


    @PostMapping(value = "/addSession")
    public String addDailyStudySession(StudySession studySession, Model model){
        studySessionService.save(studySession);
        model.addAttribute("studySession", studySession);
        model.addAttribute("submitted", true);
        return "addSession";
    }

    @GetMapping(value = "/showDailyStats")
    public String showDailyStats(Model model){
        List<StudySession> sessions = studySessionService.findAll();
        model.addAttribute("sessions", sessions);
        return "showDailyStats";
    }



}
