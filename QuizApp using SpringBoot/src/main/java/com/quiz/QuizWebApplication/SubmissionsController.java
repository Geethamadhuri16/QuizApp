package com.quiz.QuizWebApplication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.QuizWebApplication.models.Submissions;
import com.quiz.QuizWebApplication.service.SubmissionsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SubmissionsController {
	
	@Autowired
	private SubmissionsService service;
	@RequestMapping("/mysubmissions")
	public String mysubmissions(HttpSession session,Model m) {
		return service.mysubmissions(session, m);
		
		
	}

}
