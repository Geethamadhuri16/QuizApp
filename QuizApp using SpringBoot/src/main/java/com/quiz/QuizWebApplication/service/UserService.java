package com.quiz.QuizWebApplication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.Dao.UserRepo;
import com.quiz.QuizWebApplication.models.User;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {

	@Autowired
	private UserRepo repo;
	
	public String Index() {
		return "index";
	}
	
	public String Register(@ModelAttribute User u) {
		repo.save(u);
		return "login";
	}
	
	
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
