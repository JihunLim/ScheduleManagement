package com.javalec.springEx3.dto;

public class task_contentDto {
	
	private int tc_id;
	private String tc_taskName;
	private String tc_time;
	private String tc_gps;
	private int tc_content1;
	private int tc_content2;
	private int tc_feel1;
	private int tc_feel2;
	private int tc_feelDetail;
	private String userId;
	
	public task_contentDto( String tc_taskName, String tc_time, String tc_gps, int tc_content1,
			int tc_content2, int tc_feel1, int tc_feel2, int tc_feelDetail, String userId) {
		super();
		this.tc_taskName = tc_taskName;
		this.tc_time = tc_time;
		this.tc_gps = tc_gps;
		this.tc_content1 = tc_content1;
		this.tc_content2 = tc_content2;
		this.tc_feel1 = tc_feel1;
		this.tc_feel2 = tc_feel2;
		this.tc_feelDetail = tc_feelDetail;
		this.userId = userId;
	}

	public int getTc_id() {
		return tc_id;
	}

	public void setTc_id(int tc_id) {
		this.tc_id = tc_id;
	}

	public String getTc_taskName() {
		return tc_taskName;
	}

	public void setTc_taskName(String tc_taskName) {
		this.tc_taskName = tc_taskName;
	}

	public String getTc_time() {
		return tc_time;
	}

	public void setTc_time(String tc_time) {
		this.tc_time = tc_time;
	}

	public String getTc_gps() {
		return tc_gps;
	}

	public void setTc_gps(String tc_gps) {
		this.tc_gps = tc_gps;
	}

	public int getTc_content1() {
		return tc_content1;
	}

	public void setTc_content1(int tc_content1) {
		this.tc_content1 = tc_content1;
	}

	public int getTc_content2() {
		return tc_content2;
	}

	public void setTc_content2(int tc_content2) {
		this.tc_content2 = tc_content2;
	}

	public int getTc_feel1() {
		return tc_feel1;
	}

	public void setTc_feel1(int tc_feel1) {
		this.tc_feel1 = tc_feel1;
	}

	public int getTc_feel2() {
		return tc_feel2;
	}

	public void setTc_feel2(int tc_feel2) {
		this.tc_feel2 = tc_feel2;
	}

	public int getTc_feelDetail() {
		return tc_feelDetail;
	}

	public void setTc_feelDetail(int tc_feelDetail) {
		this.tc_feelDetail = tc_feelDetail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public task_contentDto() {} //»ý¼ºÀÚ
	
	
	
}
