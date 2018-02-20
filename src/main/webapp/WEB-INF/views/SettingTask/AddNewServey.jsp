<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/bootstrap2/css/timepicki.css" />
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/bootstrap2/css/googleMeterial.css" />

<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">설문 과제생성</h1>
      </div>
      <!-- /.col-lg-12 -->
   </div>

   <!-- form -->
   <form name="mainForm" method="post" action="<%=cp%>/createNewTask.do"
      onsubmit="return checkFormRule()">
      <!-- /.row -->
      <div class="row">
         <div class="col-lg-12">
            <div class="panel panel-default">
               <div class="panel-heading group" style="margin-bottom: 5px;">
                     <input class="form-control" type="text" name="task_name" id="google"
                        style="border: 0; font-size: 20pt; font-weight: bold;" value="제목 없는 과제" />
                     <span class="highlight"></span>
                     <span class="bar"></span>
               </div>
               <div class="panel-body">
                  <div class="row">
                     <div class="col-lg-12">
                        <div class="form-group">
                           <label>과제 제출 요일 선택</label><br />
                           <div class="form-group">
                              <label>&nbsp;&nbsp; &nbsp; &nbsp; 생성 요일&nbsp;&nbsp;</label> <span>(
                                 <label class="checkbox-inline"> <input
                                    type="checkbox" class="chk_day" id="chkday_all">매일
                              </label> )&nbsp;&nbsp;
                              </span> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="0">월
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="1">화
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="2">수
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="3">목
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="4">금
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="5">토
                              </label> <label class="checkbox-inline"> <input
                                 type="checkbox" class="chk_day" name="task_day" value="6">일
                              </label>
                           </div>

                           <div class="selectTime1">
                              <div class="form-group">
                                 <label>과제 생성 시간 선택</label> <input
                                    class="form-control timepicker" type="text"
                                    id="mytimepicker1" name="task_createTime"
                                    style="width: 200px;" />
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label>과제 소멸 일자 선택</label> <input
                              class="form-control timepicker" type="text" id="mytimepicker2"
                              name="task_endTime" style="width: 200px;" />

                           <div class="checkbox">
                              <label> <input type="checkbox"
                                 name="task_nonExpireDay" value="0" style="display: none;"
                                 checked> <input type="checkbox"
                                 name="task_nonExpireDay" value="1">소멸일자 없을 시 선택
                              </label>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /.row -->
                  
                  <div class="row">
                     <div class="col-lg-12">
                        <div class="panel panel-default">
                           <div class="panel-heading">문항 설정</div>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           <div class="panel-body" id="main_content" style="display:none;">
                              <div class="panel-group" id="accordion" name="basic_group">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                       <div class="row">
                                          <h4 class="panel-title">

                                             <a data-toggle="collapse" data-parent="#accordion" id="changePoint"
                                                href="#collapseOne" style="float: right;"><span id="changePointValue">▲</span>&nbsp;&nbsp;</a>
                                             <input class="form-control" type="text" name="task_name"
                                                style="float: left; border: 0; font-size: 15pt; font-weight: bold;"
                                                value="제목 없는 질문" required/>
                                          </h4>
                                       </div>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in"
                                       style="margin: 1px 1px 1px 20px;">

                                       <div class="form-group">
                                          <label>질문</label> <input class="form-control" type="text"
                                             onchange="alert('changed')" name="task_indicator"
                                             placeholder="제시할 질문을 입력해주세요." />
                                       </div>

                                       <div class="form-group">
                                          <label>내담자 입력 방식 선택</label> <select class="form-control cl_selectBox"
                                             id="selectBox" name="selectBox">
                                             <option value="simple text">단순 텍스트 입력</option>
                                             <option value="recurd">리커트 척도 입력</option>
                                             <option value="slide">슬라이드 바 입력</option>
                                             <option value="tree">트리 구조형 입력</option>
                                             <option value="box">박스형 답안 선택</option>
                                          </select>
                                       </div>

                                       <div name="selectLayer1" style="display: none;">
                                          <!-- 단순 텍스트 입력 시 보여질 창 -->
                                          <div class="form-group">
                                           
                                             <label>답변</label> <input class="form-control" type="text"
                                                name="task_indicator" placeholder="답변을 입력해주세요." />
                                          
                                          </div>
                                       </div>

                                       <div name="selectLayer2" style="display: none;">
                                          <!-- 리커트 척도 입력 시 보여질 창 (앵커 개수 설정)-->
                                          <div class="form-group has-success">
                                             <label class="control-label" for="task_anchorNum">앵커
                                                개수 설정</label> <input class="form-control" type="number"
                                                id="task_anchorNum" name="task_anchorNum" />
                                          </div>
                                             <label>시작</label> <input class="form-control" type="text"
                                                name="task_anchorStartText" placeholder="ex) 매우 나쁘다" /><br />
                                             <label>끝</label> <input class="form-control" type="text"
                                                name="task_anchorEndText" placeholder="ex) 매우 좋다" />   
                                                
                                          
                                       </div>

                                       <div name="selectLayer3" style="display: none;">
                                          <!-- 슬라이드 바 입력 시 보여질 창 (최소 최대 숫자 설정)-->
                                          <div class="form-group has-success">
                                             <label class="control-label" for="task_anchorNum">슬라이드
                                                바 구간 설정</label>
                                             <div class="form-group">
                                                <label> <input type="number"
                                                   name="task_slideMinNum" style="width: 200px;"
                                                   placeholder="최소 값 설정" /> ~ <input type="number"
                                                   name="task_slideMaxNum" style="width: 200px;"
                                                   placeholder="최대 값 설정" />
                                                </label>
                                             </div>
                                          </div>
                                       </div>

                                       <div name="selectLayer4" style="display: none;">
                                          <!-- 트리 구조형 입력 시 보여질 창 -->
                                          <div class="form-group has-success">
                                             <label class="control-label" for="task_anchorNum">트리
                                                구조 설정</label>
                                             <c:forEach items="${tree_list}" var="dto">
                                                <div class="radio">
                                                   <label> <input type="radio"
                                                      name="task_selectTree" value="${dto.radioId}">${dto.radioName}
                                                   </label>
                                                </div>
                                             </c:forEach>
                                          </div>
                                       </div>

                                       <div name="selectLayer5" style="display: none;">
                                          <!-- 박스형 답안 선택 입력 시 보여질 창 -->
                                          <div class="form-group has-success">
                                             <label class="control-label" for="task_anchorNum">객관식 갯수 : <span name="numSelectedBox"></span></label>
                                             <div class="form-group">
                                                <div class="selectBoxLayer1">
                                                   <div class="form-group has-warning" name="cloneSelectBox1">
                                                      <label class="control-label" for="inputWarning">객관식 질문 작성</label> 
                                                      <div name="name_cloneSelectBox">
                                                      <input type="text" class="form-control"
                                                         name="task_boxQue" placeholder="Q. 질문을 입력하세요." /><br />
                                                      </div>
                                                   </div>
                                                   
                                                </div>
                                                <a href="#holdonposition" name="addSelectBox">객관식 답안 추가하기 | </a>
                                                <a href="#holdonposition" name="subSelectBox">객관식 답안 삭제하기</a>
                                             </div>
                                          </div>

                                       </div>

                                    </div>
                                 </div>
                              </div>

                           </div>
                        
                           <a href="#holdonposition" class="btn btn-default"
                              id="clone_button" style="background: ##F8E0E0;">새 과제 추가하기</a>
                           <a href="#holdonposition" class="btn btn-default"
                              id="delete_wrapper" style="background: ##F8E0E0;">새 과제 삭제하기</a>
                        </div>
                     </div>
                     <!-- .panel-body -->
                  </div>
                  <!-- /.panel -->
               </div>
               <!-- /.col-lg-12 -->
            </div>
            <div class="row">
               <button type="reset" class="btn btn-default"
                  style="float: right; margin: 30px 10px; background: #F8E0E0;">설정 초기화</button>
               <button type="submit" class="btn btn-default"
                  style="float: right; margin: 30px 10px; background: #CEF6CE;">설정 완료</button>
            </div>
            <!-- /.col-lg-6 (nested) -->
         </div>
         <!-- /.row (nested) -->
      </div>
      <!-- /.panel-body -->
      </form>
</div>

<!-- jQuery -->
<script src="<%=cp%>/bootstrap2/js3/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=cp%>/bootstrap2/js3/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=cp%>/bootstrap2/js3/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=cp%>/bootstrap2/js3/sb-admin-2.js"></script>
<!-- bootstrap3 datepicker사용 위한 js -->
<script type='text/javascript' src='<%=cp%>/bootstrap2/js/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-1.9.1.js">
</script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js">
</script>
<script>
/*    var num = 0;
   $('#clone_wrapper').on("change", "select.cl_selectBox", function(event){
      jQuery("select[name='selectBox']").each(function(idx) {
         num++; alert("n : " + num + "idx : " + idx);
         $("select[name='selectBox']:eq("+idx+")").on("change", function(){
            alert("인덱스 : "+idx);
         });
         
      });
   }); */
   
   
   $('#clone_wrapper').on("change", "select[name='selectBox']", function(){
      /*
       * index : 같은 name속성을 가진 select 태그 중에 몇번째가 선택되었는지 숫자를 알려준다.
       * state : selectBox 이름을 가진 select 태그에서 선택한 value를 가져온다.
      */
      var index = $(this).index("select[name='selectBox']"); 
      var state = jQuery("select[name='selectBox']:eq("+index+") option:selected").val();
      //alert("aaa : " + state);
      
      if (state == 'simple text') {
         jQuery("div[name='selectLayer1']:eq("+index+")").show();
         jQuery("div[name='selectLayer2']:eq("+index+")").hide();
         jQuery("div[name='selectLayer3']:eq("+index+")").hide();
         jQuery("div[name='selectLayer4']:eq("+index+")").hide();
         jQuery("div[name='selectLayer5']:eq("+index+")").hide();
      } else if (state == 'recurd') {
         jQuery("div[name='selectLayer1']:eq("+index+")").hide();
         jQuery("div[name='selectLayer2']:eq("+index+")").show();
         jQuery("div[name='selectLayer3']:eq("+index+")").hide();
         jQuery("div[name='selectLayer4']:eq("+index+")").hide();
         jQuery("div[name='selectLayer5']:eq("+index+")").hide();
      } else if (state == 'slide') {
         jQuery("div[name='selectLayer1']:eq("+index+")").hide();
         jQuery("div[name='selectLayer2']:eq("+index+")").hide();
         jQuery("div[name='selectLayer3']:eq("+index+")").show();
         jQuery("div[name='selectLayer4']:eq("+index+")").hide();
         jQuery("div[name='selectLayer5']:eq("+index+")").hide();
      } else if (state == 'tree') {
         jQuery("div[name='selectLayer1']:eq("+index+")").hide();
         jQuery("div[name='selectLayer2']:eq("+index+")").hide();
         jQuery("div[name='selectLayer3']:eq("+index+")").hide();
         jQuery("div[name='selectLayer4']:eq("+index+")").show();
         jQuery("div[name='selectLayer5']:eq("+index+")").hide();
      } else if (state == 'box') {
         jQuery("div[name='selectLayer1']:eq("+index+")").hide();
         jQuery("div[name='selectLayer2']:eq("+index+")").hide();
         jQuery("div[name='selectLayer3']:eq("+index+")").hide();
         jQuery("div[name='selectLayer4']:eq("+index+")").hide();
         jQuery("div[name='selectLayer5']:eq("+index+")").show();
      } else {
         jQuery("div[name='selectLayer1']:eq("+index+")").show();
         jQuery("div[name='selectLayer2']:eq("+index+")").hide();
         jQuery("div[name='selectLayer3']:eq("+index+")").hide();
         jQuery("div[name='selectLayer4']:eq("+index+")").hide();
         jQuery("div[name='selectLayer5']:eq("+index+")").hide();
      }
      
   });
</script>
<script>
   jQuery('#selectBox2').change(function() {
      var state = jQuery('#selectBox2 option:selected').val();
   });
</script>
<script>
   $(function() {
      $("#datepicker1").datepicker(
            {
               changeYear : true,
               changeMonth : true,
               dateFormat : "yy-mm-dd",
               showMonthAfterYear : true,
               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                     '7월', '8월', '9월', '10월', '11월', '12월' ]

            });
   });
</script>
<script>
   $(function() {
      $("#datepicker2").datepicker(
            {
               changeYear : true,
               changeMonth : true,
               dateFormat : "yy-mm-dd",
               showMonthAfterYear : true,
               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                     '7월', '8월', '9월', '10월', '11월', '12월' ]

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
   $("#chkday_all").click(function() {
      if ($("#chkday_all").is(":checked")) {
         $(".chk_day").prop("checked", true);
      } else {
         $(".chk_day").prop("checked", false);
      }
   });

   $(".chk_day").click(function() {
      if ($("input[name='task_day']:checked").length == 7) {
         $("#chkday_all").prop("checked", true);
      } else {
         $("#chkday_all").prop("checked", false);
      }
   });
</script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
   //질문 추가하기 버튼
   /* 
   $('#clone_button').click(function() {
      $('#clone_wrapper div:first').clone().appendTo($('#clone_wrapper'));
   });
    */
    
    
   $('#clone_button').click(function() {
       var content = $('#main_content').clone(true);
      $('#clone_wrapper').append(content.show());
   });
   
   
   var remainNum = 1;

   $("#delete_wrapper").click(function() {
      remainNum = $("div[name='basic_group']").length;
      if (remainNum > 1)
         $('div[name=basic_group]').last().remove();
      else {
         alert("최소한 1개는 설정하셔야 합니다.");
      }
   });
   
   //5. 객관식 질문 작성 설정
   var countBoxNum = 1;
   
   $('#clone_wrapper').on("click", "a[name='addSelectBox']", function(){
      /*
       * index : 같은 name속성을 가진 a 태그 중에 몇번째가 선택되었는지 숫자를 알려준다.
      */
      var index = $(this).index("a[name='addSelectBox']"); 
      $("div[name='cloneSelectBox1']:eq("+index+") div:first").clone().appendTo($("div[name='cloneSelectBox1']:eq("+index+")"));   
      countBoxNum = $("div[name='cloneSelectBox1']:eq("+index+") input[name='task_boxQue']").length;
      $("span[name='numSelectedBox']:eq("+index+")").text(countBoxNum);
      
      
   });
   
/*    
   $("a[name='addSelectBox']").click(function(){
      $("div[name='cloneSelectBox1']:eq("+index+"div:first").clone().appendTo($("div[name='cloneSelectBox1']:eq("+index+")"));   
      countBoxNum = $("input[name='task_boxQue']").length;
      $("span[name='numSelectedBox']:eq("+index+")").text(countBoxNum);
   }); */
   
   $("#subSelectBox").click(function() {
      countBoxNum = $("input[name='task_boxQue']").length;
      if (countBoxNum > 1){
         $("div[name='name_cloneSelectBox']").last().remove();
         countBoxNum--;
         $('#numSelectedBox').text(countBoxNum);
      }else {
         alert("최소한 1개는 설정하셔야 합니다.");
      }
   });
   
   jQuery(document).ready(function($){
      $('#numSelectedBox').text(countBoxNum);
      $('#clone_button').trigger('click');
   });
   
   //changePoint ▲▼ 변화시키기
   var tempPoint = 1;
   $("#changePoint").click(function(){
      tempPoint++;
      if(tempPoint%2==0)
         $("#changePointValue").text('▼');
      else
         $("#changePointValue").text('▲');
   });
   
</script>



</body>

</html>