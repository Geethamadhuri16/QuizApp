package com.quiz.QuizWebApplication;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.quiz.QuizWebApplication.models.Questions;

public interface QuizRepo extends JpaRepository<Questions, String> {
	public List<Questions> findByLanguage(String language);
	@Query("from Questions where language=:lang and difficulty=:diffi")
	public List<Questions> find(@Param("lang") String language,@Param("diffi") String difficulty);
	
}
