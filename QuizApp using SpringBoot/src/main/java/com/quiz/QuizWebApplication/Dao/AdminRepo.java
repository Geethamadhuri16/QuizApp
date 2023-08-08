package com.quiz.QuizWebApplication.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.QuizWebApplication.models.Admin;

public interface AdminRepo extends JpaRepository<Admin, String> {
	public Admin findByEmail(String email);

}
