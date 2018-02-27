<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중복확인</title>
</head>
<body onload="pValue()">


<div id="wrap">
</br>
<b><font size="4" color="gray">아이디 중복체크</font></b>
<hr size="1" width="460">
<br>
<div id="chk">
	<form id="chekForm">
		<input type="text" name="idinput" id="userId">
		<input type="button" value="중복확인" onclick="idCheck()">
		
	</form>
	<div id="msg"></div>
	<br>
	<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
	<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
</div>
</div>
</body>
</html>