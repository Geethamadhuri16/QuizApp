package com.quiz.QuizWebApplication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.QuizWebApplication.models.Submissions;

import jakarta.servlet.http.HttpSession;

@Controller
public class SubmissionsController {
	@Autowired
	private SubmissionRepo repo;
	@RequestMapping("/mysubmissions")
	public String mysubmissions(HttpSession session,Model m) {
		//System.out.println("vachanayya");
		//System.out.println("entayya");
		List<Submissions> mysub=repo.findByUid(session.getAttribute("uid").toString());
		//System.out.println(mysub);
		session.setAttribute("allmysubmissions", mysub);
		return "mysubmissions";
		
	}

}
