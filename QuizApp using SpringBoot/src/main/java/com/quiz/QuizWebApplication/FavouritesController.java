package com.quiz.QuizWebApplication;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.QuizWebApplication.models.Favourites;
import com.quiz.QuizWebApplication.models.Questions;
import com.quiz.QuizWebApplication.service.FavouritesService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FavouritesController {
	@Autowired
	private FavouritesService service;
	@RequestMapping("/favourites")
	public String fav(Model m,HttpSession session) {
		return service.fav(m, session);
		
		
	}
	@RequestMapping("/addtofavourites")
	public void addToFav( @RequestBody Map<String, String> requestBodyMap,HttpSession session) {
		service.addToFav(requestBodyMap, session);	
	}
	
	@RequestMapping("/deletefromfav")
	public String del(@RequestBody Map<String, String> requestBodyMap,HttpSession session) {
		return service.del(requestBodyMap, session);
	}

}
