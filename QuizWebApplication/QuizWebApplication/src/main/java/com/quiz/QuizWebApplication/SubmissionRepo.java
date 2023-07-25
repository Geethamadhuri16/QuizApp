package com.quiz.QuizWebApplication;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.QuizWebApplication.models.Submissions;


public interface SubmissionRepo extends JpaRepository<Submissions, String> {
	public List<Submissions> findByUid(String uid);

}
