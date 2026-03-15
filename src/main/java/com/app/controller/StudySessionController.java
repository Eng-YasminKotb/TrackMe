package com.app.controller;

import com.app.entity.StudySession;
import com.app.service.StudySessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @GetMapping("/addSession")
    public String showAddSessionForm(){
        return "addDailyStudySession";
    }


    @PostMapping(value = "/addSession")
    public String addDailyStudySession(StudySession studySession){
        studySessionService.save(studySession);
        return "redirect:/addSession";
    }

    @GetMapping(value = "/returnHomePage")
    public String showDailyStats(Model model){
        List<StudySession> sessions = studySessionService.findAll();
        model.addAttribute("sessions", sessions);
        return "showDailyStats";
    }



}
