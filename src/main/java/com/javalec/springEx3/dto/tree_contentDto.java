package com.javalec.springEx3.dto;

public class tree_contentDto {

	private int id; //Ʈ�� �� ���� ���̵� 
	private int pid; //Ʈ�� �� ���� �θ� ���̵�
	private int tree_id; //Ʈ��1,Ʈ��2...
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
