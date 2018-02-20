package com.javalec.springEx3.dao;


import java.util.List;
import java.util.Map;

import com.javalec.springEx3.dto.client_taskDto;
import com.javalec.springEx3.dto.client_userDto;
import com.javalec.springEx3.dto.gpsDto;
import com.javalec.springEx3.dto.taskDto;
import com.javalec.springEx3.dto.task_contentDto;
import com.javalec.springEx3.dto.treeDto;
import com.javalec.springEx3.dto.tree_contentDto;
import com.javalec.springEx3.dto.userDto;




public interface ScheduleDAO {

	//public List<DeptDTO> selectDeptDao();
	
    /*
     * Member Dto 
     */
	public String selectNameDao(String id);
   
    public String selectNameHosDao(String id);
    
  //내담자(환자)정보 출력하기
 
    public List<client_userDto> selectClientMemberDao(String id);
   
    
    //아래 코드는 내담자 아이디를 받으면 그 아이디에 저장된 위치정보 모두를 출력하기 위함
    public List<gpsDto> selectGpsDataDao(String id);
    
    
    //아래 코드는 모든 내담자 정보 출력
    public List<client_userDto> selectAllClientMemberDao();
    
    //현재트래킹 중인 내담자 정보 출력
    public List<client_userDto> selectTrackClientMemberDao();
    
  //현재트래킹 하지 않는 내담자 정보 출력
    public List<client_userDto> selectNotTrackClientMemberDao();
    
    //트래킹 상태 변경-> 트래킹 시작으로 변경
    public void updateTrackClientDaoTrue(String id);
    
  //트래킹 상태 변경-> 트래킹 중지로 변경
    public void updateTrackClientDaoFalse(String id);
  
    //모든 과제 정보 출력
    public List<taskDto> selectAllTaskDao();

    //과제 정보 삭제 
    public void deleteTaskDao(String name);
    
    //해당 아이디가 가지는 모든 과제 정보 출력
    public List<client_taskDto> selectTaskInClientDao(String id);
    
    //안드로이드로부터 받은 gps data를 db에 삽입
    public void insertGpsDao(gpsDto data);
    
    //안드로이드로부터 받은 과제 내용을 db에 삽입 (안드로이드 과제 답변 형식 통일하는것으로 가정)
    public void insertTaskContentDao(task_contentDto data);

    //과제에 기록된 모든 과제 내용 출력
    public List<task_contentDto> selectAllTaskInfo(String taskID);
    
    //내담자 아이디 통해서 담당자 정보 출력
    public List<userDto> selectManagerInfo(String clientId);
    
    //해당 아이디의 트래킹 여부 정보를 출력
    public int selectCuserTracking(String cuserId);
    
    //해당 아이디의 해당 과제 삭제
    public void deleteTaskClientDao(Map data);
    
    //해당 아이디의 해당 과제 부여
    public void insertTaskClientDao(Map data);
    
    //새 과제 db에 저장시키기
    public void insertNewTask(Map data);
    
    //회원가입 하기
	public void insertUserDao(userDto user);
	//내담자 계정 생성해주기
	public void insertClientUserDao(client_userDto client_user);
	
	//전체 트리 목록 불러오기
	public List<treeDto> selectAllTreeDao();
	
	//특정 트리 데이터 불러오기
	public List<tree_contentDto> selectTreeDao(int tree_id);
}
