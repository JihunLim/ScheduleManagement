<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%String cp= request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.css"/>
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
 <div class="container">
 	<div class="col-lg-4"></div>
 	<div class="col-lg-4">
 		<div class="jumbotron" style="padding-top:20px;">
 		 	<form method="post" action="<%=cp%>/checkSignup.do">
 		 		<h3 style="text-align: center;">SVQ 회원가입</h3>
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" placeholder="아이디" name="user_id" maxlength="30">
 		 		</div>
 		 		<div class="form-group">
 		 			<input type="password" class="form-control" placeholder="비밀번호" name="user_pwd" maxlength="30">
 		 			
 		 		</div>
 		 		<div class="form-group">
 		 			<input type="password" class="form-control" placeholder="비밀번호확인" name="temp_pwd" maxlength="30">
 		 		
 		 		</div>
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" placeholder="이름" name="user_name" maxlength="20">
 		 		</div>
 		 		
 		 		<div class="form-group" style="text-align:center;">
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
 		 			<input type="email" class="form-control" placeholder="이메일" name="user_email" maxlength="30">
 		 		</div>
 		 		
 		 		<div class="form-group">
 		 			<input type="text" class="form-control" placeholder="병원 이름" name="user_hospital" maxlength="30">
 		 		</div>
 		 		
 		 		<input type="submit" class="btn btn-primary form-control" value="회원가입">
 		 	
 		 	</form>
 		</div>
 	</div>
 	<div class="col-lg-4"></div>
 	
 </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=cp %>/bootstrap/js/bootstrap.js"></script>
</body>
</html>