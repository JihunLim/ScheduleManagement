<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/TopMenu.jsp"%>
        <div id="page-wrapper">
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">전체 트리 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           현재 생성된 트리
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>생성일</th>
                                        <th>상태</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach items="${list}" var="dto">
					
                                    <tr class="odd gradeX">
                                        <td><a href="Tree.do">${dto.name}</a></td>
                                        <td>20180108</td>
                                         <td><button type="button" class="btn btn-default" onclick="location.href='Tree.do' ">트리 삭제</button></td>
                                          </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                           <button type="button" class="btn btn-default"  style="float: right; margin: 30px 10px;" onclick="location.href='TreeAjaxTest.do' ">트리 생성</button>
                             </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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
	<script type='text/javascript'src='<%=cp%>/bootstrap2/js/timepicki.js'></script>
	
</body>

</html>
