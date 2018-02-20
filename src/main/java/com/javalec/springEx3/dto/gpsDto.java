package com.javalec.springEx3.dto;

public class gpsDto {

	private String gps_id;
	private String gps_userId;
	private String gps_time;
	private String gps_posData;
	 
 public String getGps_id() {
		return gps_id;
	}
	public void setGps_id(String gps_id) {
		this.gps_id = gps_id;
	}
	public String getGps_userId() {
		return gps_userId;
	}
	public void setGps_userId(String gps_userId) {
		this.gps_userId = gps_userId;
	}
	public String getGps_time() {
		return gps_time;
	}
	public void setGps_time(String gps_time) {
		this.gps_time = gps_time;
	}
	public String getGps_posData() {
		return gps_posData;
	}
	public void setGps_posData(String gps_posData) {
		this.gps_posData = gps_posData;
	}
public gpsDto() {} //생성자
 public gpsDto(String gps_userId, String gps_time,String gps_posData) //안드로이드로부터 들어오는 위치 정보를 데이터 테이블에 저장
 { 
	 this.gps_userId=gps_userId;
	 this.gps_time=gps_time;
	 this.gps_posData=gps_posData;
 }
	



}
