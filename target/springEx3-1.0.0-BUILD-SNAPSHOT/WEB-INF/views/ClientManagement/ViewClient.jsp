<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="/WEB-INF/views/TopMenu.jsp"%>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">특정 내담자 정보보기</h1>
                </div>
               </div>
            </br>  
            <div class="row">
             <div class="col-lg-4">
             <form name='frm' method="post" action="<%=cp%>/ViewClient.do">

                 <div class="input-group custom-search-form">
                                <input type="text" name=search class="form-control" placeholder="내담자 아이디로 검색...">
                                
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                
                                
                                    <i class="fa fa-search"></i>
                                </button>
                           		 </span>
                            </div>
                            </form>
                     </div>
               
            </div> 
             <!-- /.col-lg-4 -->
            </br>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Tabs
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                             <li class="active"><a href="#client" data-toggle="tab">내담자 정보</a>
                                </li>
                                <li ><a href="#ctask" data-toggle="tab">과제 부여</a>
                                </li>
                                <li><a href="#mangerinfo" data-toggle="tab">관련 담당자</a>
                                </li>
                               
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                            
                               <div class="tab-pane fade in active" id="client">
                                    </br>
                                    <!-- list배열의 0번째 요소에서 clientName 정보를 가져옴 -->
                                    <h4>${list[0].cuser_name} 님의 상세 정보</h4>
                                    <p>이름: ${list[0].cuser_name}</p>
                                    <p>나이: 만 ${list[0].cuser_age}세</p>
                                    <p>성별: ${list[0].cuser_gender}</p>
                                    <p>생년월일: ${list[0].cuser_birth}</p>
                                    <p>등록일: 2018-01-01</p>
                                    
                                    </br>
                                    <p>연락처 : ${list[0].cuser_phone}</p>
                                    <p>e-mail :${list[0].cuser_email} </p>
                                 
                                </div>
                                
                                 <div class="tab-pane fade" id="ctask">
                                    </br>
                                    <!-- list배열의 0번째 요소에 해당하는 과제 진행 현황 가져오기 -->
                                        <div class="panel panel-default">
                      
                     <div class="panel-heading">
                            현재 진행중인 과제
                        </div>
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>과제명</th>
                                        <th>과제 진행률</th>
                                        <th>과제 부여</th>
                             		 </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ctlist}" var="dto">
					
                                    <tr class="odd gradeX">
                                        <td>${dto.ctk_taskName}</td>
                                        <td>0%</td>
                                         <td><button type="button"  onclick="location.href='DeleteTaskClient.do?ctk_taskName=${dto.ctk_taskName}&ctk_userId=${dto.ctk_userId }'" class="btn btn-default">중단!</button></td>
                                     
                                    </tr>
                                </c:forEach>
                            
                                </tbody>
                            </table>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    
                     <div class="panel panel-default">
                      
                     <div class="panel-heading">
                           생성된 과제 목록
                        </div>
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>과제명</th>
                                        <th>진행여부</th>
                             		 </tr>
                                </thead>
                                <tbody>
                                
                                 <c:forEach items="${tasklist}" var="dto">
                                    <tr class="odd gradeX">
                                        <td>${dto.task_name}</td>
                                         <td><button type="button"  onclick="location.href='InsertTaskClient.do?ctk_taskName=${dto.task_name}&ctk_userId=${list[0].cuser_id}'" class="btn btn-default">시작!</button></td>
                                     
                                    </tr>
                                </c:forEach>
                            
                                </tbody>
                            </table>
                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                                </div>
                             
                                <div class="tab-pane fade" id="mangerinfo">
                                    </br>
                                    <h4>담당자 정보</h4>
                                    <p>이름: ${userlist[0].user_name }</p>
                                    <p>소속: ${userlist[0].user_hospital }</p>
                                    
                                    </br>
                                    <p>연락처 : 010-0000-0000</p>
                                    <p>e-mail : ${userlist[0].user_email}</p>
                                </div>
                              
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
          
         <!-- /.row -->
              
                <div class="col-lg-7">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Tabs
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#list" data-toggle="tab">리스트</a>
                                </li>
                                <li><a href="#cal" data-toggle="tab">캘린더</a>
                                </li>
                                <li><a href="#graph" data-toggle="tab">그래프</a>
                                </li>
                                <li><a href="#map" data-toggle="tab">행동반경</a>
                                </li>
                                
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="list">
                              <div class="panel panel-default">
                      
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>과제 게시 날짜</th>
                                        <th>과제명</th>
                                        <th>지시문</th>
                                        <th>수행결과</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>2018-01-01</td>
                                        <td>test1</td>
                                        <td>지시문을 입력</td>
                                        <td>미완료</td>
                                      
                                    </tr>
                                    <tr class="even gradeC">
                                       <td>2018-01-01</td>
                                        <td>test1</td>
                                        <td>지시문을 입력</td>
                                        <td>미완료</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                       <td>2018-01-03</td>
                                        <td>test1</td>
                                        <td>지시문을 입력</td>
                                        <td>미완료</td>
                                        
                                    </tr>
                                
                                    
                                  
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                                </div>
                              
                                <div class="tab-pane fade" id="cal">
                                       <div class="col-lg-6">
                                    <div id='calendar'></div>
                                </div>
                                </div>
                                
                                
                                
                                <div class="tab-pane fade" id="graph">
                                  <div class="panel panel-default">
				                     
				                     
				<div class="container">
			<!-- 사무실 점검항목 보안점수 (레이다그래프) -->
	
			<div class="col-lg-7">
				<!-- Bar Chart -->
				<canvas id="bar-chart-grouped"></canvas>

				<script>
				

					var ctx = document.getElementById('bar-chart-grouped');
					var myChart = new Chart(ctx,
							{
								type : 'bar',
								data : {
									labels : [ '1월','2월','3월','4월','5월','6월' ],
									  datasets: [
									        {
									          label: "positive",
									          backgroundColor: "#3e95cd",
									          data: [10,9,8,9,7,6]
									        }, {
									          label: "nagative",
									          backgroundColor: "#8e5ea2",
									          data: [7,6,8,9,10]
									        }
									      ]
									             
									             
								},
								 options: {
								      title: {
								        display: true,
								        text: 'Population 정서 (millions)'
								      }
								    }
							});
				</script>
			</div>
			</div>
				                      
				                    </div>
                                </div>
                                <div class="tab-pane fade" id="map">
                                    <h4>행동반경</h4>
                                   
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
             
                <!-- /.col-lg-8 -->
            </div>
            </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 mx-auto text-center">
            <h2 class="section-heading">Let's Get In Touch!</h2>
            <hr class="my-4">
            <p class="mb-5">기관명: KU 마음 건강 연구소</p>
            <p class="mb-5">주소: 서울시 성북구 안암로 145 고려대학교 홍보관 212호 | TEL: 02-3290-1676</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
            <p>123-456-6789</p>
          </div>
          <div class="col-lg-6 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">kumh@korea.ac.kr</a>
            </p>
          </div>
        </div>
      </div>
    </section>
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

    <!-- DataTables JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/jquery.dataTables.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/dataTables.bootstrap.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/sb-admin-2.js"></script>


 	<!-- Morris Charts JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/raphael.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/morris.min.js"></script>
   
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
    
	<script>
	$(function() {
	 new Morris.Bar({
	        element: 'morris-bar-chart',
	        data: [{
	            y: '01',
	            a: 100,
	            b: 90
	        }, {
	            y: '02',
	            a: 75,
	            b: 65
	        }, {
	            y: '03',
	            a: 50,
	            b: 40
	        }, {
	            y: '04',
	            a: 75,
	            b: 65
	        }, {
	            y: '05',
	            a: 50,
	            b: 40
	        }, {
	            y: '06',
	            a: 75,
	            b: 65
	        }],
	        xkey: 'y',
	        ykeys: ['a', 'b'],
	        labels: ['우울', '행복'],
	        hideHover: 'auto',
	        resize: true
	    
	    });
	});
	</script>
	<script src='<%=cp%>/bootstrap2/js3/jquery-ui.min.js'></script>
<script src='<%=cp%>/bootstrap2/js3/jquery-ui.custom.min.js'></script>
<script src='<%=cp%>/bootstrap2/js3/fullcalendar.min.js'></script>
<script>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'task1 수행',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'task2 수행',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: '위치 과제 수행',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: '정서 과제 수행',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'task3 수행',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
	});

</script>
<style>

	#calendar {
		width: 700px;
		margin: 0 auto;
		}

</style>
</body>

</html>
