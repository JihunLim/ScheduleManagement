package com.javalec.springEx3;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.springEx3.dao.ScheduleDAO;
import com.javalec.springEx3.dto.client_taskDto;
import com.javalec.springEx3.dto.client_userDto;
import com.javalec.springEx3.dto.gpsDto;
import com.javalec.springEx3.dto.taskDto;
import com.javalec.springEx3.dto.task_contentDto;
import com.javalec.springEx3.dto.treeDto;
import com.javalec.springEx3.dto.tree_contentDto;
import com.javalec.springEx3.dto.userDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/database.do") //database test page
	public String database(Model model) {
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			model.addAttribute("list", dao.selectNameDao("tpdud215"));
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "home";

	}
	
	@RequestMapping("/login") //login page
	public String login()
	{
		
		return "Member/login";
	}
	@RequestMapping("/loginForm") //login test page
	public String loginForm()
	{
		
		return "Member/loginForm";
	}
	
	@RequestMapping("/signup")  //member join page
	public String join()
	{
		
		return "Member/join";
	}

	@RequestMapping(value = {"/main"}, method = RequestMethod.GET)
	public String main(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			model.addAttribute("name", dao.selectNameHosDao("tpdud215"));
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "main";
	}
	
	
	@RequestMapping("/checkSignup") // ȸ�� �����ϴ� ������
	public String checkSignup(Model model, HttpServletRequest request)
	{
		String resultPage = "cmmn/saveSignUpSuccess";
		
			try {
				System.out.println("�̲ٿ���!");
				ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
				
				String user_id = request.getParameter("user_id");
				String user_pwd = pwdEncoder.encode(request.getParameter("user_pwd"));
				String user_name = request.getParameter("user_name");
				String user_sex = request.getParameter("user_sex");
				String user_email = request.getParameter("user_email");
				String user_hospital = request.getParameter("user_hospital");
	
				userDto user = new userDto(user_id, user_pwd, user_name, user_sex, user_email, user_hospital);
				dao.insertUserDao(user);
				
			}catch(Exception ex) {
				resultPage = "cmmn/saveSignUpFailure";
				System.out.println(ex.getMessage());
			}
			return resultPage;
	}	
	@RequestMapping("/ClientJoin") //form test page
	public String ClientJoin()
	{
		
		return "ClientManagement/ClientJoin";
	}
	@RequestMapping("/checkClientSignup") //form test page
	public String checkClientSignup()
	{
		
		return "Dashboard/Dashboard";
	}
	
	@RequestMapping("/IdCheckForm") //form test page
	public String IdCheckForm()
	{
		
		return "Member/IdCheckForm";
	}
	@RequestMapping("/form") //form test page
	public String form()
	{
		
		return "form";
	}
	
	@RequestMapping("/ClientTable") //���� ������ �����ϴ� ������
	public String ClientTable(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<client_userDto> cmDto= dao.selectAllClientMemberDao();
				model.addAttribute("list", cmDto);
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		
		return "ClientManagement/ClientTable";
	}
	
	@RequestMapping("/ViewClient")//������ �󼼺��� ������
	public String ViewClient(HttpServletRequest request,Model model)
	{
		String cuser_id="\0"; //����Ʈ ���̵� ��
		try {
					String search=request.getParameter("search");
					ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
					List<client_userDto> cmDto;
					List<client_taskDto> ctDto;
					List<taskDto> tDto;
					List<userDto> userDto;
					
					if(search!=null)
					{
						cmDto=dao.selectClientMemberDao(search);//Ư�� ������. ���Ŀ� list���ƴ� �ٸ��ɷ� ����
						ctDto=dao.selectTaskInClientDao(search); //��� ���� �� �����ڰ� �������� ����
						tDto= dao.selectAllTaskDao();  //������ ��� ���� 
						userDto=dao.selectManagerInfo(search);
						cuser_id=search; // ���߿� �߰����� ���� �������� �ش� ���̵� �� ����
					}
					else //���� �˻����� ���� ��� ����Ʈ�� hong123 ����
					{
						
						cmDto=dao.selectClientMemberDao("hong123");//Ư�� ������. ���Ŀ� list���ƴ� �ٸ��ɷ� ����
						ctDto=dao.selectTaskInClientDao("hong123"); //��� ���� �� �����ڰ� �������� ����
						 tDto= dao.selectAllTaskDao();  //������ ��� ���� 
						 userDto=dao.selectManagerInfo("hong123");
						 cuser_id="hong123";
					}
			
			
			model.addAttribute("list", cmDto);
			model.addAttribute("tasklist", tDto);
			model.addAttribute("ctlist",ctDto);
			model.addAttribute("userlist",userDto);
			
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "ClientManagement/ViewClient";
	}
	
	
	@RequestMapping("/DeleteTaskClient.do")//�ش� ���̵� �ش� ���� �ߴ�
	public String UpdateTaskClient(HttpServletRequest request, Model model)
	throws Exception {
		//String resultPage = "forward:/ViewClient.do";
		String resultPage = "cmmn/successDeleteTask";
		Map map = new HashMap();
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			String ctk_userId = request.getParameter("ctk_userId"); 
			String ctk_taskName=request.getParameter("ctk_taskName");
			
			System.out.println(ctk_userId+"+"+ctk_taskName);
			//dao.updateTrackClientDaoTrue(cuser_id);
			try {
			map.put("ctk_userId", ctk_userId);
			map.put("ctk_taskName",ctk_taskName);
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			dao.deleteTaskClientDao(map);
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping("/InsertTaskClient.do")//�ش� ���̵� �ش� ���� �ߴ�
	public String InsertTaskClient(HttpServletRequest request, Model model)
	throws Exception {
		//String resultPage = "forward:/ViewClient.do";
		String resultPage = "cmmn/successInsertTask";
		Map map = new HashMap();
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			String ctk_userId = request.getParameter("ctk_userId"); 
			String ctk_taskName=request.getParameter("ctk_taskName");
			
			System.out.println(ctk_userId+"+"+ctk_taskName);
			//dao.updateTrackClientDaoTrue(cuser_id);
			try {
			map.put("ctk_userId", ctk_userId);
			map.put("ctk_taskName",ctk_taskName);
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			dao.insertTaskClientDao(map);
		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping("/AddNewServey")//���ο� ���� �߰� ������
	public String AddNewServey()
	{
		
		return "SettingTask/AddNewServey";
	}
	
	@RequestMapping("/AddNewTask")//���ο� ���� �߰� ������
	public String AddNewTask()
	{
		
		return "SettingTask/AddNewTask";
	}
	
	
	@RequestMapping("/createNewSurvey.do")//�� ���� ���� ó�� ������(�Լ�)
	public String createNewSurvey(HttpServletRequest request, Model model)
	throws Exception {
		String resultPage = "cmmn/successCreateNewTask";
		Map taskSavedMap = new HashMap();
		try {
			int countTaskDay = 0;
			String tempStr = ""; //���� ���� 
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			//������ �ޱ�
			String taskName = request.getParameter("task_title"); 
			taskSavedMap.put("task_name", taskName);
			//���ù� �ޱ�
			String taskMsg = request.getParameter("task_msg");
			taskSavedMap.put("task_msg", taskMsg);
			//���� ���� ���� ����
			String[] taskDay = request.getParameterValues("task_day"); // �߰���ų
			for (String val : taskDay) {
				countTaskDay++;
				if(taskDay.length != countTaskDay)
					tempStr += val + ",";
				else
					tempStr += val;
			}
			taskSavedMap.put("task_day", tempStr);
			//���� ���� �ð� ���� task_createTime
			String taskCreateTime = request.getParameter("task_createYear")+"-"+request.getParameter("task_createMonth")+"-"+request.getParameter("task_createDay");
			taskSavedMap.put("task_startTime", taskCreateTime);
			//���� �Ҹ� ���� ����  task_expireDay
			String[] taskNonExpireDay = request.getParameterValues("task_nonExpireDay");
			System.out.println("�׽�Ʈ ���� " + taskNonExpireDay.length);
			if(taskNonExpireDay.length == 2) {
				//��ȿ ��¥�� �������� ���� ����̹Ƿ� 2999�� 12�� 31�Ϸ� ����(2999-12-31)
				taskSavedMap.put("task_endTime", "2999-12-31");
			}else {
				//��ȿ ��¥�� ������ ���
				String taskEndday = request.getParameter("task_expireYear")+"-"+request.getParameter("task_expireMonth")+"-"+request.getParameter("task_expireDay");
				taskSavedMap.put("task_endTime", taskEndday);
			}
			
			/*
			 * taskAllTitle : ���� title �� ������ �迭
			 * taskTotleNum : ���� �� ����
			 * arr_selectBox : ������ ���� �亯 ����� ������ �迭
			 * arr_taskAnchorNum : ��Ŀ �� ���� �迭
			 * arr_taskSlideMinNum : �����̵� �ּ� �� �迭
			 * arr_taskSlideMaxNum : �����̵� �ִ� �� �迭
			 * arr_taskSelectTree : ���õ� Ʈ�� �迭
			 * text_seperator : ���� ������
			 */
			String[] taskAllTitle = request.getParameterValues("subject_title");
			int taskTotalNum = taskAllTitle.length - 1;
			taskSavedMap.put("task_total", taskTotalNum);
			String[] arr_selectBox = request.getParameterValues("selectBox");
			String[] arr_taskAnchorNum = request.getParameterValues("task_anchorNum");
			String[] arr_taskSlideMinNum = request.getParameterValues("task_slideMinNum");
			String[] arr_taskSlideMaxNum = request.getParameterValues("task_slideMaxNum");
			String[] arr_taskSelectTree = request.getParameterValues("task_selectTree");
			String text_seperator = ",";
			
			// ���� ���� �����ϱ�
			Map questionSavedMap = new HashMap();
			String questionPrimaryKeys = "";
			String tempSettingVal = "";
			int nowNumOfQuestion = 0;
			if(dao.countQueIdDao() != 0)
				nowNumOfQuestion = dao.selectQueIdWithLastestDao();
			for (int i=1;i<=taskTotalNum;i++) {
				//������ ���� ��� ��������
				questionSavedMap.put("que_method", arr_selectBox[i]);
				if("simple text".equals(arr_selectBox[i])) {
					//nothing to do
				}else if("recurd".equals(arr_selectBox[i])) {
					tempSettingVal = arr_taskAnchorNum[i]; //��Ŀ ����
					for(String tempAnchorTextStr : request.getParameterValues("task_anchorTextAt"+i)) {
						tempSettingVal += text_seperator + tempAnchorTextStr; 
					}
					questionSavedMap.put("que_settingVal", tempSettingVal);
					
				}else if("slide".equals(arr_selectBox[i])) {
					tempSettingVal = arr_taskSlideMinNum[i] +text_seperator+ arr_taskSlideMaxNum[i];
					questionSavedMap.put("que_settingVal", tempSettingVal);
				}else if("tree".equals(arr_selectBox[i])) {
					String taskSelectTree = request.getParameter("task_selectTree");
					questionSavedMap.put("que_settingVal", taskSelectTree);
				}else if("box".equals(arr_selectBox[i])) {
					String[] tempQBox = request.getParameterValues("task_boxQueAt"+i);
					tempSettingVal = String.valueOf(tempQBox.length); //������ ���� ����
					for(String tempQBoxStr : tempQBox) {
						tempSettingVal += text_seperator + tempQBoxStr; 
					}
					questionSavedMap.put("que_settingVal", tempSettingVal);
				}
				
				//�����ͺ��̽��� ����
				dao.insertNewQuestion(questionSavedMap);
				//���� �⺻Ű ����
				questionPrimaryKeys += (i!=1) ? "," + (dao.selectQueIdWithLastestDao()) : (dao.selectQueIdWithLastestDao()); //���̻��̿� �޸� �־��ֱ�
				
			}
			//Task db�� ���� �⺻Ű�� ����
			taskSavedMap.put("task_queIds", questionPrimaryKeys);
			//�� ���� ���� db�� �����ϱ�
			dao.insertNewTask(taskSavedMap);

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping("/createNewTask.do")//�� ���� ���� ó�� ������(�Լ�)
	public String createNewTask(HttpServletRequest request, Model model)
	throws Exception {
		String resultPage = "cmmn/successCreateNewTask";
		Map tempMap2 = new HashMap();
		try {
			int i = 0;
			String tempStr = ""; //���� ���� 
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			//������ �ޱ�
			String taskName = request.getParameter("task_name"); 
			tempMap2.put("task_name", taskName);
			//���ù� �ޱ�
			String taskIndicator = request.getParameter("task_indicator");
			tempMap2.put("task_msg", taskIndicator);
			//���� ���� ���� ����
			String[] taskDay = request.getParameterValues("task_day"); // �߰���ų
			for (String val : taskDay) {
				i++;
				if(taskDay.length != i)
					tempStr += val + ",";
				else
					tempStr += val;
			}
			tempMap2.put("task_day", tempStr);
			//���� ���� �ð� ���� task_createTime
			String taskCreateTime = request.getParameter("task_createTime");
			tempMap2.put("task_startTime", taskCreateTime);
			//���� �Ҹ� ���� ����  task_expireDay
			String[] taskNonExpireDay = request.getParameterValues("task_nonExpireDay");
			if(taskNonExpireDay.length == 2) {
				//��ȿ ��¥�� �������� ���� ����̹Ƿ� 2999�� 12�� 31�Ϸ� ����(2999-12-31)
				tempMap2.put("task_endTime", "2999-12-31");
			}else {
				//��ȿ ��¥�� ������ ���
				String taskExpireDay = request.getParameter("task_expireDay");
				tempMap2.put("task_endTime", taskExpireDay);
			}
			
			//���� ���� ����
			String taskTaskNum = request.getParameter("task_taskNum");
			tempMap2.put("task_total", taskTaskNum);
			
			//�� ���� ���� db�� �����ϱ�
			dao.insertNewTask(tempMap2);
			
			// ������ �Է¹�� 
			// �Է¹�� ���� �����ϱ�
			Map tempMap = new HashMap();
			String selectBox = request.getParameter("selectBox");
			// 1. �ܼ� �ؽ�Ʈ �Է��� ��� 
			if("simple text".equals(selectBox)) {
				//db����(���)
				
			}

			// 2. ��ĿƮ ô�� ������� �Է��� ��� 
			else if("recurd".equals(selectBox)) {
				//db����(���, ��Ŀ����)
				String taskAnchorNum = request.getParameter("task_anchorNum");
				tempMap.put("answer_method", selectBox);
				tempMap.put("answer_optQuestion", taskAnchorNum);
				//db�� �����ϱ�
				
			}
			
			// 3. �����̵� ������� �Է��� ��� 
			else if("slide".equals(selectBox)) {
				//db����(���, �����̵� ����(�ּ�, �ִ�)
				String taskSlideMinNum = request.getParameter("task_slideMinNum");
				String taskSlideMaxNum = request.getParameter("task_slideMaxNum");
				tempMap.put("answer_method", selectBox);
				tempMap.put("answer_optQuestion", taskSlideMinNum+","+taskSlideMaxNum);
				//db�� �����ϱ�
				
			}
			
			// 4. Ʈ������ ������� �Է��� ��� 
				else if("tree".equals(selectBox)) {
					//db����(���, Ʈ��id)
					String taskSelectTree = request.getParameter("task_selectTree");
					tempMap.put("answer_method", selectBox);
					tempMap.put("answer_optQuestion", taskSelectTree);
					//db�� �����ϱ�
					
				}
			
			// 5. �ڽ��� ������� �Է��� ��� 
				else if("box".equals(selectBox)) {
					//db����(���, Ʈ��id)
					String selectBoxNum = request.getParameter("selectBoxNum");
					if("2".equals(selectBoxNum)) {
						String task_boxQue1 = request.getParameter("task_boxQue1");
						String task_boxQue2 = request.getParameter("task_boxQue2");
						tempMap.put("answer_method", selectBox);
						tempMap.put("answer_optQuestion", selectBoxNum+","+task_boxQue1+","+task_boxQue2);
					}else if("3".equals(selectBoxNum)) {
						String task_boxQue1 = request.getParameter("task_boxQue1");
						String task_boxQue2 = request.getParameter("task_boxQue2");
						String task_boxQue3 = request.getParameter("task_boxQue3");
						tempMap.put("answer_method", selectBox);
						tempMap.put("answer_optQuestion", selectBoxNum+","+task_boxQue1+","+task_boxQue2+","+task_boxQue3);
					}else if("4".equals(selectBoxNum)) {
						String task_boxQue1 = request.getParameter("task_boxQue1");
						String task_boxQue2 = request.getParameter("task_boxQue2");
						String task_boxQue3 = request.getParameter("task_boxQue3");
						String task_boxQue4 = request.getParameter("task_boxQue4");
						tempMap.put("answer_method", selectBox);
						tempMap.put("answer_optQuestion", selectBoxNum+","+task_boxQue1+","+task_boxQue2+","+task_boxQue3+","+task_boxQue4);
					}else if("5".equals(selectBoxNum)) {
						String task_boxQue1 = request.getParameter("task_boxQue1");
						String task_boxQue2 = request.getParameter("task_boxQue2");
						String task_boxQue3 = request.getParameter("task_boxQue3");
						String task_boxQue4 = request.getParameter("task_boxQue4");
						String task_boxQue5 = request.getParameter("task_boxQue5");
						tempMap.put("answer_method", selectBox);
						tempMap.put("answer_optQuestion", selectBoxNum+","+task_boxQue1+","+task_boxQue2+","+task_boxQue3+","+task_boxQue4+","+task_boxQue5);
					}
					//db�� �����ϱ�
					
				}			

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping("/ViewAllTask")//��� ���� ���� ������
	public String ViewAllTask(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<taskDto> cmDto= dao.selectAllTaskDao();
			model.addAttribute("list", cmDto);
			System.out.println("test: " + cmDto);
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		
		return "SettingTask/ViewAllTask";
	}
	
	@RequestMapping("/DeleteTask.do")//���� ����
	public String DeleteTask(HttpServletRequest request, Model model)
	throws Exception {
		String resultPage = "forward:/ViewAllTask.do";
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			String taskName = request.getParameter("taskName"); 
			
			
			dao.deleteTaskDao(taskName);
			
			

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping("/SampleChart")//��� ���� ���� ������
	public String SampleChart()
	{
		
		return "Chart/SampleChart";
	}
	
	@RequestMapping("/ManageToClient")//������ �� ����
	public String ManageToClient(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<client_userDto> cmDto= dao.selectAllClientMemberDao();
				model.addAttribute("list", cmDto);
			//model.addAttribute("name", cmDto.get(0).toString());
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "DataManagement/ManageToClient";
	}
	
	@RequestMapping("/ManageToTask")//����������
	public String ManageToTask(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<taskDto> cmDto= dao.selectAllTaskDao();
			model.addAttribute("list", cmDto);
			System.out.println("test: " + cmDto);
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		
		return "DataManagement/ManageToTask";
	}
	@RequestMapping("/ManageToClientDetail")//�����ں� ���� -> ������ ���̵� Ŭ�� ������
	public String ManageToClientDetail(Model model,HttpServletRequest request)
	{
		
		//������ ID �����͸� ���۹��� ȸ�� �ڵ�
		String id = request.getParameter("id");
				
		
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<gpsDto> gDto=dao.selectGpsDataDao("hong123");
			model.addAttribute("list", gDto);
			//model.addAttribute("name", cmDto.get(0).toString());
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "DataManagement/ManageToClientDetail";
	}
	
	
	
	@RequestMapping("/AndroidRequestTask1")//�ȵ���̵�κ��� �޾ƿ� ���� ����
	public void AndroidRequestTask1(HttpServletRequest request)
	{
		try {
		//
		String tc_taskName=request.getParameter("tc_taskName"); 
		String tc_time=request.getParameter("tc_time");
		String tc_gps=request.getParameter("tc_gps");
		int  tc_content1=Integer.parseInt(request.getParameter("tc_content1")); 
		int  tc_content2=Integer.parseInt(request.getParameter("tc_content2"));
		int  tc_feel1=Integer.parseInt(request.getParameter("tc_feel1"));
		int  tc_feel2=Integer.parseInt(request.getParameter("tc_feel2")); 
		int  tc_feelDetail=Integer.parseInt(request.getParameter("tc_feelDetail"));
		String userId=request.getParameter("userId");
		
		
		//
		task_contentDto tcdto;
		tcdto=new task_contentDto(tc_taskName, tc_time, tc_gps, tc_content1, tc_content2, tc_feel1, tc_feel2, tc_feelDetail, userId); 
		//gpsdto=new gpsDto("lee123","20180102","123-49");  
		
	
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			//dao.insertGpsDao(gpsdto);		
			dao.insertTaskContentDao(tcdto);
		} 
		
		catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		
		
		
	
	}
	
	/*
	 * Map ����� �̿��� json api ��Ʈ�ѷ� ���� (�� -> �ȵ���̵� json ������ ���)
	 * */
    //������ �׽�Ʈ �� getJsonByMap.do�� �����ϸ� json ������ ������ �� �� ����!
	@RequestMapping(value="/getJsonByMap")
	public @ResponseBody Map<String , Object> getJsonByMap() {
	    Map<String, Object> jsonObject = new HashMap<String, Object>();
	    Map<String, Object> jsonSubObject = null;
	    ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();
	         
	    //1��° ������
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("idx", 1);
	    jsonSubObject.put("title", "�����Դϴ�");
	    jsonSubObject.put("create_date", new Date());
	    jsonList.add(jsonSubObject);
	    //2��° ������
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("idx", 2);
	    jsonSubObject.put("title", "�ι�°�����Դϴ�");
	    jsonSubObject.put("create_date", new Date());
	    jsonList.add(jsonSubObject);
	         
	    jsonObject.put("success", true);
	    jsonObject.put("total_count", 10);
	    jsonObject.put("result_list", jsonList);
	         
	    return jsonObject; 
	}
	
	@RequestMapping(value="/ClientGps" , method = {RequestMethod.GET, RequestMethod.POST})//Ʈ��ŷ ���� �ϸ� �ȵ���̵忡�� ��ġ ���� �����͸� �޾ƿö� ����� �Լ�
	public @ResponseBody Map<String , Object> ClientGps(HttpServletRequest request)
	{
		 Map<String, Object> jsonObject = new HashMap<String, Object>();
		  
		String result="\0";
		    boolean isSuccess=false;
		    String msg="\0";
		    
		try {
		//�ȵ���̵�� ���� �����͸� ���۹��� //�ÿ� �������� a_gpsID=hong123
		String gID=request.getParameter("gps_userId"); 
		String gTime=request.getParameter("gps_time");
		String gData=request.getParameter("gps_data");
		
		//	String gID="hong123"; 
		//	String gTime="0000-00-00 00:00:00";
		//	String gData="3";
		System.out.println(gID);
		System.out.println(gTime);
		System.out.println(gData);
		//�ȵ���̵�κ��� ���� �����͸� GPS ������ ���̽��� ����
		gpsDto gpsdto;
		gpsdto=new gpsDto(gID,gTime,gData);  
		//gpsdto=new gpsDto("lee123","20180102","123-49");  
		
	
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			dao.insertGpsDao(gpsdto);	
			result=" ";
			isSuccess=true;
			msg="��ġ ���� ����";
			
		} 
		
		catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
			isSuccess=false;
			result="null";
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
			msg=ex.getMessage();
		}
		
		jsonObject.put("isSuccessful", isSuccess);   
		jsonObject.put("result",result);
		jsonObject.put("msg", msg);
		 return jsonObject; 
	
	}
	@RequestMapping(value="/ClientGpsTest" , method = {RequestMethod.GET, RequestMethod.POST})//Ʈ��ŷ ���� �ϸ� �ȵ���̵忡�� ��ġ ���� �����͸� �޾ƿö� ����� �Լ�
	public @ResponseBody Map<String , Object> ClientGpsTest()
	{
		 Map<String, Object> jsonObject = new HashMap<String, Object>();
		  
		String result="\0";
		    boolean isSuccess=false;
		    String msg="\0";
		    
		try {
		//�ȵ���̵�� ���� �����͸� ���۹��� //�ÿ� �������� a_gpsID=hong123
		String gID="hong123"; 
		String gTime="2018-01-18 00:00:00";
		String gData="123-33";
		
		//	String gID="hong123"; 
		//	String gTime="0000-00-00 00:00:00";
		//	String gData="3";
		System.out.println(gID);
		System.out.println(gTime);
		System.out.println(gData);
		//�ȵ���̵�κ��� ���� �����͸� GPS ������ ���̽��� ����
		gpsDto gpsdto;
		gpsdto=new gpsDto(gID,gTime,gData);  
		//gpsdto=new gpsDto("lee123","20180102","123-49");  
		
	
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			dao.insertGpsDao(gpsdto);	
			result=" ";
			isSuccess=true;
			msg="��ġ ���� ����";
			
		} 
		
		catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
			isSuccess=false;
			result="null";
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
			msg=ex.getMessage();
		}
		
		jsonObject.put("isSuccessful", isSuccess);   
		jsonObject.put("result",result);
		jsonObject.put("msg", msg);
		 return jsonObject; 
	
	}
	@RequestMapping(value="/getTrackFlag" , method = {RequestMethod.GET, RequestMethod.POST}) //���߿� http���� ���·� ���̵� �޾ƿ��� �ɷ� �ٲܰ�. ������ �׽�Ʈ �غ��� ���ؼ� �ϴ� �Ķ���� ����..
	public @ResponseBody Map<String , Object> getTrackFlag(HttpServletRequest request) {
	    Map<String, Object> jsonObject = new HashMap<String, Object>();
	  
	    String cuser_id="\0";
	    int flag=-1;
	    boolean isSuccess=false;
	    String msg="\0";
	    
		try {
			
			 cuser_id=request.getParameter("cuser_id");
			isSuccess=true;
			msg="��ġ���� ��ȸ����";
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			flag=dao.selectCuserTracking(cuser_id);
			
						
		} catch (Exception ex) {
			isSuccess=false;
			flag=-1;
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
			msg=ex.getMessage();
		}
	    
		
		jsonObject.put("isSuccessful", isSuccess);   
		jsonObject.put("result",flag);
		jsonObject.put("msg", msg);
	         
	    return jsonObject; 
	}
	/*
	@RequestMapping("/TrackingFlag")//�� -> �ȵ���̵忡�� �ش� ���̵� ���� Ʈ��ŷ ���� json ���·� ����
	@ResponseBody
	public  Map TrackingFlag(HttpServletRequest request) {
	      
		
		Map result=new HashMap();
		String cuser_id=request.getParameter("cuser_id"); //�ȵ� Ȥ�� ������ ����� ���̵� �޾ƿ�
		int flag=-1;
		
		//ȹ���� ���̵� �ش��ϴ� Ʈ��ŷ ���� ���� ��������				
		
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			flag=dao.selectCuserTracking("cuser_id");
			result.put("flag",flag);
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
	    
		result.put("flag",flag);
	   
	    return result; 
	}
	*/
	@RequestMapping("/ManageToTaskDetail")//�����ں� ���� -> ������ ���̵� Ŭ�� ������
	public String ManageToTaskDetail(HttpServletRequest request,Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			
			String task_name = request.getParameter("task_name"); 
			
			List<task_contentDto> cmDto= dao.selectAllTaskInfo(task_name);
			
			model.addAttribute("task_name",task_name);
			model.addAttribute("list", cmDto);
				
			//model.addAttribute("name", cmDto.get(0).toString());
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "DataManagement/ManageToTaskDetail";
	}
	
	@RequestMapping("/SetTracking")//������ �������� -> ��ġ Ʈ��ŷ ����
	public String SetTracking(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<client_userDto> cmDto= dao.selectTrackClientMemberDao();
			List<client_userDto> cmnDto= dao.selectNotTrackClientMemberDao();
			
				model.addAttribute("list", cmDto);
				model.addAttribute("nlist", cmnDto);
				
			//model.addAttribute("name", cmDto.get(0).toString());
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "SettingTask/SetTracking";
	}
	
	@RequestMapping("/UpdateTrackClient.do")//Ʈ��ŷ ���� ����
	public String UpdateTrackClient(HttpServletRequest request, Model model)
	throws Exception {
		String resultPage = "forward:/SetTracking.do";
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			String cuser_id = request.getParameter("cuser_id"); 
			int cuser_tracking=Integer.parseInt(request.getParameter("cuser_tracking"));
			
			if(cuser_tracking==0)
			{
			dao.updateTrackClientDaoTrue(cuser_id);
			}
			else if(cuser_tracking==1)
			{
				dao.updateTrackClientDaoFalse(cuser_id);
				
			}

		} catch (Exception exp) {
			System.out.println(exp.getMessage());
		//	resultPage = "cmmn/dataAccessFailure";
		}
		 return resultPage;
	}
	
	@RequestMapping(value = {"/", "/Dashboard"}, method = RequestMethod.GET)
	public String Dashboard()
	{
		
		return "Dashboard/Dashboard";
	}
	@RequestMapping("/UpdateTask")
	public String UpdateTask(HttpServletRequest request,Model model)
	{  
		model.addAttribute("task_name",request.getParameter("taskName"));
		model.addAttribute("task_msg",request.getParameter("task_msg"));
		 
		return "SettingTask/UpdateTask";
	}
	@RequestMapping("/Tree") 
	public String Tree()
	{
		
		return "SettingTask/Tree";
	}
	@RequestMapping("/TreeAjaxTest") 
	public String TreeAjaxTest(Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<tree_contentDto> cmDto= dao.selectTreeDao(1);
			
				model.addAttribute("list", cmDto);
			
			//model.addAttribute("name", cmDto.get(0).toString());
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "SettingTask/TreeAjaxTest";
	}
	@RequestMapping(value="/tttt") //�ذ���� ���� ��
	public @ResponseBody Map<String , Object> tttt() {
	    Map<String, Object> jsonObject = new HashMap<String, Object>();
	    Map<String, Object> jsonSubObject = null;
	    ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();
	         
	   
	    //1��° ������
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("text", "����");
	    jsonList.add(jsonSubObject);
	    //2��° ������
	    jsonSubObject = new HashMap<String, Object>();
	    jsonSubObject.put("text", "����");
	    jsonList.add(jsonSubObject);
	         
	  
	    jsonObject.put("text", "����");   
	    return jsonObject; 
	}

	@RequestMapping("/AllTree") 
	public String AllTree( Model model)
	{
		try {
			ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
			List<treeDto> cmDto= dao.selectAllTreeDao();
			model.addAttribute("list", cmDto);
			System.out.println("test: " + cmDto);
						
		} catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
		return "SettingTask/AllTree";
	}
	
	@RequestMapping(value= "/checkIdIsOk", method=RequestMethod.POST)
	public @ResponseBody String checkIdIsOk( HttpServletRequest request, 
	        @RequestParam("user_id") String user_id)  {
		String result = "";
		try {
		ScheduleDAO dao = sqlSession.getMapper(ScheduleDAO.class);
		user_id = request.getParameter("user_id");
		int countUserId = dao.checkUserIdDao(user_id);
		if(countUserId <1)
			result = "true";
		else
			result = "false";
		
		}catch (Exception ex) {
			System.out.println("����ó�� �޽��� : " + ex.getMessage());
		}
	    return result;
	}
	
	@RequestMapping(value= "/ajax", method=RequestMethod.POST)
	public @ResponseBody String AjaxView(  
	        @RequestParam("id") String id)  {
		System.out.println("ididi"+id);
	    //SocialPerson person = dao.getPerson(id);
	    return id+"-ahahahah";
	}
	
	@RequestMapping("/form2") //���߿� �����
	public String form2()
	{
		
		return "form2";
	}
	
	@RequestMapping("/form3") //���߿� �����
	public String form3()
	{
		
		return "form3";
	}
	@RequestMapping("/graph") //���߿� �����
	public String graph()
	{
		
		return "graph";
	}
	@RequestMapping("/cal") //���߿� �����
	public String cal()
	{
		
		return "cal";
	}
	@RequestMapping("/test2") //���߿� �����
	public String test2()
	{
		
		return "test2";
	}
	
	@RequestMapping("/index")
	@ResponseBody
	public List membrIdCheck() throws Exception {
	        List<Map<String,String>> list = new  ArrayList<Map<String,String>>();
	     return list;
	 
	}
	
	



	
}
