package com.javalec.springEx3.dto;

public class treeDto {
	private int id;
	private String name; //트리 이름
	
	 public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public treeDto() {} //생성자
}
