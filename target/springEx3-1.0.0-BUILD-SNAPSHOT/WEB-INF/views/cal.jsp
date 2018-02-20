<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String cp= request.getContextPath(); %> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SVQ 마음 건강 연구소</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=cp%>/bootstrap2/css3/bootstrap.min.css" rel="stylesheet">




</head>
<body>

	<script>
		
		var EncryptReadKey = "iRAJHaTRiRAJHaLLFBOwrXoLF6j2rSXC";
		function trans() {
			if (document.PasswordTrans.idx.value == "") {
				alert("게시글 번호 값이 존재하지 않습니다.");
				exit;
			}
			if (document.PasswordTrans.password.value=="") {
				alert("게시글 암호를 입력 하세요.");
				document.getElementById("password").setAttribute("class","form-control focusedInput");
				exit;
			}
			InputEncKey = UserPasswordEncryptFunc(document.PasswordTrans.password.value);
			
			if  (InputEncKey == EncryptReadKey) { 
				document.PasswordTrans.submit();
			} else {
				alert("게시글에 대한 암호가 일치하지 않습니다.");
				
			}
		}
	</script>
	

			<label>암호</label>
			<input id="password"  class="form-control" placeholder="게시글 암호를 입력하세요">
			<p class="help-block">게시글에 대한 암호를 입력 해 주세요.</p>
	
			<button type="button" class="btn btn-info"  onclick="trans()">확인</button>
			
   <script src='<%=cp%>/bootstrap2/js3/jquery-ui.min.js'></script>
<script src='<%=cp%>/bootstrap2/js3/jquery-ui.custom.min.js'></script>
<script src='<%=cp%>/bootstrap2/js3/utils.js'></script>
   
</body>
</html>
