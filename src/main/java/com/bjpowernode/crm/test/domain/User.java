package com.bjpowernode.crm.test.domain;

public class User {
	private String id         ;
	private String login_name       ;
	private String login_pwd    ;
	private String real_name    ;
	private String email      ;
	private String last_login_time      ;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String id, String login_name, String login_pwd, String real_name, String email,
			String last_login_time) {
		super();
		this.id = id;
		this.login_name = login_name;
		this.login_pwd = login_pwd;
		this.real_name = real_name;
		this.email = email;
		this.last_login_time = last_login_time;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", login_name=" + login_name + ", login_pwd=" + login_pwd + ", real_name=" + real_name
				+ ", email=" + email + ", last_login_time=" + last_login_time + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_pwd() {
		return login_pwd;
	}
	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}
	
	
	
}
