package com.quiz.QuizWebApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.models.User;
import com.quiz.QuizWebApplication.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@RequestMapping("/")
	public String Index() {
		return service.Index();
	}
	@RequestMapping("/register")
	public String Register(@ModelAttribute User u) {
		return service.Register(u);
	}
	
	@RequestMapping("/validation")
	public String validateUser(@RequestParam("E-mail") String email,@RequestParam("password") String password,HttpSession session) {
		return service.validateUser(email, password, session);
		
	}
	
	

}
