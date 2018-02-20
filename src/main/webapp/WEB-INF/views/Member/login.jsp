<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<link rel="stylesheet" href="<%=cp%>/bootstrap/css/bootstrap.css" />
<title>SVQ 상담자 사이트</title>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="Dashboard.do">SVQ 상담자 관리 사이트</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Dashboard.do">Home</a></li>
				<!-- 
				<li><a href="bss.do">게시판</a></li>
				 -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="signup.do">회원가입</a></li>
				</ul>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			
				
					<h3 style="text-align: center;">로그인 화면</h3>
					<c:if test="${param.fail == null}">
						<h5 style="text-align: center; color: #1E90FF;">Sign in, please</h5>
					</c:if>
					<c:if test="${param.fail != null}">
						<h5 style="text-align: center; color: red;">We cannot find an account with that email address.</h5>
					</c:if>
					<c:url value="j_spring_security_check" var="loginUrl" />
					<form action="${loginUrl}" method="post">
					<div class="form-group">
						<input type="text" name="j_username" id="j_username" class="form-control" placeholder="아이디" required="required" />
					</div>
					<div class="form-group">
						<input type="password" name="j_password" id="j_password" class="form-control" placeholder="비밀번호" required="required" />
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
					
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/bootstrap.js"></script>
</body>
</html>