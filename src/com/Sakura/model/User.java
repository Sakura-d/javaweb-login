package com.Sakura.model;

public class User {
	private String username;
	private int id;
	private String password;
	private String email;
	public User(int id,String username, String password, String email) {
		super();
		this.id=id;
		this.username = username;
		this.password = password;
		this.email= email;
	}

	public User() {
		super();
	}

	public int getid(){
		return id;
	}
	public void setid(int id){this.id=id;}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
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



}
