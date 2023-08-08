package com.quiz.QuizWebApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.models.Admin;
import com.quiz.QuizWebApplication.service.AdminService;

import jakarta.servlet.http.HttpSession;
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	@RequestMapping("/aregister")
	public String aregister(@ModelAttribute Admin a) {
		service.aregister(a);
		return "alogin";
		
	}
	
	@RequestMapping("/Code")
	public String code(@RequestParam("Code") String code) {
		return service.code(code);
	}
	
	@RequestMapping("/AdminValidation")
	public String validation(@RequestParam("E-mail") String email,@RequestParam("password") String pass,HttpSession session) {
		return service.validation(email, pass,session);
	}

}
