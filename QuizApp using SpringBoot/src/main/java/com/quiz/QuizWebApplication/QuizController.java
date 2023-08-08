package com.quiz.QuizWebApplication;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.QuizWebApplication.models.Questions;
import com.quiz.QuizWebApplication.models.Submissions;
import com.quiz.QuizWebApplication.service.QuizService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class QuizController {
	@Autowired
	private QuizService service;
	
	@RequestMapping("/add")
	public String add(@ModelAttribute Questions q) {
		return service.add(q);
		
	}
	
	
	@RequestMapping("/getQuestions")
	public List<Questions> getQuestions(){
		return service.getQuestions();
	}
	
	@RequestMapping("/byjavaLanguage")
	public String byLanguage(Model m){
		return service.byjsLanguage(m);

	}
	
	@RequestMapping("/bypythonLanguage")
	public String byPLanguage(Model m){
		return service.byPLanguage(m);
	}
	
	@RequestMapping("/byjsLanguage")
	public String byjsLanguage(Model m){
	
		return service.byjsLanguage(m);
	}
	@RequestMapping("/javauser")
	public String javauser(Model m){
		return service.javauser(m);
	}
	
	@RequestMapping("/pythonuser")
	public String pythonuser(Model m){
		return service.pythonuser(m);
	}
	
	@RequestMapping("/jsuser")
	public String jsuser(Model m){
		return service.jsuser(m);
	}
	
	@RequestMapping("/easyandjava")
	public String byDifficulty(Model m){
		return service.byDifficulty(m);
	}
	@RequestMapping("/mediumandjava")
	public String bymDifficulty(Model m){
		return service.bymDifficulty(m);
	}
	@RequestMapping("/hardandjava")
	public String byhDifficulty(Model m){
		return service.byhDifficulty(m);
	}
	@RequestMapping("/easyandpython")
	public String bypDifficulty(Model m){
		return service.bypDifficulty(m);
	}
	@RequestMapping("/mediumandpython")
	public String bympDifficulty(Model m){
		return service.bympDifficulty(m);
	}
	@RequestMapping("/hardandpython")
	public String byhpDifficulty(Model m){
		return service.byhpDifficulty(m);
	}
	@RequestMapping("/easyandjs")
	public String byjsDifficulty(Model m){
		return service.byjsDifficulty(m);
	}
	@RequestMapping("/mediumandjs")
	public String bymjsDifficulty(Model m){
		return service.bymjsDifficulty(m);
	}
	@RequestMapping("/hardandjs")
	public String byhjsDifficulty(Model m){
		return service.byhjsDifficulty(m);
	}
	
	@RequestMapping("/deleteQuestion")
	public String delete(@RequestParam("id") String id) {
		return service.delete(id);
	}
	@RequestMapping("/submitQuiz")
	public String submitQuiz(HttpServletRequest request, Model model,HttpSession session) {
	   return service.submitQuiz(request, model, session);
	}
//	@RequestMapping("/rightans")
//	public String rightans(@RequestParam("id") String id) {
//		Questions q=repo.getById(id);
//		return q.getRightans();
//		
//		
//	}
	@RequestMapping("/updateQuestion")
	public String updateQuestion(@RequestParam("id")String id,@ModelAttribute Questions updatedq) {
		return service.updateQuestion(id, updatedq);
	}
  	
	
	
	
	
	
	
	

}
