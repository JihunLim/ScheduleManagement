<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/TopMenu.jsp"%>
        <div id="page-wrapper">
           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">위치 트래킹 설정 </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           현재 트래킹 중인 내담자
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>트래킹 시작일</th>
                                        <th>트래킹 변경</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach items="${list}" var="dto">
					
                                    <tr class="odd gradeX">
                                        <td>${dto.cuser_id} </td>
                                        <td>20180108</td>
                                         <td><button type="button" class="btn btn-default" onclick="location.href='UpdateTrackClient.do?cuser_id=${dto.cuser_id}&cuser_tracking=${dto.cuser_tracking} ' ">트래킹 중지</button></td>
                                          </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                         
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
              <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           현재 트래킹 하지 않는 내담자
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                       <th>트래킹 변경</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${nlist}" var="ndto">
					
                                    <tr class="odd gradeX">
                                        <td>${ndto.cuser_id} </td>
                                         <td><button type="button" class="btn btn-default" onclick="location.href='UpdateTrackClient.do?cuser_id=${ndto.cuser_id}&cuser_tracking=${ndto.cuser_tracking} ' ">트래킹 시작</button></td>
                                       
                 				   </tr>
                                    </c:forEach>
                                </tbody>
                                
                            </table>
                         
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
