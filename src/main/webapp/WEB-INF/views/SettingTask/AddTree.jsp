
<!DOCTYPE html>
<html lang="utf-8">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Hacktory 솔루션 관리 콘솔</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron-narrow.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script>
		function MyPageAct () {
			var sid = 1;
			var form = document.createElement("form");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "MyPage.php");
		 
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "sid");
			hiddenField.setAttribute("value", sid);
	 
			form.appendChild(hiddenField);
		 
			document.body.appendChild(form);
			form.submit();			
		}
	</script>
  </head>

  <body>

    <div class="container">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation"><a href="index.php">Home</a></li>
            <li role="presentation"><a href="board.php">Notice</a></li>
            <li role="presentation" class="active"><a href="javascript:MyPageAct()">MyPage</a></li>
				<li role="presentation"><a href="Logout.php">Logout</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Hacktory Solution</h3>
      </div>

      <div class="row marketing">
		<ol class="breadcrumb">
		  <li  class="active">"<b>guest1</b>" 님의 방문을 환영합니다.</li>
		</ol>
<!--
	2015.05.27 작업
	1 ~ 1000 : 게스트 계정
	5000 ~ 6000 : 인가 계정
-->
		<form class="form-horizontal">
		 <div class="form-group">
			<label for="id" class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="id" placeholder="ID" value="guest1" disabled>
			</div>
		  </div>
		  <div class="form-group">
			<label for="password" class="col-sm-2 control-label">패스워드</label>
			<div class="col-sm-10">
			  <input type="password" class="form-control" id="password" placeholder="Password" value="guest1" disabled>
			</div>
		  </div>
		 <div class="form-group">
			<label for="name" class="col-sm-2 control-label">이름</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="name" placeholder="NAME" value="게스트 1" disabled>
			</div>
		  </div>
		 <div class="form-group">
			<label for="address" class="col-sm-2 control-label">주소</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="address" placeholder="ADDRESS" value="미입력" disabled>
			</div>
		 </div>
		 <div class="form-group">
			<label for="sex" class="col-sm-2 control-label">성별</label>
			<div class="col-sm-10">
			  <input type="text" class="form-control" id="sex" placeholder="SEX" value="미입력" disabled>
			</div>
		 </div>
		</form>
	  </div>
	
      <footer class="footer">
        <p>&copy; Company 2015 HackTory Korea</p>
      </footer>

    </div> <!-- /container -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
	    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
