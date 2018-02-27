<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>
<link rel = "stylesheet" href = "https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 <link rel="stylesheet" type="text/css" href="<%=cp%>/bootstrap2/css/timepicki.css"/>
 <link rel="stylesheet" href="<%=cp%>/bootstrap2/css3/bootstrap-treeview.min.css"/>
 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">트리 출력</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

    <div class="container">
    <div id="tree"> </div>
  </div>
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
	<script type='text/javascript'src='<%=cp%>/bootstrap2/js/jquery.min.js'></script>
	
	<script src = "https://code.jquery.com/jquery-1.9.1.js"> </script>
	<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"> </script>

	<!--bootstrap tree view 라이브러리 사용위한 js  -->
	<script src="<%=cp%>/bootstrap2/js3/bootstrap-treeview.min.js"></script>
	<script>
	var mytree = [
		  {
		    text: "긍정",
		    nodes: [
		      {
		        text: "기쁨",
		        nodes: [
		          {
		            text: "기쁨 1"
		          },
		          {
		            text: "기쁨 2"
		          }
		        ]
		      },
		      {
		        text: "즐거움"
		      },
		      {
			        text: "만족"
			      },
			      {
				        text: "뿌듯"
				      },
		    ]
		  },
		  {
		    text: "부정",
		    nodes:[
		    	{
		    		text:"두려움"
		    	},
		    	{
		    		text:"화남"
		    	},
		    	{
		    		text:"불쾌"
		    	},
		    	{
		    		text:"지루"
		    	},
		    	{
		    		text:"슬픔"
		    	}
		    ]
		  }
		  
		];
	$('#tree').treeview({data: mytree});
	</script>
	

	
</body>

</html>
