<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%String cp= request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.css"/>
<style type="text/css"> 
input #user_id { 
-webkit-ime-mode:inactive; 
-moz-ime-mode:inactive; 
-ms-ime-mode:inactive; 
ime-mode:inactive; 
} 
</style> 
<title>SVQ 상담자 사이트</title>

</head>
<body>
 <nav class="navbar navbar-default">
 	<div class="navbar-header">
 		<button type="button" class="navbar-toggle collapsed"
 		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
 		aria-expanded="false">
 		<span class="icon-bar"></span>
 		<span class="icon-bar"></span>
 		<span class="icon-bar"></span>
 		
 		</button>
 		<a class="navbar-brand" href="Dashboard.do">SVQ 상담자 관리 사이트</a>
 	</div>
 	
 	<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="login.do">로그인</a></li>
				</ul>
			</ul>
		</div>
 	
 </nav>
 <div class="container" id="mainJoinContent">
 	<div class="col-lg-4"></div>
 	<div class="col-lg-4">
 		<div class="jumbotron" style="padding-top:20px;">
 		 	<form method="post" action="<%=cp%>/checkSignup.do">
 		 		<h3 style="text-align: center;">SVQ 회원가입</h3>
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" onkeydown="fn_press_han(this);" placeholder="아이디" name="user_id" id="user_id" maxlength="30" style="IME-MODE: inactive;">
 		 			<span id="successCreateId" style="color:green;font-size:1.1px;"></span>
 		 			<span id="failCreateId" style="color:red;font-size:1.1px;"></span>
 		 		</div>
 		 		
 		 		<div class="form-group">
 		 			<input type="password" class="form-control" placeholder="비밀번호" name="user_pwd" id="user_pwd" maxlength="20">
 		 			<span id="failCreatePwd" style="color:green;font-size:1.1px;">영문, 숫자를 혼합하여 6~20자로 만들어주세요.</span>
 		 		</div>
 		 		<div class="form-group">
 		 			<input type="password" class="form-control" placeholder="비밀번호확인" name="user_pwd2" id="user_pwd2" maxlength="20">
 		 			<span id="MissmatchCreatePwd" style="color:red;font-size:1.1px;"></span>
 		 		</div>
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" placeholder="이름" name="user_name" maxlength="20" style="IME-MODE: active;">
 		 		</div>
 		 		
 		 		<div class="form-group" style="text-align:center;">
 		 		 <div class="btn-group" data-toggle="buttons">
 		 		 	<label class="btn btn-primary active">
 		 		 	 <input type="radio" name="user_sex" autocomplete="off" value="male" checked>남자
 		 		 	</label>
 		 		 	<label class="btn btn-primary ">
 		 		 	 <input type="radio" name="user_sex" autocomplete="off" value="female" checked>여자
 		 		 	</label>
 		 		 </div>
 		 			</div>
 		 			
 		 		<div class="form-group">
 		 			<input type="email" class="form-control" placeholder="이메일" name="user_email" maxlength="30" style="IME-MODE: inactive;">
 		 		</div>
 		 		
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" placeholder="병원 이름" name="user_hospital" maxlength="30" style="IME-MODE: active;">
 		 		</div>
 		 		
 		 		<input type="submit" class="btn btn-primary form-control" id="submit" value="회원가입">
 		 	
 		 	</form>
 		</div>
 	</div>
 	<div class="col-lg-4"></div>
 	
 </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">

/*
 * checkId : 중복없으면  true, 중복되면 false.
 * checkPwd : 조건에 맞으면 true, 안맞으면 false.
 * isMatchPwd : 비번 칸 두개를 확인하여 같으면 true, 안같으면 false.
*/
var checkId = true;
var checkPwd = true;
var isMatchPwd = true;

//중독된 아이디 검사
$('#mainJoinContent').on("blur", "#user_id", function(){
	  if($.trim($('#user_id').val()) == ""){
		  checkId=false;
			//text
			$('#successCreateId').text("");
			$('#failCreateId').text("ID를 입력해주세요.");
			return;
	  }else if(!chkId($.trim($('#user_id').val()))){ 
			 checkId = false;
			 $('#successCreateId').text("");
			 $('#failCreateId').text("ID는 영문으로 최소 6자 이상이어야 합니다.");
			 return;
		 }
	  $.ajax({
		type: 'post',
		url: "checkIdIsOk.do",
		cache: false,
		async: true,
		data: { "user_id":$.trim($("#user_id").val()) },
		success: function(msg){
			//alert(msg);
			if("false" == msg) {
				checkId=false;
				//text
				$('#successCreateId').text("");
				$('#failCreateId').text("이미 사용중인 ID입니다.");
			}else{
				checkId=true;
				$('#failCreateId').text("");
				$('#successCreateId').text("사용이 가능한 ID입니다.");
			}
		},
		error:function(jqXHR, textStatus, errorThrown){
            //alert("에러 발생: \n" + textStatus + " : " + errorThrown);
        }
	  });
 });
 
 //비밀번호 일치여부 확인
 $('#mainJoinContent').on("blur", "#user_pwd2", function(){
	 if($.trim($('#user_pwd').val())=="" || $.trim($('#user_pwd2').val())==""){
		 isMatchPwd=false;
		 return ;
	 }
	 if($.trim($('#user_pwd').val()) == $.trim($('#user_pwd2').val()) ){
		 isMatchPwd = true;
	 }else{
		 isMatchPwd = false;
		 //text
		 $('#MissmatchCreatePwd').text("비밀번호가 일치하지 않습니다.");
	 }
 });
 
 function chkPwd(str){
	 //영문 숫자 혼합하여 6~20자
	 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	 if(!reg_pwd.test(str)){
	  return false;
	 }
	 return true;
	}
 
 function chkId(str){
	 //영문 사용하여 6~20자
	 var reg_id = /^.*(?=.{6,50})(?=.*[a-zA-Z]).*$/;
	 if(!reg_id.test(str)){
	  return false;
	 }
	 return true;
	}
 
 //비밀번호 조건 확인
 $('#mainJoinContent').on("blur", "#user_pwd", function(){
	 if(!chkPwd( $.trim($('#user_pwd').val()))){ 
		 checkPwd = false;
		 $('#failCreatePwd').css("color","red");
		 //alert('비밀번호를 확인하세요.\n(영문, 숫자를 혼합하여 6~20자 이내)');    
	 }else{
		 checkPwd = true;
		 $('#failCreatePwd').css("color","green");
	 }
	 
 });

 
 $('#mainJoinContent').on("click", "#submit", function(){
	if(!checkId) {
		alert("ID를 확인해주세요.");
		return false;
	}else if(!checkPwd){
		alert("비밀번호를 확인하세요.\n(영문, 숫자를 혼합하여 6~20자 이내)");
		return false;
	}else if(!isMatchPwd){
		alert("비밀번호가 일치하지 않습니다. ");
		return false;
	}
		
 });

 /* 한글입력 방지 */
 function fn_press_han(obj)
 {
     //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
     if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
     || event.keyCode == 46 ) return;
     //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
     obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
 }

</script>


</body>
</html>