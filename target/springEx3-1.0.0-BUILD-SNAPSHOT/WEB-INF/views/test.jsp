<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String cp= request.getContextPath(); %> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SVQ 마음 건강 연구소</title>

    <!-- Bootstrap Core CSS -->
    <script src="<%=cp%>/bootstrap2/js3/chart.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    
 
</head>
 <body>


<canvas height="400" id="myChart" width="400">.</canvas>
   
<script type="text/javascript">
 var data = {
  labels : ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Partying", "Running"],
  datasets : [{
   fillColor : "rgba(220,220,220,0.5)",
   strokeColor : "rgba(220,220,220,1)",
   pointColor : "rgba(220,220,220,1)",
   pointStrokeColor : "#fff",
   data : [65, 59, 90, 81, 56, 55, 40]
  }, {
   fillColor : "rgba(151,187,205,0.5)",
   strokeColor : "rgba(151,187,205,1)",
   pointColor : "rgba(151,187,205,1)",
   pointStrokeColor : "#fff",
   data : [28, 48, 40, 19, 96, 27, 100]
  }]
 };
 var ctx = $("#myChart").get(0).getContext("2d");
 new Chart(ctx).Radar(data);
  
</script>


</body>
</html>