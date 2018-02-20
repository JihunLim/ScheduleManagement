<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/TopMenu.jsp"%>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">전체 내담자 정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>성별</th>
                                        <th>나이</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>등록 과제 그룹</th>
                                        <th>전체 과제 수</th>
                                        <th>수행 과제 수</th>
                                        <th>수행률</th>
                                        <th>자세히</th>
                                        <th>정보 삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="dto">
					
                                    <tr class="odd gradeX">
                                        <td>${dto.cuser_name}</td>
                                        <td>${dto.cuser_gender}</td>
                                        <td>만 ${dto.cuser_age} 세</td>
                                        <td>${dto.cuser_phone}</td>
                                        <td>${dto.cuser_email}</td>
                                        <td>null</td>
                                        <td>12</td>
                                        <td>12</td>
                                        <td>100%</td>
                                        <td>null</td>
                                        <td>null</td>
                                    </tr>
                                   </c:forEach>
                                  
                                </tbody>
                            </table>
                         
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
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
            </div>
         

   
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
