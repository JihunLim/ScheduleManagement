package com.javalec.springEx3.dto;

public class tree_contentDto {

	private int id; //트리 안 원소 아이디 
	private int pid; //트리 안 원소 부모 아이디
	private int tree_id; //트리1,트리2...
	private String data;
	
	
	 public tree_contentDto() {}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public int getTree_id() {
		return tree_id;
	}


	public void setTree_id(int tree_id) {
		this.tree_id = tree_id;
	}


	public String getData() {
		return data;
	}


	public void setData(String data) {
		this.data = data;
	}
}
