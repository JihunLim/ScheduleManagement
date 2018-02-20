<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String cp= request.getContextPath(); %> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SVQ 마음 건강 연구소</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=cp%>/bootstrap2/css3/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=cp%>/bootstrap2/css3/metisMenu.min.css" rel="stylesheet">

 	<!-- DataTables CSS -->
    <link href="<%=cp%>/bootstrap2/css3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=cp%>/bootstrap2/css3/dataTables.responsive.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="<%=cp%>/bootstrap2/css3/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=cp%>/bootstrap2/css3/font-awesome.min.css" rel="stylesheet" type="text/css">

 	<!-- Morris Charts CSS -->
    <link href="<%=cp%>/bootstrap2/css3/morris.css" rel="stylesheet">
    
    <!-- Full Calender -->
    
	<link href='<%=cp%>/bootstrap2/css3/fullcalendar.css' rel='stylesheet' />
	<link href='<%=cp%>/bootstrap2/css3/fullcalendar.print.css' rel='stylesheet' media='print' />

</head>


<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Dashboard.do">SVQ 마음 건강 연구소</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	 <li><s:authentication property="name"/>님, 안녕하세요. </li>
            	 <li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
            </ul>
           	
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                       
                        <li>
                            <a href="Dashboard.do"><i class="fa fa-dashboard fa-fw"></i> 대시보드</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="SampleChart.do">전체 통계 </a>
                                </li>
                             
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 내담자 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ClientTable.do">전체 내담자 정보 관리</a>
                                </li>
                                <li>
                                    <a href="ViewClient.do">특정 내담자 정보보기</a>
                                </li>
                                <li>
                                    <a href="ClientJoin.do">새 내담자 계정 생성</a>
                                </li>
                              	<li>
                                    <a href="#">내담자 관리 메뉴얼</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pencil fa-fw"></i> 내담자 과제 설정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ViewAllTask.do">전체 과제 정보 보기</a>
                                </li>
                                <li>
                                    <a href="AddNewTask.do">새 과제 생성하기</a>
                                </li>
                                   <li>
                                    <a href="AddNewServey.do">새 설문 생성하기</a>
                                </li>
                                <li>
                                    <a href="AllTree.do">전체 트리 관리</a>
                                </li>
                                 
                                <li>
                                    <a href="SetTracking.do">위치 트래킹 설정</a>
                                </li>
                              	<li>
                                    <a href="#">과제 설정 메뉴얼</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-database fa-fw"></i> 데이터 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ManageToTask.do">과제 별 관리</a>
                                </li>
                                <li>
                                    <a href="ManageToClient.do">내담자 별 관리</a>
                                </li>
                              	
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.do">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
  