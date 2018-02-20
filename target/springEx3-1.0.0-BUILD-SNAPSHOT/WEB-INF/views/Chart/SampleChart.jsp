<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/TopMenu.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">데이터 통계</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            내담자 통계1    과제 부여 상황
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           	<div class="row">
				<!-- Bar Chart -->
				<canvas id="doughnut-chart" width="800" height="450"></canvas>

				<script>
				
					var ctx = document.getElementById('doughnut-chart');
					var myChart = new Chart(ctx,
							{
								type : 'doughnut',
								data : {
									labels :["위치 트래킹 과제", "task1", "task2", "task3", "task4"],
									 datasets: [
									        {
									          label: "Population (millions)",
									          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
									          data: [2478,5267,734,784,433]
									        }
									      ]
								},
								 options: {
								      title: {
								        display: true,
								        text: '내담자 과제 포함 비율'
								      }
								    }
							});
				</script>
			</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                   	<div class="panel panel-default">
                        <div class="panel-heading">
                        		 내담자 통계2 과제 진행률
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

					<p id="contentView">
					
						<div class="row">
							<!-- Bar Chart -->
							<canvas id="bar-chart-horizontal" width="800" height="450"></canvas>
							<script>
								
								
								var ctx = document.getElementById("bar-chart-horizontal").getContext('2d');
								var myChart = new Chart(ctx, {
									type : 'horizontalBar',
									data : {
										labels : ["위치 트래킹 과제", "task1", "task2", "task3", "task4"],
										 datasets: [
										        {
										          label: "Percentage (millions)",
										          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
										          data: [2478,5267,734,784,433]
										        }
										      ]
									},
									options: {
									      legend: { display: false },
									      title: {
									        display: true,
									        text: '내담자 과제 평균 진행률'
									      }
									    }
								});
								
								</script>
						</div>
					</p>
		
                </div>
                </div>
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         내담자 통계3    내담자 정서 분포
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
                          
			<div class="row">
				<!-- Bar Chart -->
				<canvas id="radar-chart" width="800" height="450"></canvas>

				<script>
				

					var ctx = document.getElementById('radar-chart');
					var myChart = new Chart(ctx,
							{
								type : 'radar',
								data : {
									labels: ["위치 트래킹 과제", "task1", "task2", "task3", "task4"],
									  datasets: [
									        {
									          label: "긍정",
									          fill: true,
									          backgroundColor: "rgba(179,181,198,0.2)",
									          borderColor: "rgba(179,181,198,1)",
									          pointBorderColor: "#fff",
									          pointBackgroundColor: "rgba(179,181,198,1)",
									          data: [8.77,55.61,21.69,6.62,6.82]
									        }, {
									          label: "부정",
									          fill: true,
									          backgroundColor: "rgba(255,99,132,0.2)",
									          borderColor: "rgba(255,99,132,1)",
									          pointBorderColor: "#fff",
									          pointBackgroundColor: "rgba(255,99,132,1)",
									          pointBorderColor: "#fff",
									          data: [25.48,54.16,7.61,8.06,4.45]
									        }
									      ]
								},
								  options: {
								      title: {
								        display: true,
								        text: 'Positive vs Nagative'
								      }
								    }
							});
				</script>
			</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           내담자 통계4 내담자 평균 응답률
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <!-- 월별 부서 보안점수 (꺽은선그래프) -->
			<label for="myChart3">
				</label>
			<div class="row">
				<!-- Bar Chart -->
				<canvas id="line-chart" width="800" height="450"></canvas>

				<script>
					
					var ctx = document.getElementById('line-chart').getContext(
							'2d');
					var myChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels: [1,2,3,4,5,6,7,8,9,10],
							 datasets: [{ 
							        data: [86,114,106,106,107,111,133,221,783,2478],
							        label: "Gps",
							        borderColor: "#3e95cd",
							        fill: false
							      }, { 
							        data: [282,350,411,502,635,809,947,1402,3700,5267],
							        label: "task1",
							        borderColor: "#8e5ea2",
							        fill: false
							      }, { 
							        data: [168,170,178,190,203,276,408,547,675,734],
							        label: "task2",
							        borderColor: "#3cba9f",
							        fill: false
							      }, { 
							        data: [40,20,10,16,24,38,74,167,508,784],
							        label: "task3",
							        borderColor: "#e8c3b9",
							        fill: false
							      }, { 
							        data: [6,3,2,2,7,26,82,172,312,433],
							        label: "task4",
							        borderColor: "#c45850",
							        fill: false
							      }
							    ]
							  },
							  options: {
								    title: {
								      display: true,
								      text: 'Percentage Of Response'
								    }
								  }
					});
				</script>
			</div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
              
            </div>
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

    <!-- DataTables JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/jquery.dataTables.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/dataTables.bootstrap.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/sb-admin-2.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<%=cp%>/bootstrap2/js3/raphael.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/morris.min.js"></script>
    <script src="<%=cp%>/bootstrap2/js3/morris-data.js"></script>

 
</body>

</html>
