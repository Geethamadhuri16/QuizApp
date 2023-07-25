package com.quiz.QuizWebApplication.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Favourites {
	@Id
	private String qid;
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	private String uid;

}
