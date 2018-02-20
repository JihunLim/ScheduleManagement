<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- Write -->
				
			
				<div class="container">
			<!-- 사무실 점검항목 보안점수 (레이다그래프) -->
			<label for="myChart1"><h3>□ 사무실 점검항목 보안점수</h3>
				<br /></label>
			<div class="row">
				<!-- Bar Chart -->
				<canvas id="bar-chart-grouped"></canvas>

				<script>
				

					var ctx = document.getElementById('bar-chart-grouped');
					var myChart = new Chart(ctx,
							{
								type : 'bar',
								data : {
									labels : [ '1900','1950','1999','2050' ],
									  datasets: [
									        {
									          label: "Africa",
									          backgroundColor: "#3e95cd",
									          data: [133,221,783,2478]
									        }, {
									          label: "Europe",
									          backgroundColor: "#8e5ea2",
									          data: [408,547,675,734]
									        }
									      ]
									             
									             
								},
								 options: {
								      title: {
								        display: true,
								        text: 'Population growth (millions)'
								      }
								    }
							});
				</script>
			</div>
			</div>

</body>

</html>