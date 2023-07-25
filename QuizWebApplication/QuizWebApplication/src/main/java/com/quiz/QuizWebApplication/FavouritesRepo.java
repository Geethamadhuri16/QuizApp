package com.quiz.QuizWebApplication;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.QuizWebApplication.models.Favourites;

public interface FavouritesRepo extends JpaRepository<Favourites, String> {
	public List<Favourites> findByUid(String uid);

}
