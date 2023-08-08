package com.quiz.QuizWebApplication.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.QuizWebApplication.Dao.FavouritesRepo;
import com.quiz.QuizWebApplication.Dao.QuizRepo;
import com.quiz.QuizWebApplication.models.Favourites;
import com.quiz.QuizWebApplication.models.Questions;

import jakarta.servlet.http.HttpSession;

@Service
public class FavouritesService {
	@Autowired
	private QuizRepo qrepo;
	@Autowired
	private FavouritesRepo repo;
	
	public String fav(Model m,HttpSession session) {
		List<Favourites> fav=repo.findByUid(session.getAttribute("uid").toString());
		List<Questions> userFavQues=new ArrayList<>();
		for(Favourites ufav:fav) {
			Questions q=qrepo.getById(ufav.getQid());
			userFavQues.add(q);
		}
		m.addAttribute("userFavQuestions", userFavQues);
		return "favourites";
		
		
	}
	
	public void addToFav( @RequestBody Map<String, String> requestBodyMap,HttpSession session) {
		String uid=session.getAttribute("uid").toString();
		 String qid = requestBodyMap.get("questionid");
		Favourites f=new Favourites();
		//System.out.println(qid);
		f.setQid(qid);
		f.setUid(uid);
		repo.save(f);
		
	}
	
	
	public String del(@RequestBody Map<String, String> requestBodyMap,HttpSession session) {
		String qid = requestBodyMap.get("questionid");
		repo.deleteById(qid);
		return "favourites";
	}
}
