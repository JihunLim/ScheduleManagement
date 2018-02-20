package com.javalec.springEx3.dto;

public class client_taskDto {

	private String ctk_userId;
	private String ctk_taskName;
	private String ctk_answerId;
	private String ctk_date;
	

	

	public String getCtk_userId() {
		return ctk_userId;
	}


	public void setCtk_userId(String ctk_userId) {
		this.ctk_userId = ctk_userId;
	}


	public String getCtk_taskName() {
		return ctk_taskName;
	}


	public void setCtk_taskName(String ctk_taskName) {
		this.ctk_taskName = ctk_taskName;
	}


	public String getCtk_answerId() {
		return ctk_answerId;
	}


	public void setCtk_answerId(String ctk_answerId) {
		this.ctk_answerId = ctk_answerId;
	}


	public String getCtk_date() {
		return ctk_date;
	}


	public void setCtk_date(String ctk_date) {
		this.ctk_date = ctk_date;
	}


	public client_taskDto() {} //생성자

	//select 할 때에는 생성자를 아래와 같이 만들어줘야 함.
	public client_taskDto(String ctk_userId, String ctk_taskName, String ctk_answerId, String ctk_date) {
		super();
		this.ctk_userId = ctk_userId;
		this.ctk_taskName = ctk_taskName;
		this.ctk_answerId = ctk_answerId;
		this.ctk_date = ctk_date;
	}
	

	

	
}
