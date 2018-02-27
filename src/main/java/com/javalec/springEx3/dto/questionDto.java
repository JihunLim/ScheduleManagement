package com.javalec.springEx3.dto;

public class questionDto {
	private String que_id;
	private String que_method;
	private String que_settingVal;
	private String que_createDate;
	
	public questionDto() {}

	public String getQue_id() {
		return que_id;
	}

	public void setQue_id(String que_id) {
		this.que_id = que_id;
	}

	public String getQue_method() {
		return que_method;
	}

	public void setQue_method(String que_method) {
		this.que_method = que_method;
	}

	public String getQue_settingVal() {
		return que_settingVal;
	}

	public void setQue_settingVal(String que_settingVal) {
		this.que_settingVal = que_settingVal;
	}

	public String getQue_createDate() {
		return que_createDate;
	}

	public void setQue_createDate(String que_createDate) {
		this.que_createDate = que_createDate;
	}
	
	
	
}
