<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String cp= request.getContextPath(); %> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  
</head>
 <body>
<input type="text" id="id" name="id" value="hahaha">
<button id="bt">누르세요</button>   
   
<script type="text/javascript">
$('#bt').click(function(){
	 $.ajax({
         url : "ajax.do",
         type: "post",
         data : { "id" : $("#id").val() },
         success : function(data){
             alert(data);
             if(!data){
                 alert("존재하지 않는 ID입니다");
                 return false;
             }
         },
         error:function(jqXHR, textStatus, errorThrown){
             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
             
         }
     });
	
	
	
});
</script>


</body>
</html>