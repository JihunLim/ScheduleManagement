package com.javalec.springEx3.dto;

public class taskDto {

	private String task_name;
	private int task_total; 
	private String task_startTime;
	private String task_endTime;
	private String task_madeTime;
	private String task_msg;
	private String task_day;
	private String task_queIds;
 
public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public int getTask_total() {
		return task_total;
	}

	public void setTask_total(int task_total) {
		this.task_total = task_total;
	}

	public String getTask_startTime() {
		return task_startTime;
	}

	public void setTask_startTime(String task_startTime) {
		this.task_startTime = task_startTime;
	}

	public String getTask_endTime() {
		return task_endTime;
	}

	public void setTask_endTime(String task_endTime) {
		this.task_endTime = task_endTime;
	}

	public String getTask_madeTime() {
		return task_madeTime;
	}

	public void setTask_madeTime(String task_madeTime) {
		this.task_madeTime = task_madeTime;
	}

	public String getTask_msg() {
		return task_msg;
	}

	public void setTask_msg(String task_msg) {
		this.task_msg = task_msg;
	}

	public String getTask_day() {
		return task_day;
	}

	public void setTask_day(String task_day) {
		this.task_day = task_day;
	}
	
	public String getTask_queIds() {
		return task_queIds;
	}

	public void setTask_queIds(String task_queIds) {
		this.task_queIds = task_queIds;
	}

public taskDto() {} //»ý¼ºÀÚ

}
