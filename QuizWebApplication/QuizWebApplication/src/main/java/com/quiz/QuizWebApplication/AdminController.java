package com.quiz.QuizWebApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.models.Admin;

import jakarta.servlet.http.HttpSession;
@Controller
public class AdminController {
	@Autowired
	private AdminRepo repo;
	
	@RequestMapping("/aregister")
	public String aregister(@ModelAttribute Admin a) {
		repo.save(a);
		return "alogin";
		
	}
	
	@RequestMapping("/Code")
	public String code(@RequestParam("Code") String code) {
		if(Admin.code.equals(code)) {
			return "asignup";
		}else {
			return "asignup";
		}
	}
	
	@RequestMapping("/AdminValidation")
	public String validation(@RequestParam("E-mail") String email,@RequestParam("password") String pass,HttpSession session) {
		Admin a=repo.findByEmail(email);
		if(a.getAdminPassword().equals(pass)) {
			session.setAttribute("username", a.getAdminName());
			session.setAttribute("admin", "true");
			
			return "Adminportal";
		}else {
			return "alogin";
		}
	}

}
