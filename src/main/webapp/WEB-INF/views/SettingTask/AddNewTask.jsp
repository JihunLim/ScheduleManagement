<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>
<link rel = "stylesheet" href = "https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 <link rel="stylesheet" type="text/css" href="<%=cp%>/bootstrap2/css/timepicki.css"/>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">새 과제 생성하기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- form -->
            <form name="mainForm" method="post" action="<%=cp%>/createNewTask.do" onsubmit="return checkFormRule()">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<span>새 과제 설정하기</span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                   <h2>과제 기본 설정</h2>
                                    
                                        <div class="form-group">
                                            <label>과제명</label>
                                            <input class="form-control" type="text" name="task_name" placeholder="과제 이름을 입력해주세요."/>
                                        </div>
                                        <div class="form-group">
                                            <label>지시문</label>
                                            <input class="form-control" type="text" name="task_indicator" placeholder="제시할 지시문을 입력해주세요."/>
                                        </div>
                              
                                       <div class="form-group">
                                            <label>과제 제출 요일 선택</label><br />
	                                        <div class="form-group">
	                                            <label>&nbsp;&nbsp; &nbsp; &nbsp;  생성 요일&nbsp;&nbsp;</label>
	                                            <span>(
	                                            <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" id="chkday_all">매일
	                                            </label>
	                                            )&nbsp;&nbsp;
	                                            </span>
	                                            <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="0">월
	                                            </label>
	                                            <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="1">화
	                                            </label>
	                                            <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="2">수
	                                            </label>
	                                             <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="3">목
	                                            </label>
	                                             <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="4">금
	                                            </label>
	                                             <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="5">토
	                                            </label>
	                                             <label class="checkbox-inline">
	                                                <input type="checkbox" class="chk_day" name="task_day" value="6">일
	                                            </label>
	                                        </div>
	                                        
                                         <label>생성 개수</label>
                                             <select class="form-control" id="task_taskNum" name="task_taskNum" style="width: 100px;">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                            
                                           <div class="selectTime1"> 
                                        <div class="form-group">
                                           	<label>과제 생성 시간 선택</label>
                                        	<input class="form-control timepicker" type="text" id="mytimepicker1" name="task_createTime"/>
                                      	</div>
                                      	</div>
                                      	
                                      	
                                      	
                                      	
                                      	</div>
                                        <div class="form-group">
                                            <label>과제 소멸 일자 선택</label>
                                            <input class="form-control" type="text" name="task_expireDay" id="datepicker"/>
                                            <div class="checkbox">
                                                <label>
                                                	<input type="checkbox" name="task_nonExpireDay" value="0" style="display:none;" checked>
                                                    <input type="checkbox" name="task_nonExpireDay" value="1">소멸일자 없을 시 선택
                                                </label>
                                            </div>
                                        </div>
                                            
                                         
                                        </div>
                                              
                                  
                                
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                 <h2>내담자 입력방식</h2>
                                <div class="form-group">
                                      <label>내담자 입력 방식 선택</label>
                                      <select class="form-control" id="selectBox" name="selectBox">
                                          <option value="simple text">단순 텍스트 입력</option>
                                          <option value="recurd">리커트 척도 입력</option>
                                          <option value="slide">슬라이드 바 입력</option>
                                          <option value="tree">트리 구조형 입력</option>
                                          <option value="box">박스형 답안 선택</option>
                                      </select>
                                 </div>
                                 
                                 <div class="selectLayer1"  style="display:none;">
                                 	<!-- 단순 텍스트 입력 시 보여질 창 -->
                                  <div class="form-group">
                                            <label>답변</label>
                                            <input class="form-control" type="text" name="task_indicator" placeholder="답변을 입력해주세요."/>
                                        </div>
                                 </div>
                                 
                                 <div class="selectLayer2" style="display:none;">
                                 	<!-- 리커트 척도 입력 시 보여질 창 (앵커 개수 설정)-->
                                 	<div class="form-group has-success">
                                        <label class="control-label" for="task_anchorNum">앵커 개수 설정</label>
                                        <input class="form-control" type="number" id="task_anchorNum" name="task_anchorNum"/>
                                    </div>
                                 </div>
                                 
                                 <div class="selectLayer3"  style="display:none;">
                                 	<!-- 슬라이드 바 입력 시 보여질 창 (최소 최대 숫자 설정)-->
                                 	<div class="form-group has-success">
	                                 	<label class="control-label" for="task_anchorNum">슬라이드 바 구간 설정</label>
	                                 	 <div class="form-group">
	                                 	 	<label> <input type="number" name="task_slideMinNum" style="width: 200px;" placeholder="최소 값 설정"/> ~ <input type="number" name="task_slideMaxNum" style="width: 200px;" placeholder="최대 값 설정"/>  </label>
	                                 	</div>
                                    </div>
                                 </div>
                                 
                                 <div class="selectLayer4"  style="display:none;">
                                 	<!-- 트리 구조형 입력 시 보여질 창 -->
                                 	<div class="form-group has-success">
                                 	<label class="control-label" for="task_anchorNum">트리 구조 설정</label>
                                 	<c:forEach items="${tree_list}" var="dto">
										<div class="radio">
                                            <label>
                                                <input type="radio" name="task_selectTree" value="${dto.radioId}">${dto.radioName}
                                            </label>
                                        </div>
									</c:forEach>
                                 	</div>
                                 </div>
                                 
                                 <div class="selectLayer5"  style="display:none;">
                                 	<!-- 박스형 답안 선택 입력 시 보여질 창 -->
                                 	<div class="form-group has-success">
                                 	<label class="control-label" for="task_anchorNum">박스형 방식 > 개수설정</label>
                                 	 <div class="form-group">
                                      <select class="form-control" id="selectBox2" name="selectBoxNum">
                                          <option>2</option>
                                          <option>3</option>
                                          <option>4</option>
                                          <option>5</option>
                                      </select>
                                      <br />
                                      <div class="selectBoxLayer1">
                                      	   <div class="form-group has-warning">
                                      	  <label class="control-label" for="inputWarning">객관식 답안 문제 작성</label>
                                      	  <input type="text" class="form-control" name="task_boxQue1" placeholder="Q1. 첫번째 질문을 입력하세요."/><br />

                                      <div class="selectBoxLayer2">
                                      	  <input type="text" class="form-control" name="task_boxQue2" placeholder="Q2. 두번째 질문을 입력하세요."/><br />
                                      </div>
                                      <div class="selectBoxLayer3" style="display:none;">
                                      	  <input type="text" class="form-control" name="task_boxQue3" placeholder="Q3. 세번째 질문을 입력하세요."/><br />
                                      </div>
                                      <div class="selectBoxLayer4" style="display:none;">
                                      	  <input type="text" class="form-control" name="task_boxQue4" placeholder="Q4. 네번째 질문을 입력하세요."/><br />
                                      </div>
                                      <div class="selectBoxLayer5" style="display:none;">
                                      	  <input type="text" class="form-control" name="task_boxQue5" placeholder="Q5. 다섯번째 질문을 입력하세요."/><br />
                                      </div>
                                      </div>
                                      </div>
                                      
                                 </div>
                                 </div>
                                 	
                                 </div>
                                    <button type="reset" class="btn btn-default" style="float:right; margin:30px 10px; background:#F8E0E0;">설정 초기화</button>
                                    <button type="submit" class="btn btn-default" style="float:right; margin:30px 10px; background:#CEF6CE;">설정 완료</button>
                               
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
            </form>
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

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
	<script>
		jQuery('#selectBox').change(function() {
			var state = jQuery('#selectBox option:selected').val();
			if(state == 'simple text') {
				jQuery('.selectLayer1').show();
				jQuery('.selectLayer2').hide();
				jQuery('.selectLayer3').hide();
				jQuery('.selectLayer4').hide();
				jQuery('.selectLayer5').hide();
			} else if(state == 'recurd'){
				jQuery('.selectLayer1').hide();
				jQuery('.selectLayer2').show();
				jQuery('.selectLayer3').hide();
				jQuery('.selectLayer4').hide();
				jQuery('.selectLayer5').hide();
			}else if(state == 'slide'){
				jQuery('.selectLayer1').hide();
				jQuery('.selectLayer2').hide();
				jQuery('.selectLayer3').show();
				jQuery('.selectLayer4').hide();
				jQuery('.selectLayer5').hide();
			}else if(state == 'tree'){
				jQuery('.selectLayer1').hide();
				jQuery('.selectLayer2').hide();
				jQuery('.selectLayer3').hide();
				jQuery('.selectLayer4').show();
				jQuery('.selectLayer5').hide();
			}else if(state == 'box'){
				jQuery('.selectLayer1').hide();
				jQuery('.selectLayer2').hide();
				jQuery('.selectLayer3').hide();
				jQuery('.selectLayer4').hide();
				jQuery('.selectLayer5').show();
			}else{
				jQuery('.selectLayer1').hide();
				jQuery('.selectLayer2').hide();
				jQuery('.selectLayer3').hide();
				jQuery('.selectLayer4').hide();
				jQuery('.selectLayer5').hide();
			}

		});
	</script>
	<script>
		jQuery('#selectBox2').change(function() {
			var state = jQuery('#selectBox2 option:selected').val();
			if(state == '2') {
				jQuery('.selectBoxLayer1').show();
				jQuery('.selectBoxLayer2').show();
				jQuery('.selectBoxLayer3').hide();
				jQuery('.selectBoxLayer4').hide();
				jQuery('.selectBoxLayer5').hide();
			} else if(state == '3'){
				jQuery('.selectBoxLayer1').show();
				jQuery('.selectBoxLayer2').show();
				jQuery('.selectBoxLayer3').show();
				jQuery('.selectBoxLayer4').hide();
				jQuery('.selectBoxLayer5').hide();
			}else if(state == '4'){
				jQuery('.selectBoxLayer1').show();
				jQuery('.selectBoxLayer2').show();
				jQuery('.selectBoxLayer3').show();
				jQuery('.selectBoxLayer4').show();
				jQuery('.selectBoxLayer5').hide();
			}else if(state == '5'){
				jQuery('.selectBoxLayer1').show();
				jQuery('.selectBoxLayer2').show();
				jQuery('.selectBoxLayer3').show();
				jQuery('.selectBoxLayer4').show();
				jQuery('.selectBoxLayer5').show();
			}else{
				jQuery('.selectBoxLayer1').hide();
				jQuery('.selectBoxLayer2').hide();
				jQuery('.selectBoxLayer3').hide();
				jQuery('.selectBoxLayer4').hide();
				jQuery('.selectBoxLayer5').hide();
			}

		});
	</script>
	
	
	
	<script>
	  $(function() {
	    $("#datepicker").datepicker ({
	    	changeYear: true,
	    	changeMonth: true,
	    	dateFormat:"yy-mm-dd",
	    	showMonthAfterYear:true,
	    	dayNamesMin: ['일','월','화','수','목','금','토'],
	    	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	      
	    });
	  });
	  </script>
	
	  <script src='<%=cp%>/bootstrap2/js/timepicki.js'></script>
	  <script>
		  $('#mytimepicker1').timepicki();  
	  </script>
	    <script>
		  $('#mytimepicker2').timepicki();  
	  </script>
	    <script>
		  $('#mytimepicker3').timepicki();  
	  </script>
	  <script>
	  	  //요일 체크박스 전체 선택 및 해제 기능 구현
	  	  $("#chkday_all").click(function(){
	  		 if($("#chkday_all").is(":checked")){
	  			 $(".chk_day").prop("checked", true);
	  		 }else{
	  			 $(".chk_day").prop("checked", false);
	  		 } 
	  	  });
	  	  
	  	  $(".chk_day").click(function(){
	  		 if($("input[name='task_day']:checked").length == 7){
	  			 $("#chkday_all").prop("checked", true);
	  		 } else{
	  			 $("#chkday_all").prop("checked", false);
	  		 }
	  	  });
	  	  
	  </script>
	
	
</body>

</html>
