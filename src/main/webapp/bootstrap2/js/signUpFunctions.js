
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
 
 //비밀번호 일치여부 확인
 $('#mainJoinContent').on("blur", "#user_pwd", function(){
	 if(!chkPwd( $.trim($('#user_pwd').val()))){ 
		 checkPwd = false;
		 $('#failCreatePwd').css("color","red");
		 alert('비밀번호를 확인하세요.\n(영문, 숫자를 혼합하여 6~20자 이내)');    
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
		alert("비밀번호가 조건을 만족하지 않습니다.");
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
