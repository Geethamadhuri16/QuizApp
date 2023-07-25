package com.quiz.QuizWebApplication.models;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity

public class Questions {
	@Id
	
    private String id;
	
	private String language;
	private String difficulty;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String Rightans;
	public Questions() {
    	String id = UUID.randomUUID().toString();
        this.setId(id);
    }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getRightans() {
		return Rightans;
	}
	public void setRightans(String rightans) {
		Rightans = rightans;
	}
	@Override
	public String toString() {
		return "Questions [id=" + id + ", language=" + language + ", difficulty=" + difficulty + ", question="
				+ question + ", option1=" + option1 + ", option2=" + option2 + ", option3=" + option3 + ", option4="
				+ option4 + ", Rightans=" + Rightans + "]";
	}
	
	
	
	

}
