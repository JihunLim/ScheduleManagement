<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>
<link rel = "stylesheet" href = "https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사.
        function checkValue()
        {
            var form = document.userInfo;
        
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            
            if(!form.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.password.value != form.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }    
            
            if(!form.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(!form.birthyy.value){
                alert("년도를 입력하세요.");
                return false;
            }
            
            if(isNaN(form.birthyy.value)){
                alert("년도는 숫자만 입력가능합니다.");
                return false;
            }
            
            if(form.birthmm.value == "00"){
                alert("월을 선택하세요.");
                return false;
            }
            
            if(!form.birthdd.value){
                alert("날짜를 입력하세요.");
                return false;
            }
            
            if(isNaN(form.birthdd.value)){
                alert("날짜는 숫자만 입력가능합니다.");
                return false;
            }
            
            if(!form.mail1.value){
                alert("메일 주소를 입력하세요.");
                return false;
            }
            
            if(!form.phone.value){
                alert("전화번호를 입력하세요.");
                return false;
            }
            
            if(isNaN(form.phone.value)){
                alert("전화번호는 - 제외한 숫자만 입력해주세요.");
                return false;
            }
            
            if(!form.address.value){
                alert("주소를 입력하세요.");
                return false;
            }
        }
        
        // 취소 버튼 클릭시 첫화면으로 이동
        function goFirstForm() {
            location.href="Dashboard.do";
        }    
        
        // 아이디 중복체크 화면open
        function openIdChk(){
        
            window.name = "parentForm";
            window.open("IdCheckForm.do",
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }
 
        // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
        // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        function inputIdChk(){
            document.userInfo.idDuplication.value ="idUncheck";
        }
        
   </script>


         <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">새 내담자 계정 생성</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원 정보 입력
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                  <h3>기본 정보 입력</h3>
                                        <div class="form-group">
                                            <label>* 이름</label>
                                            <input  type="text" class="form-control" placeholder="이름" name="cuser_name" maxlength="30">
                                            <p class="help-block">이름을 입력해 주세요.</p>
                                        </div>
                                        <div class="form-group">
                                            <label>* 아이디</label>
                                            <input class="form-control" type="text" name="user_id" maxlength="50" onkeydown="inputIdChk()"placeholder="Enter text"  style="width: 50%;">
                                            </br> <button type="submit" onclick="openIdChk()" class="btn btn-default">중복확인</button> <!-- 중복확인 클릭 시 아이디 중복확인 창을 띄움 -->
                                             <input type="hidden" name="idDuplication" value="idUncheck">
                                        </div>
                                         <div class="form-group">
                                            <label>* 비밀번호</label>
                                            <input class="form-control" placeholder="Enter text">
                                             <p class="help-block">비밀번호 항목은 대소문자,숫자를 포함한 8자리 이상 입력해주세요</p>
                                     
                                        </div>
                                         <tr>
     
                                        <div class="form-group">
                                            <label>* 비밀번호 확인</label>
                                            <input class="form-control" placeholder="Enter text">
                                           
                                        </div>
                                         <div class="form-group">
                                            <label>* 이메일 </label>
                                            <input class="form-control" placeholder="Enter text" style="width: 30%;">
                                              </br><label class="checkbox-inline">
                                                <input type="checkbox"> 메일 수신 동의
                                            </label>
                                            
                                          
                                        </div>
                                        <div class="form-group">
                                            <label>* 담당자 아이디</label>
                                            <input class="form-control" placeholder="Enter text">
                                           
                                        </div>
                                       
                                       
                                       
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                  
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    
                                    <h3>추가 정보 입력</h3>
                                    <form role="form">
                                     <div class="form-group">
                                            <label> 성별</label>
                                          </br>
                                    	 <div class="btn-group" data-toggle="buttons">
 		 		 						<label class="btn btn-primary active">
 		 							 	 <input type="radio" name="user_sex" autocomplete="off" value="남자" checked>남자
 		 							 	</label>
 		 		 						<label class="btn btn-primary ">
 		 		 						 <input type="radio" name="user_sex" autocomplete="off" value="여자" checked>여자
 		 		 						</label>
 		 		 						</div>
 		 		 						</div>
 		 		 						
 		 		 						 <div class="form-group">
                                            <label>나이</label>
                                            <input class="form-control" placeholder="Enter text">
                                           
                                        </div>
 		 		 						 <div class="form-group">
                                            <label>전화번호</label>
                                            <input class="form-control" placeholder="Enter text">
                                           
                                        </div>
                                        	 <div class="form-group">
                                            <label>주소</label>
                                            <input class="form-control" placeholder="Enter text">
                                           
                                        </div>
                                       
                                    </form>
                                  
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%=cp%>/bootstrap2/js3/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/sb-admin-2.js"></script>
	
	<!-- bootstrap3 datepicker사용 위한 js -->
	<script type='text/javascript'src='<%=cp%>/bootstrap2/js/jquery.min.js'></script>
	
	<script src = "https://code.jquery.com/jquery-1.9.1.js"> </script>
	<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"> </script>

	
	
	
	

	
	
	
	
</body>

</html>
