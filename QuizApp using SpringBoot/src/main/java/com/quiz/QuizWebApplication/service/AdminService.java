package com.quiz.QuizWebApplication.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.QuizWebApplication.Dao.AdminRepo;
import com.quiz.QuizWebApplication.models.Admin;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {
	@Autowired
	private AdminRepo repo;
	
	
	public void aregister( Admin a) {
		repo.save(a);
		
	}
	
	
	public String code(String code) {
		if(Admin.code.equals(code)) {
			return "asignup";
		}else {
			return "index";
		}
	}
	
	
	public String validation(String email, String pass,HttpSession session) {
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
