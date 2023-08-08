package com.quiz.QuizWebApplication.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.QuizWebApplication.models.User;



public interface UserRepo extends JpaRepository<User, String> {
	public User findByEmail(String email);

}
