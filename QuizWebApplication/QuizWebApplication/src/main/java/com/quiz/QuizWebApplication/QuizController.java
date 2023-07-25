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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class QuizController {
	@Autowired
	private QuizRepo repo;
	@Autowired
	private SubmissionRepo srepo;
	
	@RequestMapping("/add")
	public String add(@ModelAttribute Questions q) {
		repo.save(q);
		return "add";
		
	}
	
	
	@RequestMapping("/getQuestions")
	public List<Questions> getQuestions(){
		List<Questions> myQuestions=repo.findAll();
		return myQuestions;
	}
	
	@RequestMapping("/byjavaLanguage")
	public String byLanguage(Model m){
//		System.out.println("called");
		List<Questions> allQuestions=repo.findByLanguage("Java");
//		System.out.println(allQuestions);
		m.addAttribute("questions", allQuestions);
		return "myQuestions";
	}
	
	@RequestMapping("/bypythonLanguage")
	public String byPLanguage(Model m){
		List<Questions> allQuestions=repo.findByLanguage("Python");
		m.addAttribute("questions", allQuestions);
		return "myQuestions";
	}
	
	@RequestMapping("/byjsLanguage")
	public String byjsLanguage(Model m){
		List<Questions> allQuestions=repo.findByLanguage("Javascript");
		m.addAttribute("questions", allQuestions);
		return "myQuestions";
	}
	@RequestMapping("/javauser")
	public String javauser(Model m){
		System.out.println("called");
		List<Questions> allQuestions=repo.findByLanguage("Java");
		System.out.println(allQuestions);
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	
	@RequestMapping("/pythonuser")
	public String pythonuser(Model m){
		List<Questions> allQuestions=repo.findByLanguage("Python");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	
	@RequestMapping("/jsuser")
	public String jsuser(Model m){
		List<Questions> allQuestions=repo.findByLanguage("Javascript");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	
	@RequestMapping("/easyandjava")
	public String byDifficulty(Model m){
		List<Questions> allQuestions=repo.find("java", "easy");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/mediumandjava")
	public String bymDifficulty(Model m){
		List<Questions> allQuestions=repo.find("java", "medium");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/hardandjava")
	public String byhDifficulty(Model m){
		List<Questions> allQuestions=repo.find("java", "hard");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/easyandpython")
	public String bypDifficulty(Model m){
		List<Questions> allQuestions=repo.find("python", "easy");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/mediumandpython")
	public String bympDifficulty(Model m){
		List<Questions> allQuestions=repo.find("python", "medium");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/hardandpython")
	public String byhpDifficulty(Model m){
		List<Questions> allQuestions=repo.find("python", "hard");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/easyandjs")
	public String byjsDifficulty(Model m){
		List<Questions> allQuestions=repo.find("javascript", "easy");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/mediumandjs")
	public String bymjsDifficulty(Model m){
		List<Questions> allQuestions=repo.find("javascript", "medium");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	@RequestMapping("/hardandjs")
	public String byhjsDifficulty(Model m){
		List<Questions> allQuestions=repo.find("javascript", "hard");
		m.addAttribute("questions", allQuestions);
		return "chosen";
	}
	
	@RequestMapping("/deleteQuestion")
	public String delete(@RequestParam("id") String id) {
		repo.deleteById(id);
		return "DeleteQuestion";
	}
	@RequestMapping("/submitQuiz")
	public String submitQuiz(HttpServletRequest request, Model model,HttpSession session) {
	    // Retrieve the list of questions from the request attribute
		Submissions s=new Submissions();
		List<String> ques=new ArrayList<String>();
		List<String> uans=new ArrayList<String>();
		List<String> ans=new ArrayList<String>();
		
	    List<Questions> questionList = (List<Questions>) session.getAttribute("myquestions");
	  //  System.out.println(questionList);
	    int score = 0;
	    
	    if (questionList != null && !questionList.isEmpty()) {
	        for (Questions q : questionList) {
	            String userAnswer = request.getParameter(String.valueOf(q.getId())); // Get the selected answer for the question
	            uans.add(userAnswer);
	            String theques=q.getQuestion();
	            ques.add(theques);
	            String correctAnswer = q.getRightans(); // Assuming there's a method to get the correct option number (1, 2, 3, or 4) for each question
	            ans.add(correctAnswer);
//	            System.out.println(correctAnswer);
//	            System.out.println(userAnswer);
	            if (userAnswer != null && userAnswer.equals(correctAnswer)) {
	            	//System.out.println("called");
	                score++;
	            }
	        }
	        s.setUid(session.getAttribute("uid").toString());
	        s.setAllquestion(ques);
	        s.setAns(ans);
	        s.setUans(uans);
	        String sc=""+score;
	        s.setScore(sc);
	        srepo.save(s);
	        
	    }
	    
	    // Add the score to the model to display it in the view
	    session.setAttribute("total", questionList.size());
	    model.addAttribute("score", score);
	    
	    // Return the name of the view (JSP page) that will display the result.
	    return "result";
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
		Optional<Questions> optionalQuestion = repo.findById(id);
		Questions q = optionalQuestion.get();
//		System.out.println("called me");
//		System.out.println(q);
		q.setDifficulty(updatedq.getDifficulty());
		q.setLanguage(updatedq.getLanguage());
		q.setOption1(updatedq.getOption1());
		q.setOption2(updatedq.getOption2());
		q.setOption3(updatedq.getOption3());
		q.setOption4(updatedq.getOption4());
		q.setQuestion(updatedq.getQuestion());
		q.setRightans(updatedq.getRightans());
		repo.save(q);
		return "UpdateQuestion" ;
	}
  	
	
	
	
	
	
	
	

}
