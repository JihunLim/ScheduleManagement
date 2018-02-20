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
    
  //������(ȯ��)���� ����ϱ�
 
    public List<client_userDto> selectClientMemberDao(String id);
   
    
    //�Ʒ� �ڵ�� ������ ���̵� ������ �� ���̵� ����� ��ġ���� ��θ� ����ϱ� ����
    public List<gpsDto> selectGpsDataDao(String id);
    
    
    //�Ʒ� �ڵ�� ��� ������ ���� ���
    public List<client_userDto> selectAllClientMemberDao();
    
    //����Ʈ��ŷ ���� ������ ���� ���
    public List<client_userDto> selectTrackClientMemberDao();
    
  //����Ʈ��ŷ ���� �ʴ� ������ ���� ���
    public List<client_userDto> selectNotTrackClientMemberDao();
    
    //Ʈ��ŷ ���� ����-> Ʈ��ŷ �������� ����
    public void updateTrackClientDaoTrue(String id);
    
  //Ʈ��ŷ ���� ����-> Ʈ��ŷ ������ ����
    public void updateTrackClientDaoFalse(String id);
  
    //��� ���� ���� ���
    public List<taskDto> selectAllTaskDao();

    //���� ���� ���� 
    public void deleteTaskDao(String name);
    
    //�ش� ���̵� ������ ��� ���� ���� ���
    public List<client_taskDto> selectTaskInClientDao(String id);
    
    //�ȵ���̵�κ��� ���� gps data�� db�� ����
    public void insertGpsDao(gpsDto data);
    
    //�ȵ���̵�κ��� ���� ���� ������ db�� ���� (�ȵ���̵� ���� �亯 ���� �����ϴ°����� ����)
    public void insertTaskContentDao(task_contentDto data);

    //������ ��ϵ� ��� ���� ���� ���
    public List<task_contentDto> selectAllTaskInfo(String taskID);
    
    //������ ���̵� ���ؼ� ����� ���� ���
    public List<userDto> selectManagerInfo(String clientId);
    
    //�ش� ���̵��� Ʈ��ŷ ���� ������ ���
    public int selectCuserTracking(String cuserId);
    
    //�ش� ���̵��� �ش� ���� ����
    public void deleteTaskClientDao(Map data);
    
    //�ش� ���̵��� �ش� ���� �ο�
    public void insertTaskClientDao(Map data);
    
    //�� ���� db�� �����Ű��
    public void insertNewTask(Map data);
    
    //ȸ������ �ϱ�
	public void insertUserDao(userDto user);
	//������ ���� �������ֱ�
	public void insertClientUserDao(client_userDto client_user);
	
	//��ü Ʈ�� ��� �ҷ�����
	public List<treeDto> selectAllTreeDao();
	
	//Ư�� Ʈ�� ������ �ҷ�����
	public List<tree_contentDto> selectTreeDao(int tree_id);
}
