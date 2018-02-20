package com.javalec.springEx3.dto;

public class userDto {
	 private String user_id;
	 private String user_pwd;
	 private String user_name;
	 private String user_sex;
	 private String user_email;
	 private String user_hospital;
	 private String user_role;
	 private String user_enabled;
	 
	
	 public userDto() {}
	
	
	 public userDto(String user_id, String user_pwd, String user_name, String user_sex, String user_email,
			String user_hospital) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_sex = user_sex;
		this.user_email = user_email;
		this.user_hospital = user_hospital;
	}
	 
	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pwd() {
		return user_pwd;
	}


	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_sex() {
		return user_sex;
	}


	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_hospital() {
		return user_hospital;
	}


	public void setUser_hospital(String user_hospital) {
		this.user_hospital = user_hospital;
	}

	public String getUser_role() {
		return user_role;
	}


	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}


	public String getUser_enabled() {
		return user_enabled;
	}


	public void setUser_enabled(String user_enabled) {
		this.user_enabled = user_enabled;
	}


	 
}
