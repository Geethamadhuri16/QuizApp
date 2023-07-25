package com.quiz.QuizWebApplication.models;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class User {
	@Id
	private String uid;
	private String username;
	private String password;
	private String email;
	private String mobilenum;
	public User() {
		String id = UUID.randomUUID().toString();
        this.setUid(id);
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobilenum() {
		return mobilenum;
	}
	public void setMobilenum(String mobilenum) {
		this.mobilenum = mobilenum;
	}
	
	

}
