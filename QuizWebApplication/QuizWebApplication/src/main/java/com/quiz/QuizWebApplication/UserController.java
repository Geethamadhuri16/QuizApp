package com.quiz.QuizWebApplication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.models.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserRepo repo;
	@RequestMapping("/")
	public String Index() {
		return "index";
	}
	@RequestMapping("/register")
	public String Register(@ModelAttribute User u) {
		repo.save(u);
		return "login";
	}
	
	@RequestMapping("/validation")
	public String validateUser(@RequestParam("E-mail") String email,@RequestParam("password") String password,HttpSession session) {
		User u=repo.findByEmail(email);
		if(u.getPassword().equals(password)) {
			session.setAttribute("uid", u.getUid());
			session.setAttribute("logged", "true");
			session.setAttribute("username", u.getUsername());
			return "index";
		}else {
			return "login";
		}
		
	}
	
	

}
