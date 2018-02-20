package com.javalec.springEx3.dto;

public class client_userDto { //내담자 정보
	
	private String cuser_id;
	private String cuser_password;
	private String cuser_name;
	private String cuser_gender;
	private String cuser_email;
	private int cuser_age;
	private String cuser_phone;
	private String cuser_birth;
	private String cuser_manager;
	private int cuser_tracking;
	private String cuser_home;
	

	public String getCuser_id() {
		return cuser_id;
	}

	public void setCuser_id(String cuser_id) {
		this.cuser_id = cuser_id;
	}

	public String getCuser_password() {
		return cuser_password;
	}

	public void setCuser_password(String cuser_password) {
		this.cuser_password = cuser_password;
	}

	public String getCuser_name() {
		return cuser_name;
	}

	public void setCuser_name(String cuser_name) {
		this.cuser_name = cuser_name;
	}

	public String getCuser_gender() {
		return cuser_gender;
	}

	public void setCuser_gender(String cuser_gender) {
		this.cuser_gender = cuser_gender;
	}

	public String getCuser_email() {
		return cuser_email;
	}

	public void setCuser_email(String cuser_email) {
		this.cuser_email = cuser_email;
	}

	public int getCuser_age() {
		return cuser_age;
	}

	public void setCuser_age(int cuser_age) {
		this.cuser_age = cuser_age;
	}

	public String getCuser_phone() {
		return cuser_phone;
	}

	public void setCuser_phone(String cuser_phone) {
		this.cuser_phone = cuser_phone;
	}

	public String getCuser_birth() {
		return cuser_birth;
	}

	public void setCuser_birth(String cuser_birth) {
		this.cuser_birth = cuser_birth;
	}

	public String getCuser_manager() {
		return cuser_manager;
	}

	public void setCuser_manager(String cuser_manager) {
		this.cuser_manager = cuser_manager;
	}

	public int getCuser_tracking() {
		return cuser_tracking;
	}

	public void setCuser_tracking(int cuser_tracking) {
		this.cuser_tracking = cuser_tracking;
	}

	public String getCuser_home() {
		return cuser_home;
	}

	public void setCuser_home(String cuser_home) {
		this.cuser_home = cuser_home;
	}

	public client_userDto() {} //생성자

	public client_userDto(String cuser_id) {
		// TODO Auto-generated constructor stub
		this.cuser_id=cuser_id;
	}
	
	
	
}
