package com.quiz.QuizWebApplication.models;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

@Entity
public class Submissions {
	@Id
	private String subId;
	private String subDate;
	private String uid;
	@ElementCollection
	private List<String> allquestion;
	@ElementCollection
	private List<String> uans;
	@ElementCollection
	private List<String> ans;
	public List<String> getAllquestion() {
		return allquestion;
	}
	public void setAllquestion(List<String> allquestion) {
		this.allquestion = allquestion;
	}
	public List<String> getUans() {
		return uans;
	}
	public void setUans(List<String> uans) {
		this.uans = uans;
	}
	public List<String> getAns() {
		return ans;
	}
	public void setAns(List<String> ans) {
		this.ans = ans;
	}


	

	private String score;
	public Submissions(){
		String id = UUID.randomUUID().toString();
		this.setSubId(id);
		LocalDateTime currentDateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = currentDateTime.format(formatter);
		this.setSubDate(formattedDateTime);

	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setSubDate(String date) {
		this.subDate=date;
		
		
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getSubDate() {
		return this.subDate;
	}


	public String getScore() {
		return score;
	}
	
	





}
